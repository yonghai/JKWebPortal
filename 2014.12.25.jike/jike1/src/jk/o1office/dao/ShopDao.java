package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Shop;

public interface ShopDao {

	/**
	 * 根据areaid获取商店列表
	 * @param areaid
	 * @return
	 */
	List<Shop> getShopByArea(int areaid);

}
