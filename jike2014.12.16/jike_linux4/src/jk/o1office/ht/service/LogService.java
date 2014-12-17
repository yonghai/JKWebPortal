package jk.o1office.ht.service;

public interface LogService {

	/**
	 * 注销用户，并将用户的操作信息保存
	 * @param string
	 * @throws Exception
	 */
	void logout(String string)throws Exception;

}
