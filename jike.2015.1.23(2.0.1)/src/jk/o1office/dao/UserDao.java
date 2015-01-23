package jk.o1office.dao;

import java.io.Serializable;
import java.util.List;

import jk.o1office.domin.CustomerUser;


public interface UserDao {
	/**
	 * 保存用户信息
	 * @param o
	 * @return
	 */
	Serializable saveBasicInfo(Object o);
	
	boolean save(Object o);

	int isHasUser(String username,String password);

	Object getUserByName(String username);

	boolean updatePsw(Object o);
	
	boolean updatePsw(String newpassword,String oldpassword, int userid);

	boolean updatePhoneNum(Object user, String newphonenum);

	boolean updateNickName(String nickName, int userid);

	boolean updateInfo(Object o);

	String getNickNameByTel(String username);

	int isHasUser(String username);

	String getUserID(String name);

	String getShopsAddress(int deliveryid);

	void updatePassWord(Object user,String newpassword);

	int getShopsID(int userid);

	Object getUserByID(int userID);

	String getUserTelByID(int userID);

}
