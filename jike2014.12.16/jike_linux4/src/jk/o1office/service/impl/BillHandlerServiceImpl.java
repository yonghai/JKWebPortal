package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jk.o1office.cache.OrderCache;
import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.dao.OrderDao;
import jk.o1office.dao.ReceiveBillDao;
import jk.o1office.domin.UnFinshOrder;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.domin.IDAndPrice;
import jk.o1office.service.BillHandlerService;
import jk.o1office.service.OrderService;
import jk.o1office.service.ProductService;
import jk.o1office.service.VersionService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

public class BillHandlerServiceImpl implements BillHandlerService {
	private OrderDao orderDao;
	private ReceiveBillDao receiveBillDao;
	private ProductService productService;
	private VersionService versionService;
	private OrderService orderService;
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public VersionService getVersionService() {
		return versionService;
	}
	public void setVersionService(VersionService versionService) {
		this.versionService = versionService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	public ReceiveBillDao getReceiveBillDao() {
		return receiveBillDao;
	}
	public void setReceiveBillDao(ReceiveBillDao receiveBillDao) {
		this.receiveBillDao = receiveBillDao;
	}

	/**
	 * 配送员完成备货，将该订单标志为已备货，并将该订单存入配送员订单表
	 */
	public String billCompleted(String orderid, String token)throws TokenException,Exception {
		if(orderDao.isReceived(orderid)){/*如果订单被接*/
			return "{\"success\":false,\"emsg\":\"该订单已经被抢\",\"token\":\""+token+"\"}";
		}else{
		//	orderDao.updateBillStatus(orderid,1);
			//如果该订单已经接受过并取消则不允许接单
			if(receiveBillDao.isCancled(orderid,IDGenertor.getUserID(token))){
				return "{\"success\":false,\"emsg\":\"该订单你已取消，不允许再次接此单\",\"token\":\""+token+"\"}";
			}else{
				orderDao.updateBill(orderid, 1, IDGenertor.getUserID(token));
				receiveBillDao.saveSubmitBill(orderid,IDGenertor.getUserID(token));
				//订单被接时，删除缓存中的该订单
				OrderCacheUtil.remove(orderid);
				return "{\"success\":true,\"emsg\":\"成功抢单\",\"token\":\""+token+"\"}";
			}
		}
	}
	/**
	 * 配送员取消接受订单
	 * 将订单表里面的状态标记为未处理状态，
	 * 并将配送员订单表中该订单标记为取消订单
	 */
	public String cancelBill(String orderid, String reason, String token)throws Exception {
		orderDao.updateBill(orderid, 0, 0);
	//	receiveBillDao.moveBillToCancelBill(orderid,reason);
	//	receiveBillDao.deleteBill(orderid);
		receiveBillDao.cancelReceiveBill(orderid,reason);
		//取消订单的处理，将该订单重新放入缓存中
		jk.o1office.domin.Order order = orderDao.getOrderByID(orderid);
		OrderCacheUtil.put(orderid, 
				new OrderCache(orderService.getShopsIds(Integer.parseInt(""+order.getDelivery_address_id())), 
						order.getCreatetime()));
		return "{\"success\":true,\"emsg\":\"取消备货成功\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 完成订单
	 * 1.将订单表中状态改为已经完成状态
	 * 2.将配送员订单表中订单改为已配送
	 * 3.更新该商品的购买次数
	 */
	public String billCompleted(String orderid, String code, String token)
			throws Exception {
		//验证该订单的验证码
		if(orderDao.checkBill(orderid,code)){
			//更改订单表中的订单状态
			orderDao.updateBillStatus(orderid, 2);
			//更改配送员接单表中的订单状态
			receiveBillDao.updateReceivedBillStatus(orderid,2);
			//更新商品购买次数统计表的统计次数(有误)
			productService.updateProductCount(orderid);
			//更新用户购买商品的记录表
			productService.updateProductRecord(orderid);
			return "{\"success\":true,\"emsg\":\"订单交易成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"验证码与订单不符\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 交易失败(3=交易失败)
	 */
	public String billFature(String orderid, String reason, String token)
			throws Exception {
		orderDao.updateBillStatus(orderid, 3);
		receiveBillDao.failtureReceiveBill(orderid, reason);
		return "{\"success\":true,\"emsg\":\"交易失败\",\"token\":\""+token+"\"}";
	}
	
	public String getUnFinshOrder(String token) throws TokenException,
			Exception {
		List<UnFinshOrder> unFinshOrders = orderDao.getUnFinshOrder(IDGenertor.getUserID(token));
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "配送员未处理成功订单");
		map.put("token",token);
		map.put("data", unFinshOrders);
		return JsonHandler.MapToJson(map);
	}
	
	/**
	 * 返回配送员今天的配送信息
	 * 1.接单的数量(已配送完成)
	 * 2.订单交易总额
	 * 3.配送员所在区域还剩多少订单未处理
	 */
	public String getToDayData1(String token) throws TokenException,Exception{
		int userid = IDGenertor.getUserID(token);
		//今天交易的订单，已完成
		int todaynum = receiveBillDao.getTodayNum(userid);
		//获取今天完成订单的总价格
		String price = receiveBillDao.getTodayPrice(userid);
		
		//获取该配送员所属商家的所属区域的剩余订单数量(包括今天之前的订单)
		int moreordernum = orderDao.getMoreOrderNum(userid);
		//是否有正在处理的订单
		boolean ishas = receiveBillDao.hasHandlerOrder(userid);
		//配送员的配送时间
		String[] times = versionService.getDeliveryTime();
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "配送员今儿配送详情");
		map.put("token", token);
		map.put("ordernum", todaynum);
		map.put("allprice", price);
		map.put("moreordernum", moreordernum);
		map.put("ishas", ishas);
		map.put("deliverytimer", times[0]);
		map.put("starttime", times[1]);
		map.put("endtime", times[2]);
		return JsonHandler.MapToJson(map);
	}

	public String getToDayData(String token) throws TokenException,Exception{
		int userid = IDGenertor.getUserID(token);
		//今天交易的订单，已完成
		int todaynum = receiveBillDao.getTodayNum(userid);
		//获取今天完成订单的总价格
		String price = receiveBillDao.getTodayPrice(userid);
		
		//获取该配送员所属商家的所属区域的剩余订单数量(包括今天之前的订单)
		int moreordernum = orderDao.getMoreOrderNum(userid);
		//是否有正在处理的订单
		boolean ishas = receiveBillDao.hasHandlerOrder(userid);
		//配送员的配送时间
		String[] times = versionService.getDeliveryTime();
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "配送员今儿配送详情");
		map.put("token", token);
		map.put("ordernum", todaynum);
		map.put("allprice", price);
		map.put("moreordernum", moreordernum);
		map.put("ishas", ishas);
		map.put("deliverytimer", times[0]);
		map.put("starttime", times[1]);
		map.put("endtime", times[2]);
		return JsonHandler.MapToJson(map);
	}

	
}
