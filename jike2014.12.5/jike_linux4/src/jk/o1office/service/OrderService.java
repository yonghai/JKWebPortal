package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.Order;
import jk.o1office.excetion.FailException;

public interface OrderService {

	String saveOrders(Order order, List list, String token) throws Exception;

	String getOrderByID(String orderid,String time, String token) throws Exception;

	String cancelOrder(String orderid,String time, String token) throws Exception;

	String deleteOrder(String orderid,String time, String token) throws Exception;

	String getHistoryOrder(String time, int offset,int pagesize,String token) throws Exception;

	String getOrder(int pagesize,int offset, String token) throws Exception;

	String getOrderDetail(String orderid, String token) throws Exception;

	void moveOrder() throws Exception;
	
	int getOrderStatus(String orderid,String time) throws Exception;

	void sendNotification(int addressid) throws Exception;
	
	List<Integer> getShopsIds(int addressid) throws Exception;

	void updateOrderStatus(String orderid, int status) throws Exception;

	String getOrderUserTel(String orderid) throws Exception;
	
}
