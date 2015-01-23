package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.AllOrderInfo;
import jk.o1office.domin.HAllOrderInfo;
import jk.o1office.domin.HOrder;
import jk.o1office.domin.HQTOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.QTOrder;
import jk.o1office.domin.UnFinshOrder;


public interface OrderDao {

	void delete(Order o);
	
	void save(Object o);

	AllOrderInfo getOrderByID(String orderid);

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

	List getOrderDetails(String orderid, String time);

	boolean isReceived(String orderid);

	boolean checkBill(String orderid, String code);

	void updateBill(String orderid,int status, int userID);

	List<UnFinshOrder> getUnFinshOrder(int userID);

	int getMoreOrderNum(int userid);

	List<Order> getOutOrder();

	List<Order> getOrder(int pagesize, int offset, Integer[] addressids);

	int getOrderStatus(String orderid);

	void setAllOrderStatus(String orderid, int status);

	boolean deleteQTOrder(String orderid, String time);

	boolean deleteAllOrder(String orderid, String time);

	Object getQTOrder(String orderid, String time);

	List<AllOrderInfo> getAllOrderInfo(int offset, int pagesize, int userID,
			String time);

	List<Order> getHistoryOrder(List<String> orderids);

	List<QTOrder> getHistoryQTOrder(List<String> qtorderids);

	List<HOrder> getHistoryOrderOutOne(List<String> horderids);

	List<HQTOrder> getHistoryQTOrderOutOne(List<String> hqtorderids);

	boolean isview(String orderid, String time);

	List<AllOrderInfo> getAllOrderInfo(int offset, int pagesize);

	void updateQTBill(String orderid, int status, int userID);

	QTOrder getQTOrderByID(String orderid);

	void updateQTBillStatus(String orderid, int status);

	List getRespOrderList(int offset, int pagesize, int userID,
			String time);

	AllOrderInfo getAllOrderInfoByID(String orderid);

	HAllOrderInfo getHAllOrderInfoByID(String orderid);

	int getOrderType(String orderid);

	void addGoodsNumAndGoodsPrice(String orderid, int goodsnum,
			String goodsprice);

	void setDeliveryID(String orderid, int userID);

	List<AllOrderInfo> getAllOrderInfo(int status);

}
