package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.DeviceDao;
import jk.o1office.dao.UserDao;
import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.TokenException;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

public class OrdUserServiceImpl implements UserService {
	private UserDao userDao;
	private DeviceDao deviceDao;
	public DeviceDao getDeviceDao() {
		return deviceDao;
	}
	public void setDeviceDao(DeviceDao deviceDao) {
		this.deviceDao = deviceDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	/**
	 * 用户注册时保存用户信息
	 * 当用户注册成功时，相当于自动登录
	 * 返回信息：用户登录成功的提示信息和状态及给用户一个token
	 * 将用户的token，id绑定存入devices表中
	 */
	public String save(Object o, Device device, String token) throws Exception{
		CustomerUser cuser = null;
		if(o instanceof CustomerUser){
			cuser = (CustomerUser)o;
		}
		String returninfo = "";
		int userid = isHasUser(cuser.getUsername()); 	//查询该用户是否存在非0则存在
		if(userid==0){	//该用户不存在，保存操作并自动登录
			boolean flag = userDao.save(cuser);
			String newuserid = userDao.getUserID(cuser.getUsername());
			if(newuserid.equals("0") || newuserid.equals(""))
				throw new Exception();
			if(flag){
				String newtoken = IDGenertor.newToken(newuserid+"");
				device.setToken(newtoken);
				device.setUserid(Integer.parseInt(newuserid));
				device.setRole("customer");
				addDevices(device);
				returninfo = "{\"success\":true,\"token\":\""+newtoken+"\",\"emsg\":\"注册成功\"}";
			}else
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"注册失败\"}";
		}else{	//该用户存在，返回提示信息
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"该用户已经注册\"}";
		}
		return returninfo;
	}
	
	/**
	 * 根据用户名和密码判断是否有该用户
	 * 用户名不存在返回0
	 * 密码错误返回-1
	 * 登陆成功用户id
	 */
	public int isHasUser(String username, String password) throws Exception{
		return userDao.isHasUser(username, password);
	}
	
	/**
	 * 该用户是否注册
	 * @param username
	 * @return
	 */
	private int isHasUser(String username){
		return userDao.isHasUser(username);
	}
	/**
	 * 	根据用户名返回用户信息
	 * @param username
	 * @return
	 */
	public Object getUser(String username)throws Exception{
		return userDao.getUserByName(username);
	}
	
	/**
	 * 判断用户是否登陆
	 * 用户在线是返回该用户的token
	 * 用户不在线时返回空字符串
	 */
	public String isLogin(String token, int userid) throws Exception{
		if(deviceDao.isOnline(token, userid, "customer")){
			return userid+"";
		}
		return "";
	}
	
	/**
	 * 添加一个在线用户标示
	 * @param devices
	 */
	private void addDevices(Device device){
		deviceDao.save(device);
	}
	/**
	 * 处理用户登陆逻辑
	 */
	public String service(Object o, Device device) throws Exception{
		String returninfo = "";
		CustomerUser cuser = null;
		if(o instanceof CustomerUser){
			cuser = (CustomerUser)o;
		}else{
			throw new Exception();
		}
		int userid = isHasUser(cuser.getUsername(), cuser.getPassword()); 
		/* 
		 * 用户名不存在返回0
		 * 密码错误返回1
		 * 登陆成功用户id
		 */
		if(userid != -1 && userid !=0){
			//该用户存在
			String islogin = isLogin(device.getToken(), userid);
			if(!islogin.equals("")){
				//当用胡在线时登录操作
				//用户在线时登录：t出在线人，自己登录
				Device d = new Device();
				d.setDevice_id(device.getDevice_id());
				d.setUserid(userid);
				d.setToken(device.getToken());
				d.setRole("customer");
			
				deviceDao.delete(d);
				String newtoken = IDGenertor.newToken(userid+"");
				device.setToken(newtoken);
				device.setUserid(userid);
				device.setRole("customer");
				device.setRegistration_id("0");
				addDevices(device);
				returninfo = JsonHandler.MapToJson(returnMap(true, "登录成功", userDao.getNickNameByTel(cuser.getUsername()), device.getToken()));
			}else{
				//当前用户存在不在线，生成token入库并返回
				String newtoken = IDGenertor.newToken(userid+"");
				device.setToken(newtoken);
				device.setUserid(userid);
				device.setRole("customer");
				addDevices(device);
				returninfo = JsonHandler.MapToJson(returnMap(true, "登陆成功", userDao.getNickNameByTel(cuser.getUsername()), newtoken));
			}
		}else if(userid == -1){
			//密码错误
			returninfo =  "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\"用户密码错误\"}";
		}else{
			//用户名错误
			returninfo =  "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\"没有该用户\"}";
		}
		return returninfo;
	}
	
	private Map returnMap(boolean flag,String emsg,String nickname, String token){
		Map map = new HashMap();
		map.put("success", flag);
		map.put("emsg", emsg);
		map.put("nickname", nickname);
		map.put("token", token);
		return map;
	}
	
	/**
	 * 修改用户密码
	 * @param password
	 * @return
	 */
	public String updatePsw(Object o,String token) throws Exception{
		boolean flag = userDao.updatePsw(o);
		String returninfo = "";
		if(flag)
			returninfo = "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"密码修改成功\"}";
		else
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"密码修改失败\"}";
		return returninfo;
	}
	
	/**
	 * 用户注销
	 */
	public String logout(Device d) throws Exception{
		if(deviceDao.delete(d)){
			return "{\"success\":true,\"token\":\"\",\"emsg\":\"注销成功\"}";
		}
		return "{\"success\":true,\"token\":\""+d.getToken()+"\",\"emsg\":\"注销失败\"}";
	}
	
	/**
	 * 用户修改手机号码
	 */
	public String updatePhoneNum(Object user, String newmobilenumber,String newpassword, String token) throws Exception {
		//判断该手机号码是否被注册
		if(userDao.getNickNameByTel(newmobilenumber).equals("")){
			if(userDao.updatePhoneNum(user,newmobilenumber)){
				//修改用户名时还要更改用户密码
				userDao.updatePassWord(user,newpassword);
				return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"手机号码修改成功\"}";
			}
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"密码输入错误\"}";
		}else{
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"该手机号已被注册\"}";
		}
	}	
	/**
	 * 修改用户昵称
	 */
	public String updateNickName(String nickName, String token) throws TokenException,Exception{
		if(userDao.updateNickName(nickName,IDGenertor.getUserID(token))){
			return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"昵称修改成功\"}";
		}
		return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"昵称修改失败\"}";
	}
	
	/**
	 * 用户根据原密码和新密码修改密码
	 */
	public String updatePsw(String newpassword,String oldpassword, String token) throws TokenException,Exception{
		boolean flag = userDao.updatePsw(newpassword,oldpassword,IDGenertor.getUserID(token));
		String returninfo = "";
		if(flag)
			returninfo = "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"密码修改成功\"}";
		else
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"密码修改失败\"}";
		return returninfo;
	}
	
	/**
	 * 跟新用户的信息
	 */
	public String updateInfo(Object o,String token) throws Exception{
		return null;
	}
	public String getShopsAddress(int deliveryid) throws Exception {
		return null;
	}
	public int getShopsID(int userid) {
		return 0;
	}
	public String getUserTel(int userID) throws Exception {
		return null;
	}
	public Object getUser(int userID) throws Exception {
		return null;
	}
	
}
