package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Key;

public interface KeyDao {

	void saveOrUpdate(String keyword,int userid);

	List<String> getKeyList(int userID);

}
