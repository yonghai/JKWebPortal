package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.Shops;

public interface ShopsDao {

	/**
	 * 保存商家
	 * @param shops
	 */
	String saveShops(Shops shops);

	/**
	 * 获取商家列表
	 * @return
	 */
	List<Shops> getShops(int offset,int rows);

	/**
	 * 获取商家记录数
	 * @return
	 */
	int getCount();

	/**
	 * 删除指定的商家
	 * @param id
	 */
	void deleteShops(int id);

	List<Shops> getShops(int offset, int rows, String shopname);

	int getCount(String shopname);

	void editShops(Shops shops);

	List<String> getShopsImgs();

}
