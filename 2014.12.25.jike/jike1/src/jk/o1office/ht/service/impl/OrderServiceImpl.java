package jk.o1office.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jk.o1office.ht.dao.OrderDao;
import jk.o1office.ht.domin.MyOrderDetails;
import jk.o1office.ht.domin.Order;
import jk.o1office.ht.service.OrderService;
import jk.o1office.ht.utils.JSONHandler;
import net.sf.json.JSONArray;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public String getOrder(int offset, int rows, int billstatus)
			throws Exception {
		List<Order> orders = orderDao.getOrder(offset, rows, billstatus);
		int count = orderDao.count(billstatus);
		Map map = new HashMap();
		map.put("rows", orders);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}
	
	public String delOrder(int id, int status) throws Exception {
		orderDao.delOrder(id,status);
		return "删除成功";
	}
	
	public String getOrder(int offset, int rows, int billstatus, String name, String time) throws Exception{
		List<Order> orders = orderDao.getOrder(offset, rows, billstatus, name);
		int count = orderDao.count(billstatus, name);
		Map map = new HashMap();
		map.put("rows", orders);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}
	
	public String getOrderDetails(String orderid) throws Exception {
		List<MyOrderDetails> details = orderDao.getDetails(orderid);
		return JSONHandler.ArrayToJson(details);
	}

	public String getOrderCount(String time) throws Exception{
		List count = orderDao.getOrderCount(time);
		Map map = new HashMap();
		for(Object obj : count){
			Object[] ints = (Object[])obj;
			map.put(ints[0], ints[1]);
		} 
		Set set = map.keySet();
		if(!set.contains(0)){
			map.put(0, 0);
		}
		if(!set.contains(1)){
			map.put(1, 0);
		}
		if(!set.contains(2)){
			map.put(2, 0);
		}
		if(!set.contains(3)){
			map.put(3, 0);
		}
		System.out.println("map="+map);
		return JSONHandler.MapToJson(map);
	}
}
