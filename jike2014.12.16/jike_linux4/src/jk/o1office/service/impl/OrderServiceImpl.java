package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.dao.OrderDao;
import jk.o1office.dao.impl.OrderDaoImpl;
import jk.o1office.domin.DOrderDetail;
import jk.o1office.domin.HOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.OrderDetail;
import jk.o1office.excetion.TokenException;
import jk.o1office.push.Demo;
import jk.o1office.service.DeviceService;
import jk.o1office.service.OrderService;
import jk.o1office.service.ProductService;
import jk.o1office.service.ShopsService;
import jk.o1office.service.UserService;
import jk.o1office.service.VersionService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	private ProductService productService;
	private VersionService versionService;
	private UserService userService;
	private ShopsService shopsService;
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
	public String saveOrders(Order order, List list, String token) throws Exception{
		//如果提交订单的价格正确，则保存订单
		if(checkPrice(list)){
			String code = IDGenertor.randomCode();
			order.setCheckcode(code);
			String[] prices = versionService.getPrices("customer");//lowprice,deliveryprice,deliveryrange
			//如果费用低于lowprice，则不予配送给出提示
			if(Double.parseDouble(order.getTotal_price())<Double.parseDouble(prices[0])){
				return "{\"success\":false,\"emsg\":\"价格低于"+prices[0]+"不予配送\",\"token\":\""+token+"\"}";
			}
			//如果大于配送范围的价格，则不收费用
			/*if(Double.parseDouble(order.getTotal_price())>Double.parseDouble(prices[2])){
				order.setDeliveryprice("0");
			}else{
				order.setDeliveryprice(prices[1]);
			}*/
			orderDao.save(order);
			for(Object o : list){
				OrderDetail od = (OrderDetail)o;
				od.setOrderid(order.getOrderid());
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
			OrderDetail od = (OrderDetail)o;
			boolean b =  productService.checkPrice(od.getProduct_id(),od.getProduct_price());
			//如果价格不正确，跳出循环，返回false
			if(!b){
				return false;
			}
		}
		return true;
	}
	
	private Order getOrderByID(String orderid) throws Exception{
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
		Object[] o = orderDao.getOrderDetails(orderid,time);
		return JsonHandler.MapToJson(getMap(true,"订单详情",token, o[0], o[1]));
	}

	private Object[] getOrderInfoByID(String orderid) throws Exception{
		return orderDao.getOrderInfoByID(orderid);
	}
	
	
	private Map getMap(boolean isscuss,String emsg,String token,Object info,Object data){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("info", info);
		map.put("data", data);
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
		if(getOrderStatus(orderid,time)==-1){
			return "{\"success\":false,\"emsg\":\"该订单已不存在\",\"token\":\""+token+"\"}";
		}else if(getOrderStatus(orderid, time)==0){
			if(orderDao.cancelOrder(orderid,time)){
				//取消订单时，移除缓存中的订单
				OrderCacheUtil.remove(orderid);
				return "{\"success\":true,\"emsg\":\"取消订单成功\",\"token\":\""+token+"\"}";
			}
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
		if(orderDao.deleteOrder(orderid,time)){
			return "{\"success\":true,\"emsg\":\"删除订单成功\",\"token\":"+token+"}";
		}
		return "{\"success\":false,\"emsg\":\"删除订单失败\",\"token\":"+token+"}";
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
		List<Order> orders = orderDao.getOrder(pagesize,offset,new Integer[]{});
		return JsonHandler.MapToJson(getMap(true, "订单列表", token, 
				JsonHandler.ObjectToJSONArray(orders, 
						new String[]{"actual_delivery_time",
						"reserved_delivery_time","bill_status","checkcode",
						"lastupdatetime","isview","actual_pay_type","pay_type",
						"pay_status","delivery_id","customer_id","delivery_address_id",
						"delivery_address_stamp"})));
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
		return JsonHandler.MapToJson(getMap(true, "订单详情", token, orderDetails));
	}
	
	/**
	 * 将时间超过一个月的订单移入历史订单表
	 */
	public void moveOrder() throws Exception{
		System.out.println(".................moveOrder");
		List<Order> orders = orderDao.getOutOrder();
		System.out.println("haha"+orders);
		for(Order order : orders){
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
		}
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
		Demo<Integer> demo = new Demo<Integer>("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q");
		String s = demo.sendAndroidGroupcast();
		logger.info(s);
	}

	//推送消息
	@Deprecated
	public void sendNotification1(int addressid) throws Exception {
		List<Integer> shopsids = getShopsIds(addressid);
		logger.info(shopsids);
		Demo<Integer> demo = new Demo<Integer>("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q");
		String s = demo.sendAndroidGroupcast(shopsids);
		logger.info(s);
	}

	
	public void updateOrderStatus(String orderid, int status) {
		orderDao.updateBillStatus(orderid, status);
	}

	public String getOrderUserTel(String orderid) {
		Order order = orderDao.getOrderByID(orderid);
		if(null==order){
			return "";
		}
		return order.getTel();
	}
	
}
