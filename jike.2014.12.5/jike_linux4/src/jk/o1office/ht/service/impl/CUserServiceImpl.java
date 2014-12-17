package jk.o1office.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.CommonUser;
import jk.o1office.ht.domin.User;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.JSONHandler;
/**
 * 普通用户service
 */
public class CUserServiceImpl implements UserService {
	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 获取所有的普通用户
	 */
	public String getUser(int offset, int rows) throws Exception{
		List<User> users = userDao.queryUser(offset, rows);
		int count = userDao.count();
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}
	@Deprecated
	public String login(User user) throws Exception {
		return null;
	}

	public String delUser(int id) throws Exception {
		userDao.delUser(id);
		return "删除成功";
	}

	public boolean updateUser(User user) throws Exception {
		return userDao.updateUser(user);
	}

	public String getUser(int offset, int rows, String name) {
		List<User> users = userDao.queryUser(offset, rows, name);
		int count = userDao.count(name);
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}

	public String getUserInfo(int id) throws Exception {
		return null;
	}

	public String getUser(int offset, int rows, int type) throws Exception {
		return null;
	}

	public String getUser(int offset, int rows, int type, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public int[] getUserCount() throws Exception {
		int[] ints = userDao.getOrderCount();
		return ints;
	}

}
