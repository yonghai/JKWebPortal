package jk.o1office.ht.service;

import java.util.List;

import jk.o1office.ht.domin.Product;

public interface ProductService {

	/**
	 * 添加商品
	 * @param product
	 * @throws Exception 
	 */
	void addP(Product product) throws Exception;

	/**
	 * 获取商品列表
	 * @return
	 */
	String getProductList(int offset, int rows) throws Exception;

	/**
	 * 删除指定的商品
	 * @param id
	 * @return
	 */
	String delProduct(int id) throws Exception;

	/**
	 * 根据商品名查找商品
	 * @param offset
	 * @param rows
	 * @param goodsname
	 * @return
	 */
	String getProductList(int offset, int rows, String goodsname);

	/**
	 * 获取商品的所有图片名字
	 * @return
	 */
	List<String> getProductImgNames();

	/**
	 * @param p
	 * @return
	 * @throws Exception
	 */
	String updateGoods(Product p) throws Exception;

	String getGoodsCount() throws Exception;

	void deletePromotionGoods(int goodsid);

	boolean checkPrice(int productId, String productPrice);

}
