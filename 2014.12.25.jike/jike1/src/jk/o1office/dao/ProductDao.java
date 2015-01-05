package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Product;
import jk.o1office.domin.ProductRecord;

public interface ProductDao {

	List<Product> queryProductByType(int categoryId, int offset,int pagesize);

	List<Product> searchProductByKeyWord(int offset,int pagesize,String keyword);

	List<Product> getProductRecord(int userid);

	List<Product> getTopProductRecoed();

	List<Product> getProductByBarCode(String barcode);

	List<Product> getProductByID(int productid);

	int getCount(int id);

	int getCount(String keyword);

	List<Integer> getProductID(String orderid);

	void updateProductCount(int productid,int productnum);

	List<Product> searchProductByKeyWord(int offset, int rows, String keyword,
			String where);

	int getCount(String keyword, String where);

	List<Product> queryProductByWhere(String where, int offset, int pagesize);

	List<Product> getProductIDs(String[] goodsids);

	boolean checkPrice(int productId, String productPrice);

	List<Product> searchProductLikeName(int offset, int rows, String keyword);

	int getCountLikeName(String keyword);

	void save(Object obj);

	List getProductIDAndUserID(String orderid);

	List getProductIDAndProductNum(String orderid);

}
