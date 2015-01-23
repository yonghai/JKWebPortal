package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.DeliveryUser;
import jk.o1office.domin.Device;


public interface UserService {
	/**
	 * 保存用户信息
	 * @param o
	 * @return
	 * @throws Exception 
	 */
	String save(Object o, Device device, String token) throws Exception;

	int isHasUser(String username,String password) throws Exception;
	
	String service(Object o, Device device) throws Exception;

	String logout(Device d) throws Exception;

	String updatePsw(Object o,String token) throws Exception;
	
	String updatePsw(String newpassword,String oldpassword,String token) throws Exception;

	String updatePhoneNum(Object user, String newmobilenumber,String newpassword, String token) throws Exception;

	String updateNickName(String nickName, String token) throws Exception;

	String updateInfo(Object o,String token) throws Exception;
	
	String getShopsAddress(int deliveryid) throws Exception;

	int getShopsID(int userid);

	String getUserTel(int userID) throws Exception;

	Object getUser(int userID) throws Exception;

}
