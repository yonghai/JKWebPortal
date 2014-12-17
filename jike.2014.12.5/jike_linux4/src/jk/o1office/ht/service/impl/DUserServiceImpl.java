package jk.o1office.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.DeliveryUser;
import jk.o1office.ht.domin.User;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.JSONHandler;
import jk.o1office.utils.JsonHandler;
/**
 * 配送员sesrvice
 */
public class DUserServiceImpl implements UserService {
	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String delUser(int id) throws Exception {
		userDao.delUser(id);
		return "删除成功";
	}

	public String getUser(int offset, int rows) throws Exception {
		List<User> users = userDao.queryUser(offset, rows);
		int count = userDao.count();
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}

	public String getUser(int offset, int rows, String name) {
		List<User> users = userDao.queryUser(offset, rows, name);
		int count = userDao.count(name);
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}

	public String login(User user) throws Exception {
		return null;
	}

	public boolean updateUser(User user) throws Exception {
		return userDao.updateUser(user);
	}
	
	public String getUserInfo(int id) throws Exception {
		DeliveryUser duser = (DeliveryUser) userDao.getUserInfo(id); 
		return JSONHandler.ObjectToJson(duser);
	}

	public String getUser(int offset, int rows, int type) throws Exception {
		return null;
	}
	
	public String getUser(int offset, int rows, int type, String name) {
		return null;
	}
	public int[] getUserCount() throws Exception {
		return userDao.getOrderCount();
	}

}
