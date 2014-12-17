package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.HOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.UnFinshOrder;


public interface OrderDao {

	void delete(Order o);
	
	void save(Object o);

	Order getOrderByID(String orderid);

	List getOrderDetails(String orderid);

	boolean deleteOrder(String orderid,String time);
	
	boolean cancelOrder(String orderid,String time);
	
	Object[] getOrderInfoByID(String orderid);

	Object[] getHistoryOrderInfo(int offset);

	List<Order> getHistoryOrder(int offset,int pagesize, long userid);

	List<HOrder> getHistoryOrder(int offset,int pagesize, long userid, int time);

	List<Order> getOrder(int pagesize,int offset);

	/**
	 * 更新订单表中订单的状态
	 * @param orderid
	 */
	void updateBillStatus(String orderid,int status);

	Object[] getOrderDetails(String orderid, String time);

	boolean isReceived(String orderid);

	boolean checkBill(String orderid, String code);

	void updateBill(String orderid,int status, int userID);

	List<UnFinshOrder> getUnFinshOrder(int userID);

	int getMoreOrderNum(int userid);

	List<Order> getOutOrder();

	List<Order> getOrder(int pagesize, int offset, Integer[] addressids);

	int getOrderStatus(String orderid);

}
