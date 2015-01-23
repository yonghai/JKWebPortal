package jk.o1office.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.DeviceDao;
import jk.o1office.dao.UserDao;
import jk.o1office.domin.DeliveryUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.DuserReisterException;
import jk.o1office.excetion.TokenException;
import jk.o1office.finals.Constant;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;
import jk.o1office.utils.SessionCache;


public class DeliveryUserServiceImpl implements UserService {
	private UserDao userDao;
	private DeviceDao deviceDao;
	private SessionCache session;
	public SessionCache getSession() {
		return session;
	}
	public void setSession(SessionCache session) {
		this.session = session;
	}
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
	 * 没有该用户返回0
	 * 密码错误返回-1
	 * 正确返回用户id
	 */
	public int isHasUser(String tel, String password) {
		return userDao.isHasUser(tel, password);
	}

	public String logout(Device d) {
		if(deviceDao.delete(d)){
			return "{\"success\":true,\"emsg\":\"配送员注销成功\",\"token\":\"\"}";
		}
		return "{\"success\":false,\"emsg\":\"配送员注销失败\",\"token\":\""+d.getToken()+"\"}";
	}

	/**
	 * 配送员注册保存信息
	 */
	public String save(Object o,Device device,String token)throws DuserReisterException,Exception {
	/*	Serializable id = userDao.saveBasicInfo(o);
		if(!(id+"").equals("0")){
			return "{\"success\":true,\"id\":\""+id+"\",\"token\":\""+token+"\",\"emsg\":\"基本信息添加成功\"}";
		}else{
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"基本信息添加失败\"}";
		}*/
		DeliveryUser du = (DeliveryUser)o;
		if(null==device){
			DeliveryUser duser = (DeliveryUser)session.getAttr(du.getIdnumber());
			if(null==duser)
				throw new DuserReisterException();
			//用户注册保存数据
			int id = userDao.isHasUser(duser.getTelphone());
			if(id!=0){	/*存在注册用户*/
				session.removeAttr(duser.getIdnumber());
				return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"该手机号已被注册\"}";
			}else{
				Serializable duid = userDao.saveBasicInfo(duser);
				if(duid.toString().equals("0")){
					return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"配送员注册失败\"}";
				}else{
				/*	String newtoken = IDGenertor.newToken(duid+"");
					Device devi = new Device();
					devi.setToken(newtoken);
					devi.setUserid(duid+"");
					devi.setRole("delivery");
					addDevices(devi);*/
					return "{\"success\":true,\"token\":\"\",\"emsg\":\"配送员注册成功\"}";
				}
			}
		}else{
			session.setAttr(du.getTelphone(), du);
			return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"基本信息添加成功\"}";
		}	
	}

	/**
	 * 	根据用户电话返回用户信息
	 * @param username
	 * @return
	 */
	public Object getUser(String tel){
		return userDao.getUserByName(tel);
	}
	
	/**
	 * 判断用户是否登陆
	 */
	public String isLogin(String token, int userid){
		if(deviceDao.isOnline(token, userid, "delivery")){
			return token+"="+userid;
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
	
	public String service(Object o, Device device) throws Exception{
		String returninfo = "";
		DeliveryUser duser = null;
		if(o instanceof DeliveryUser){
			duser = (DeliveryUser)o;
		}else
			throw new Exception();
		int userid = isHasUser(duser.getTelphone(), duser.getPassword()); 
		if(userid != 0 && userid != -1){
			//存在该用户
			if(!isLogin(device.getToken(), userid).equals("")){/*该用户当前在线*/
				//
				Device d = new Device();
				d.setDevice_id(device.getDevice_id());
				d.setUserid(userid);
				d.setToken(device.getToken());
				d.setRole("delivery");
				deviceDao.delete(d);
				String newtoken = IDGenertor.newToken(userid+"");
				device.setToken(newtoken);
				device.setUserid(userid);
				device.setRole("delivery");
				addDevices(device);
				returninfo = JsonHandler.MapToJson(getMap(true, "登陆成功", getShopsAddress(userid), getUser(duser.getTelphone()), newtoken));
			}else{
				//当前用户存在不在线，生成token入库并返回
				String newtoken = IDGenertor.newToken(userid+"");
				device.setToken(newtoken);
				device.setUserid(userid);
				device.setRole("delivery");
				addDevices(device);
				returninfo = JsonHandler.MapToJson(getMap(true, "登陆成功", getShopsAddress(userid), getUser(duser.getTelphone()), newtoken));
			}
		}else if(userid == 0){
			returninfo = JsonHandler.MapToJson(getMap(false, "没有该用户", "", ""));
		}else{
			returninfo = JsonHandler.MapToJson(getMap(false, "密码输入错误", "", ""));
		}
		return returninfo;
	}

	private Map getMap(boolean isscuss,String emsg,Object userinfo,String token){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("data", userinfo);
		map.put("token", token);
		return map;
	}
	
	private Map getMap(boolean isscuss,String emsg,String deliveryaddress,Object userinfo,String token){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("data", userinfo);
		map.put("token", token);
		map.put("deliveryaddress", deliveryaddress);
		return map;
	}

	public String updateNickName(String nickName, String token) {
		return null;
	}

	public String updatePhoneNum(Object user, String newmobilenumber, String newpassword,
			String token) {
		//判断该手机号码是否被注册
		if(userDao.getNickNameByTel(newmobilenumber).equals("")){
			if(userDao.updatePhoneNum(user,newmobilenumber)){
				userDao.updatePassWord(user,newpassword);
				return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"手机号码修改成功\"}";
			}
			return "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"售价好吗修改失败\"}";
		}else{
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"该手机号已被注册\"}";
		}
	}

	public String updatePsw(Object o, String token) {
		boolean flag = userDao.updatePsw(o);
		String returninfo = "";
		if(flag)
			returninfo = "{\"success\":true,\"token\":\""+token+"\",\"emsg\":\"密码修改成功\"}";
		else
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"密码修改失败\"}";
		return returninfo;
	}

	public String updatePsw(String newpassword,String oldpassword, String token)throws TokenException,Exception {
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
	public String updateInfo(Object o,String token) throws DuserReisterException,Exception{
		/*if(userDao.updateInfo(o)){
			return "{\"success\":true,\"emsg\":\"添加用户信息成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"添加用户信息失败\",\"token\":\""+token+"\"}";*/
		DeliveryUser du = (DeliveryUser)o;
		System.out.println(du.getTelphone());
		DeliveryUser duser = (DeliveryUser)session.getAttr(du.getTelphone());
		if(null==duser)
			throw new DuserReisterException();
		duser.setCreatetime(new Date());
		duser.setUsername(du.getUsername());
		duser.setShop_id(du.getShop_id());
		duser.setTelphone(du.getTelphone());
		duser.setIdnumber(du.getIdnumber());
		duser.setImgpath(Constant.IMGPATH+"delivery/"+du.getIdnumber()+"/tx.jpg");
		session.setAttr(duser.getIdnumber(), duser);
		return "{\"success\":true,\"emsg\":\"添加用户信息成功\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 获取配送员所属的区域地址
	 * @param deliveryid
	 * @return
	 */
	public String getShopsAddress(int deliveryid) throws Exception{
		return userDao.getShopsAddress(deliveryid);
	}
	
	public int getShopsID(int userid) {
		return userDao.getShopsID(userid);
	}
	
	public String getUserTel(int userID) throws Exception {
		String tel = userDao.getUserTelByID(userID);
		return tel;
	}
	public Object getUser(int userID) throws Exception {
		return userDao.getUserByID(userID);
	}
	
	
}
