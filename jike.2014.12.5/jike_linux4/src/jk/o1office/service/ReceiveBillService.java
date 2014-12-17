package jk.o1office.service;

public interface ReceiveBillService {

	/**
	 * 获取配送端已完成的接单列表
	 * @param offset
	 * @param time
	 * @param token
	 * @return
	 * @throws Exception
	 */
	String getReceiceBill(int pagesize,int offset, String time, String token) throws Exception;

	/**
	 * 根据配送员的id和订单号查询该订单详情
	 * @param orderid
	 * @param token
	 * @return
	 * @throws Exception 
	 */
	String getReceBillDec(String orderid, String token) throws Exception;

}
