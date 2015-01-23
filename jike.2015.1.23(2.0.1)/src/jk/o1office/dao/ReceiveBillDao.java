package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Order;
import jk.o1office.domin.ReceiveBillH;
import jk.o1office.domin.ReceiveBillItemH;

public interface ReceiveBillDao {
	
	/**
	 * 返回配送端已完成的接单列表
	 * @param offset
	 * @param time
	 * @param userID
	 * @return
	 */
	List<ReceiveBillH> getReceiveBill(int pagesize,int offset, String time, int userID);
	
	/**
	 * 返回配送端接单订单详情
	 * @param orderid
	 * @param userID
	 * @return
	 */
	List<Order> getReceiveBDec(String orderid, int userID);

	/**
	 * 将用户提交的订单保存配送接单表中
	 * @param orderid
	 */
	void saveSubmitBill(String orderid,int userid, int ordertype);

	/**
	 * 配送员取消订单，将订单从接受订单表中删除
	 * @param orderid
	 */
	void deleteBill(String orderid);

	/**
	 * 配送员取消订单，将接受订单表中取消订单移入配送员取消订单表
	 * @param orderid
	 */
	void moveBillToCancelBill(String orderid, String reason);

	void cancelReceiveBill(String orderid, String reason);

	void updateReceivedBillStatus(String orderid, int i);

	void failtureReceiveBill(String orderid, String reason);

	int getTodayNum(int userid);

	String getTodayPrice(int userid);

	boolean hasHandlerOrder(int userid);

	boolean isCancled(String orderid, int userID);

	int getBillStatus(String orderid);

	void updateReceiveDeliveryID(String orderid, int i);

}
