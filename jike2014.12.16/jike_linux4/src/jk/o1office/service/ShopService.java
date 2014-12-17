package jk.o1office.service;

public interface ShopService {

	/**
	 * 根据地区获取商店列表
	 * @param areaid
	 * @param token
	 * @return
	 * @throws Exception 
	 */
	String getShopListByArea(int areaid, String token) throws Exception;

}
