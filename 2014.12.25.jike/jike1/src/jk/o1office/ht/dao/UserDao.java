package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.CommonUser;
import jk.o1office.ht.domin.DeliveryUser;
import jk.o1office.ht.domin.User;

public interface UserDao {

	
	boolean login(User user);

	int count();

	List<User> queryUser(int offset, int rows);

	void delUser(int id);

	boolean updateUser(User user);

	List<User> queryUser(int offset, int rows, String name);

	int count(String name);

	User getUserInfo(int id);

	List<User> queryUser(int offset, int rows, int type);

	int count(int type);

	List<User> queryUser(int offset, int rows, int type, String name);

	int count(int type, String name);

	int[] getOrderCount();

}
