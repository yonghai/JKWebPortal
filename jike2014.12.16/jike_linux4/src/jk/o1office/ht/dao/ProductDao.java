package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.Product;

public interface ProductDao {
	
	/**
	 * 保存商品信息
	 * @param product
	 */
	void save(Product product);
	
	/**
	 * 获取商品列表(分页)
	 * @return
	 */
	List<Product> getProductList(int offset, int rows);
	
	/**
	 * 返回最记录数
	 * @return
	 */
	int getCount();

	void delProduct(int id);

	List<Product> getProductList(int offset, int rows, String goodsname);

	int getCount(String goodsname);

	List<String> getProductImgs();

	void updateGoods(Product p);

	int getGoodsCount();

	void deletePromotionGoods(int goodsid);

	boolean checkPrice(int productId, String productPrice);

}
