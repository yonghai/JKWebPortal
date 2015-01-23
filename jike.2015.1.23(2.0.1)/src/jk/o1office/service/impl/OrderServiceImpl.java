package jk.o1office.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.dao.OrderDao;
import jk.o1office.domin.AllOrderInfo;
import jk.o1office.domin.DOrderDetail;
import jk.o1office.domin.HAllOrderInfo;
import jk.o1office.domin.HOrder;
import jk.o1office.domin.HQTOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.QTOrder;
import jk.o1office.excetion.TokenException;
import jk.o1office.push.JPush;
import jk.o1office.service.AddressService;
import jk.o1office.service.DeviceService;
import jk.o1office.service.OrderService;
import jk.o1office.service.ProductService;
import jk.o1office.service.ShopsService;
import jk.o1office.service.UserService;
import jk.o1office.service.VersionService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

import org.apache.log4j.Logger;

import com.qiniu.api.config.Token;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	private ProductService productService;
	private VersionService versionService;
	private UserService userService;
	private ShopsService shopsService;
	private AddressService addressService;
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	private Logger logger = Logger.getLogger("OrderServiceImpl");
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private CustomerAddressService customerAddressService;
	public CustomerAddressService getCustomerAddressService() {
		return customerAddressService;
	}
	public void setCustomerAddressService(
			CustomerAddressService customerAddressService) {
		this.customerAddressService = customerAddressService;
	}
	private DeviceService deviceService;
	public DeviceService getDeviceService() {
		return deviceService;
	}
	public void setDeviceService(DeviceService deviceService) {
		this.deviceService = deviceService;
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

	
	/**
	 *	保存订单的信息	 
	 */
	public String saveOrders(AllOrderInfo allOrderInfo, List list, String token) throws Exception{
		//如果提交订单的价格正确，则保存订单
		if(checkPrice(list)){
			String code = IDGenertor.randomCode();
			allOrderInfo.setCheckcode(code);
			String[] prices = versionService.getPrices("customer");//lowprice,deliveryprice,deliveryrange
			//如果费用低于lowprice，则不予配送给出提示
			if(Double.parseDouble(allOrderInfo.getTotal_price())<Double.parseDouble(prices[0])){
				return "{\"success\":false,\"emsg\":\"价格低于"+prices[0]+"不予配送\",\"token\":\""+token+"\"}";
			}
			addressService.setDefaultAddress(allOrderInfo.getAddressid(), token);
			orderDao.save(allOrderInfo);
			
			for(Object o : list){
				Order od = (Order)o;
				od.setOrderid(allOrderInfo.getOrderid());
				orderDao.save(od);
			}
			return "{\"success\":true,\"emsg\":\"订单提交成功\",\"token\":\""+token+"\",\"code\":"+code+"}";
		}else{
			return "{\"success\":false,\"emsg\":\"订单商品价格异常\",\"token\":\""+token+"\"}";
		}
	}
	
	
	/**
	 * 提交订单时，检查所有商品的价格是否准确
	 * @return
	 */
	private boolean checkPrice(List list){
		for(Object o : list){
			Order od = (Order)o;
			boolean b =  productService.checkPrice(od.getProduct_id(),od.getProduct_price());
			//如果价格不正确，跳出循环，返回false
			if(!b){
				return false;
			}
		}
		return true;
	}
	
	private AllOrderInfo getOrderByID(String orderid) throws Exception{
		return orderDao.getOrderByID(orderid);
	}
	
	private List getOrderDetails(String orderid) throws Exception{
		return orderDao.getOrderDetails(orderid);
	}
	
	/**
	 * 根据订单id查询订单
	 */
	/*public String getOrderByID(String orderid,String time, String token) {
		Object[] orderinfo = getOrderInfoByID(orderid);
		return JsonHandler.MapToJson(getMap(true,"订单详情",token,orderinfo));
	}*/
	
	/**
	 * 根据订单id查询订单的详细信息
	 */
	public String getOrderByID(String orderid,String time,String token) throws Exception{
		//Object[] o = orderDao.getOrderDetails(orderid,time);
		List<Order> orders = orderDao.getOrderDetails(orderid, time);
		if(time.equals("1")){
			AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
			return JsonHandler.MapToJson(getMap(true,"订单详情",token, orders, JsonHandler.ObjectToJson(info, new String[]{"" +
					"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
					"orderid","ordertype","deliveryprice","customerid","bill_status"})));
		}else{
			HAllOrderInfo info = orderDao.getHAllOrderInfoByID(orderid);
			return JsonHandler.MapToJson(getMap(true,"订单详情",token, orders, JsonHandler.ObjectToJson(info, new String[]{"" +
					"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
					"orderid","ordertype","deliveryprice","customerid","bill_status"})));
		}
		
	}

	public String getOldOrderByID(String orderid,String time,String token) throws Exception{
		//Object[] o = orderDao.getOrderDetails(orderid,time);
		if(time.equals("1")){
			AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
			if(null==info)
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有该订单\"}";	
			if(info.getOrdertype()==1){
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"查看语音订单，请更新版本\"}";	
			}else if(info.getOrdertype()==2){
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"查看文字订单，请更新版本\"}";
			}else{
				List<Order> orders = orderDao.getOrderDetails(orderid, time);
			//	AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
				return JsonHandler.MapToJson(getMap(true,"订单详情",token, orders, JsonHandler.ObjectToJson(info, new String[]{"" +
						"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
						"orderid","ordertype","deliveryprice","customerid","bill_status"})));
			}
		}
		else{
			HAllOrderInfo info = orderDao.getHAllOrderInfoByID(orderid);
			if(null==info)
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有该订单\"}";	
			if(info.getOrdertype()==1){
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"查看语音订单，请更新版本\"}";	
			}else if(info.getOrdertype()==2){
				return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"查看文字订单，请更新版本\"}";
			}else{
				List<Order> orders = orderDao.getOrderDetails(orderid, time);
			//	AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
				return JsonHandler.MapToJson(getMap(true,"订单详情",token, orders, JsonHandler.ObjectToJson(info, new String[]{"" +
						"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
						"orderid","ordertype","deliveryprice","customerid","bill_status"})));
			}
		}
	}
	
	private Object[] getOrderInfoByID(String orderid) throws Exception{
		return orderDao.getOrderInfoByID(orderid);
	}
	
	
	private Map getMap(boolean isscuss,String emsg,String token,Object data,Object info){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		map.put("info", info);
		return map;
	}
	
	private Map getMap(boolean isscuss,String emsg,String token,Object data){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		return map;
	}
	
	/**
	 * 取消订单
	 */
	public String cancelOrder(String orderid,String time, String token) throws Exception{
		//判断一下该订单的状态，要不是未处理状态则允许取消
		int orderstatus = getOrderStatus(orderid,time);
		if(orderstatus == -1){
			return "{\"success\":false,\"emsg\":\"该订单已不存在\",\"token\":\""+token+"\"}";
		}else if(orderstatus == 0){
				orderDao.setAllOrderStatus(orderid, 3);
				//取消订单时，移除缓存中的订单
				OrderCacheUtil.remove(orderid);
				return "{\"success\":true,\"emsg\":\"取消订单成功\",\"token\":\""+token+"\"}";
		}else if(getOrderStatus(orderid, time)==1){
			return "{\"success\":false,\"emsg\":\"该订单正在被处理，无法取消\",\"token\":\""+token+"\"}";
		}else if(getOrderStatus(orderid, time)==2){
			return "{\"success\":false,\"emsg\":\"该订单已完成\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"取消订单失败\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 
	 */
	public String deleteOrder(String orderid,String time, String token) throws Exception{
		boolean isview = orderDao.isview(orderid, time);
		if(isview){
			if(orderDao.deleteAllOrder(orderid, time)){
				return "{\"success\":true,\"emsg\":\"删除订单成功\",\"token\":\""+token+"\"}";
			}
			return "{\"success\":false,\"emsg\":\"删除订单失败\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"该订单已不存在\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 返回历史order包括orderinfo dao层为实现
	 * @param offset
	 * @return
	 */
	
	private Object[] getHistoryOrderInfo(int offset) throws Exception{
		return orderDao.getHistoryOrderInfo(offset);
	}
	
	/**
	 * 返回历史order不包括orderinfo
	 * @return
	 */
	private List<Order> getHistoryOrder(int offset,int pagesize,long userid) throws Exception{
		return orderDao.getHistoryOrder(offset,pagesize,userid);
	}
	
	private List<HOrder> getHistoryOrder(int offset,int pagesize,long userid,int time) throws Exception{
		return orderDao.getHistoryOrder(offset,pagesize,userid,time);
	}
	
	
	
	/**
	 * 分页查询历史订单
	 */
	public String getHistoryOrder(String time, int offset,int pagesize, String token) throws TokenException,Exception{
		if(time.equals("1")){
			//文字订单
			List<AllOrderInfo> allOrderInfos = orderDao.getRespOrderList(offset,pagesize,IDGenertor.getUserID(token),time);
			for(AllOrderInfo allOrderInfo : allOrderInfos){
				if(allOrderInfo.getTotal_price().equals("")){
					allOrderInfo.setTotal_price("0");
				}
			}
			return JsonHandler.MapToJson(getMap(true, "第1个月订单", token, allOrderInfos));
		}else{
			List<HAllOrderInfo> allOrderInfos = orderDao.getRespOrderList(offset,pagesize,IDGenertor.getUserID(token),time);
			for(HAllOrderInfo allOrderInfo : allOrderInfos){
				if(allOrderInfo.getTotal_price().equals("")){
					allOrderInfo.setTotal_price("0");
				}
			}
			return JsonHandler.MapToJson(getMap(true, "一个月以后订单", token, allOrderInfos));
		}
	}
	
	private List<HQTOrder> getHistoryQTOrderOutOne(List<String> hqtorderids) {
		return orderDao.getHistoryQTOrderOutOne(hqtorderids);
	}
	private List<HOrder> getHistoryOrderOutOne(List<String> horderids) {
		return orderDao.getHistoryOrderOutOne(horderids);
	}
	private List<QTOrder> getHistoryQTOrder(List<String> qtorderids) {
		return orderDao.getHistoryQTOrder(qtorderids);
	}
	private List<Order> getHistoryOrder(List<String> orderids) {
		return orderDao.getHistoryOrder(orderids);
	}
	/**
	 * 分页查询历史订单
	 */
	public String getHistoryOrder1(String time, int offset,int pagesize, String token) throws TokenException,Exception{
		if(time.equals("1")){
			List<Order> orders = getHistoryOrder(offset,pagesize,IDGenertor.getUserID(token));
			return JsonHandler.MapToJson(getMap(true, "第1个月订单", token, 
					JsonHandler.ObjectToJSONArray(orders, 
							new String[]{"id","customer_id","delivery_address_id","delivery_address_stamp",
							"pay_status","pay_type","actual_pay_type","reserved_delivery_time","actual_delivery_time",
							"delivery_id","lastupdatetime","isview"})));
		}else{
			List<HOrder> horders = getHistoryOrder(offset,pagesize,IDGenertor.getUserID(token),Integer.parseInt(time));
			return JsonHandler.MapToJson(getMap(true, "第"+time+"个月订单", token, 
					JsonHandler.ObjectToJSONArray(horders, 
							new String[]{"id","customer_id","delivery_address_id","delivery_address_stamp",
							"pay_status","pay_type","actual_pay_type","reserved_delivery_time","actual_delivery_time",
							"delivery_id","lastupdatetime","isview"})));
		}
	}
	
	/*
	 *	配送员获取所有订单列表(支持分页) 
	 */
	public String getOrder(int pagesize,int offset, String token) throws TokenException, Exception{
	//	Integer[] addressids = getAddressIds(IDGenertor.getUserID(token));
		List<AllOrderInfo> allOrderInfos = orderDao.getAllOrderInfo(offset, pagesize);
	/*	List<String> orderids = new ArrayList<String>();
		List<String> qtorderids = new ArrayList<String>();
		for(AllOrderInfo allOrderInfo : allOrderInfos){
			if(allOrderInfo.getOrdertype()==0)
				orderids.add(allOrderInfo.getOrderid());
			else
				qtorderids.add(allOrderInfo.getOrderid());
		}
		List<Order> orders = null;
		List<QTOrder> qtorders = null;
		List<O> o = new ArrayList<O>();
		if(orderids.size()>0){
			orders = orderDao.getHistoryOrder(orderids);
			o.addAll(orders);
		}
		if(qtorderids.size()>0){
			qtorders = orderDao.getHistoryQTOrder(qtorderids);
			o.addAll(qtorders);
		}*/
		return JsonHandler.MapToJson(getMap(true, "订单列表", token, allOrderInfos));
	}
	
	public String getOrder1(int pagesize,int offset, String token) throws TokenException, Exception{
		Integer[] addressids = getAddressIds(IDGenertor.getUserID(token));
		List<Order> orders = orderDao.getOrder(pagesize,offset,addressids);
		return JsonHandler.MapToJson(getMap(true, "订单列表", token, 
				JsonHandler.ObjectToJSONArray(orders, 
						new String[]{"actual_delivery_time",
						"reserved_delivery_time","bill_status","checkcode",
						"lastupdatetime","isview","actual_pay_type","pay_type",
						"pay_status","delivery_id","customer_id","delivery_address_id",
						"delivery_address_stamp"})));
	}

	
	//获取配送员附近区域的用户地址id
	private Integer[] getAddressIds(int duserid){
		int shopsid = userService.getShopsID(duserid);
		int areaid = shopsService.getAreaID(shopsid);
		Integer[] addressids = customerAddressService.getAddressIds(areaid);
		for(int id : addressids){
			System.out.println("id="+id);
		}
		return addressids;
	}
	
	/**
	 * 根据订单id查询订单详情
	 */
	@SuppressWarnings("unchecked")
	public String getOrderDetail(String orderid, String token) throws Exception{
		List<DOrderDetail> orderDetails = orderDao.getOrderDetails(orderid);
		return JsonHandler.MapToJson(getMap(true, "普通订单详情", token, orderDetails));
	}
	
	/**
	 * 将时间超过一个月的订单移入历史订单表
	 */
	public void moveOrder() throws Exception{
		System.out.println(".................moveOrder");
		List<Order> orders = orderDao.getOutOrder();
		System.out.println("haha"+orders);
	/*	for(Order order : orders){
			HOrder horder = new HOrder();
			horder.setId(order.getId());
			horder.setActual_delivery_time(order.getActual_delivery_time());
			horder.setActual_pay_type(order.getActual_pay_type());
			horder.setAddress(order.getAddress());
			horder.setBill_status(order.getBill_status());
			horder.setCheckcode(order.getCheckcode());
			horder.setCreatetime(order.getCreatetime());
			horder.setCustomer_id(order.getCustomer_id());
			horder.setDelivery_address_id(order.getDelivery_address_id());
			horder.setDelivery_address_stamp(order.getDelivery_address_stamp());
			horder.setDelivery_id(order.getDelivery_id());
			horder.setGoodsnum(order.getGoodsnum());
			horder.setIsview(order.getIsview());
			horder.setLastupdatetime(order.getLastupdatetime());
			horder.setName(order.getName());
			horder.setOrderid(order.getOrderid());
			horder.setPay_status(order.getPay_status());
			horder.setPay_type(order.getPay_type());
			horder.setReserved_delivery_time(order.getReserved_delivery_time());
			horder.setTel(order.getTel());
			horder.setTotal_price(order.getTotal_price());
			horder.setDeliveryprice(order.getDeliveryprice());
			orderDao.delete(order);
			orderDao.save(horder);
		}*/
	}
	
	//获取指定订单的状态
	public int getOrderStatus(String orderid,String time) throws Exception {
		return orderDao.getOrderStatus(orderid);
	}
	
	public List<Integer> getShopsIds(int addressid){
		int areaid = customerAddressService.getAreaID(addressid);
		List<Integer> shopsids = shopsService.getShopsIDs(areaid);
		return shopsids;
	}
	
	//推送消息
	public void sendNotification(int addressid) throws Exception {
	//	Demo<Integer> demo = new Demo<Integer>("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q");
	//	String s = demo.sendAndroidGroupcast();
	//	logger.info(s);
		Collection<String> registrationIds = deviceService.getRegistrationIds();
		JPush.pushToAllOnlineDelivery(registrationIds);
	}

	//推送消息
	@Deprecated
	public void sendNotification1(int addressid) throws Exception {
		List<Integer> shopsids = getShopsIds(addressid);
		logger.info(shopsids);
	//	Demo<Integer> demo = new Demo<Integer>("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q");
	//	String s = demo.sendAndroidGroupcast(shopsids);
	//	logger.info(s);
		Collection<String> registrationIds = deviceService.getRegistrationIds();
		JPush.pushToAllOnlineDelivery(registrationIds);
	}

	
	public void updateOrderStatus(String orderid, int status) {
		orderDao.setAllOrderStatus(orderid, status);
	}

	public String getOrderUserTel(String orderid) {
		AllOrderInfo order = orderDao.getOrderByID(orderid);
		if(null==order){
			return "";
		}
		return order.getTel();
	}
	
	
	/*提交语音订单*/
	public String saveQtOrder(AllOrderInfo allOrderInfo, QTOrder order, String token) throws Exception {
		String code = IDGenertor.randomCode();
		allOrderInfo.setCheckcode(code);
		orderDao.save(allOrderInfo);
		orderDao.save(order);
		return "{\"success\":true,\"emsg\":\"订单提交成功\",\"token\":\""+token+"\",\"code\":"+code+"}";
	}
	
	public String cancelQTOrder(String orderid, String time, String token)
			throws Exception {
		//判断一下该订单的状态，要不是未处理状态则允许取消
		int qtorderstatus = getOrderStatus(orderid,time);
		if(qtorderstatus == -1){
			return "{\"success\":false,\"emsg\":\"该订单已不存在\",\"token\":\""+token+"\"}";
		}else if(qtorderstatus == 0){
				orderDao.setAllOrderStatus(orderid, 3);
				//取消订单时，移除缓存中的订单
				OrderCacheUtil.remove(orderid);
				return "{\"success\":true,\"emsg\":\"取消订单成功\",\"token\":\""+token+"\"}";
		}else if(qtorderstatus == 1){
			return "{\"success\":false,\"emsg\":\"该订单正在被处理，无法取消\",\"token\":\""+token+"\"}";
		}else if(qtorderstatus == 2){
			return "{\"success\":false,\"emsg\":\"该订单已完成\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"取消订单失败\",\"token\":\""+token+"\"}";
	}
	
	public String deleteQTOrder(String orderid, String time, String token)throws Exception {
		boolean isview = orderDao.isview(orderid, time);
		if(isview){
			if(orderDao.deleteAllOrder(orderid, time)){
				return "{\"success\":true,\"emsg\":\"删除订单成功\",\"token\":"+token+"}";
			}
			return "{\"success\":false,\"emsg\":\"删除订单失败\",\"token\":"+token+"}";
		}
		return "{\"success\":false,\"emsg\":\"该订单已不存在\",\"token\":\""+token+"\"}";
	}
	
	public String getQTOrderByID(String orderid, String time, String token)
			throws Exception {
		Object o = orderDao.getQTOrder(orderid, time);
		if(null==o){
			throw new Exception("该订单不存在!");
		}
		Map map = new HashMap();
		map.put("success", true);
		if(o instanceof QTOrder){
			AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
			QTOrder qtorder = (QTOrder)o;
			String qturl = qtorder.getQturl();
			if(info.getOrdertype()==2){
				map.put("emsg", "文字订单详情");
				map.put("data",qtorder);
			}else{
				map.put("emsg", "语音订单详情");
				QTOrder myqtorder = new QTOrder();
				myqtorder.setContent("");
				myqtorder.setId(qtorder.getId());
				myqtorder.setOrderid(qtorder.getOrderid());
				myqtorder.setVoicelength(qtorder.getVoicelength());
				myqtorder.setQturl(Token.getDownLoadToken(qturl));
				map.put("data",myqtorder);
			}
			qtorder.setQturl(qturl);
		//	AllOrderInfo info = orderDao.getAllOrderInfoByID(orderid);
			if(null!=info)
				map.put("info", JsonHandler.ObjectToJson(info, new String[]{"" +
						"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
						"orderid","ordertype","deliveryprice","customerid","bill_status"}));
			else
				map.put("info", "");
			System.out.println(((QTOrder)map.get("data")).getQturl());
		}else{
			HAllOrderInfo info = orderDao.getHAllOrderInfoByID(orderid);
			HQTOrder hqtorder = (HQTOrder)o;
			String qturl = hqtorder.getQturl();
			if(info.getOrdertype()==2){
				map.put("emsg", "文字订单详情");
				map.put("data", hqtorder);
			}else{
				map.put("emsg", "语音订单详情");
				HQTOrder myhqtorder = new HQTOrder();
				myhqtorder.setId(hqtorder.getId());
				myhqtorder.setContent("");
				myhqtorder.setOrderid(hqtorder.getOrderid());
				myhqtorder.setVoicelength(hqtorder.getVoicelength());
				myhqtorder.setQturl(Token.getDownLoadToken(qturl));
				map.put("data", myhqtorder);
			}
			hqtorder.setQturl(qturl);
			if(null!=info)
				map.put("info", JsonHandler.ObjectToJson(info, new String[]{"" +
						"goodsnum","checkcode","deliveryid","total_price","id","isview","createtime",
						"orderid","ordertype","deliveryprice","customerid","bill_status"}));
			else
				map.put("info", "");
		}
		map.put("token", token);
		return JsonHandler.MapToJson(map);
	}

	public String getQTOrderDetail(String orderid, String token) throws Exception{
		Object o = orderDao.getQTOrder(orderid,"1");
		if(o instanceof QTOrder){
			QTOrder qtorder = (QTOrder)o;
			QTOrder qtOrder2 = new QTOrder();
			qtOrder2.setId(qtorder.getId());
			qtOrder2.setContent("");
			qtOrder2.setOrderid(qtorder.getOrderid());
			qtOrder2.setVoicelength(qtorder.getVoicelength());
			qtOrder2.setQturl(Token.getDownLoadToken(qtorder.getQturl()));
			return JsonHandler.MapToJson(getMap(true, "语音订单详情", token, qtOrder2));
		}
		throw new Exception("该语音订单失效");
	}

	public String getWZOrderDetail(String orderid,String token) throws Exception{
		Object o = orderDao.getQTOrder(orderid,"1");
		if(o instanceof QTOrder){
			QTOrder qtorder = (QTOrder)o;
			QTOrder qtOrder2 = new QTOrder();
			qtOrder2.setId(qtorder.getId());
			qtOrder2.setContent(qtorder.getContent());
			qtOrder2.setOrderid(qtorder.getOrderid());
			qtOrder2.setVoicelength(0);
			qtOrder2.setQturl("");
			return JsonHandler.MapToJson(getMap(true, "语音订单详情", token, qtOrder2));
		}
		throw new Exception("该文字订单失效");
	}
	/*
	 * 	*/
}
