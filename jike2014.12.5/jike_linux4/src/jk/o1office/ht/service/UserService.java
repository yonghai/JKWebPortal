package jk.o1office.ht.service;

import java.util.Map;

import jk.o1office.ht.domin.User;

public interface UserService {

	/**
	 * 用户邓丽接口
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	String login(User user) throws Exception;

	/**
	 * 获取所有用户（分页）
	 * @param offset
	 * @param rows
	 * @return
	 * @throws Exception
	 */
	String getUser(int offset, int rows) throws Exception;

	/**
	 * 根据条件查询用户
	 * @param offset
	 * @param rows
	 * @param name
	 * @return
	 */
	String getUser(int offset, int rows, String name);

	/**
	 * 删除用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	String delUser(int id) throws Exception;

	/**
	 * 编辑用户信息
	 * @param cuser
	 * @return
	 * @throws Exception
	 */
	boolean updateUser(User user) throws Exception;

	/**
	 * 获取指定id用户的信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	String getUserInfo(int id) throws Exception;

	/**
	 * 根据type获取不同的用户
	 * @param offset
	 * @param rows
	 * @param type
	 * @return
	 */
	String getUser(int offset, int rows, int type) throws Exception;

	/**
	 * 条件搜索用户
	 * @param offset
	 * @param rows
	 * @param type
	 * @param name
	 * @return
	 */
	String getUser(int offset, int rows, int type, String name);

	int[] getUserCount() throws Exception;

}
