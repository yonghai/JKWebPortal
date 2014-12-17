package jk.o1office.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.User;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.JSONHandler;
/**
 * 管理员用户service
 */
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	private UserService cUserService;
	public UserService getcUserService() {
		return cUserService;
	}
	public void setcUserService(UserService cUserService) {
		this.cUserService = cUserService;
	}
	public UserService getdUserService() {
		return dUserService;
	}
	public void setdUserService(UserService dUserService) {
		this.dUserService = dUserService;
	}

	private UserService dUserService;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public String login(User user) throws Exception{
		if(userDao.login(user)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	public String getUser(int offset, int rows) {
		return null;
	}
	
	public String delUser(int id) throws Exception {
		userDao.delUser(id);
		return "删除成功";
	}
	
	public boolean updateUser(User user) throws Exception {
		userDao.updateUser(user);
		return true;
	}
	public String getUser(int offset, int rows, String name) {
		return null;
	}
	public String getUserInfo(int id) throws Exception {
		return null;
	}
	
	public String getUser(int offset, int rows, int type) throws Exception {
		List<User> users = userDao.queryUser(offset, rows, type);
		int count = userDao.count(type);
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}
	
	public String getUser(int offset, int rows, int type, String name) {
		List<User> users = userDao.queryUser(offset, rows, type, name);
		int count = userDao.count(type, name);
		Map map = new HashMap();
		map.put("rows", users);
		map.put("total", count);
		return JSONHandler.MapToJson(map);
	}
	
	public int[] getUserCount() throws Exception {
		int[] sints = userDao.getOrderCount();
		int[] cints = cUserService.getUserCount();
		int[] dints = dUserService.getUserCount();
		return new int[]{cints[0],dints[0],sints[0],sints[1],sints[2]};
	}
}
