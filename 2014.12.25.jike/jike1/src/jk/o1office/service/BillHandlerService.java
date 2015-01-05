package jk.o1office.service;

import jk.o1office.excetion.TokenException;

public interface BillHandlerService {

	/**
	 * 配送端备货完成的操作
	 * @param orderid
	 * @param token
	 * @return
	 * @throws Exception 
	 */
	String billCompleted(String orderid, String token) throws Exception;

	/**
	 * 配送员取消订单也出处理
	 * @param orderid
	 * @param reason
	 * @param token
	 * @return
	 * @throws Exception 
	 */
	String cancelBill(String orderid, String reason, String token) throws Exception;

	String billCompleted(String orderid, String code, String token) throws Exception;

	String billFature(String orderid, String reason, String token) throws Exception;

	String getUnFinshOrder(String token) throws TokenException,Exception;

	String getToDayData(String token) throws TokenException, Exception;

}
