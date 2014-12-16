package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.MyOrderDetails;
import jk.o1office.ht.domin.Order;

public interface OrderDao {

	List<Order> getOrder(int offset, int rows, int billstatus);

	int count(int billstatus);

	void delOrder(int id, int status);

	List<Order> getOrder(int offset, int rows, int billstatus, String name);

	int count(int billstatus, String name);

	List<MyOrderDetails> getDetails(String orderid) throws Exception;

	List getOrderCount(String time);

}
