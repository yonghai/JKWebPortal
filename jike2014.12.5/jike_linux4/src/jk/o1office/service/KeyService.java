package jk.o1office.service;

import jk.o1office.excetion.TokenException;

public interface KeyService {

	/**
	 * 保存或更新关键字
	 * @param keyword
	 */
	void saveOrUpdate(String keyword,int userid);

	String getKeyList(String token) throws TokenException, Exception;

}
