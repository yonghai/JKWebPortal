package jk.o1office.ht.service;

import java.util.List;

import jk.o1office.ht.domin.Shops;

public interface ShopsService {

	/**
	 * 添加商家
	 * @param shops
	 * @return
	 */
	String addShops(Shops shops) throws Exception;

	/**
	 * 获取Shan商家列表
	 * @return
	 */
	String getShops(int offset,int rows) throws Exception;

	/**
	 * 条件查询商家列表
	 * @param offset
	 * @param rows
	 * @param shopname
	 * @return
	 */
	String getShops(int offset, int rows, String shopname);
	/**
	 * 删除指定的商家
	 * @param id
	 * @return
	 */
	String delShops(int id,String name) throws Exception;

	String editShops(Shops shops);

	/**
	 * 获取shops的所有图片名字
	 * @return
	 */
	List<String> getShopsImgNames();

}
