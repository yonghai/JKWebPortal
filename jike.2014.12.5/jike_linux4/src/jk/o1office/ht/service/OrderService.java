package jk.o1office.ht.service;

public interface OrderService {

	/**
	 * 获取某类订单（分页）
	 * @param offset
	 * @param rows
	 * @param billstatus
	 * @return
	 */
	String getOrder(int offset, int rows, int billstatus) throws Exception;

	/**
	 * 删除近一个月内指定状态下的订单
	 * @param id
	 * @param status
	 * @return
	 */
	String delOrder(int id, int status) throws Exception;

	/**
	 * 根据条件搜索order
	 * @param offset
	 * @param rows
	 * @param billstatus
	 * @param name
	 * @return
	 * @throws Exception 
	 */
	String getOrder(int offset, int rows, int billstatus, String name, String time) throws Exception;

	/**
	 * 根据订单id获取订单的详情
	 * @param orderid
	 * @return
	 * @throws Exception
	 */
	String getOrderDetails(String orderid) throws Exception;

	String getOrderCount(String time) throws Exception;

}
