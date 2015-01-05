package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.Shops;

public interface ShopsService {

	/**
	 * 根据区域id获取商家
	 * @param areaid
	 * @param token
	 * @return
	 * @throws Exception
	 */
	String getShops(int areaid, String token) throws Exception;

	/**
	 * 获取所有的商家信息
	 * @return
	 * @throws Exception
	 */
	List<Shops> getShops() throws Exception;

	/**
	 * 根据商家id获取该商家的分类id
	 * @param id
	 * @return
	 */
	List<Integer> getPCID(int id);

	List<Integer> getPID(int id);

	List<Integer> getPID(int shopsid, int categoryId);

	int getAreaID(int shopsid);

	List<Integer> getShopsIDs(int areaid);
}
