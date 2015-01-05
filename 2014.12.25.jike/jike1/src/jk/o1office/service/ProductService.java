package jk.o1office.service;

import jk.o1office.excetion.TokenException;

public interface ProductService {

	String queryProductsByType(int categoryId, int offset,int pagesize, String token) throws Exception;

	String searchProductByKeyWord(int offset,int rows,String keyword, String token) throws Exception;

	String productRecord(String token) throws Exception;

	String getProductByBarCode(String barcode, String token) throws Exception;

	String getProductByID(int productid, String token) throws Exception;

	void updateProductCount(String orderid);

	String productRecord(double longitude, double latitude, String token) throws TokenException, Exception;

	String searchProductByKeyWord(int offset, int rows, double longitude,
			double latitude, String keyword, String token) throws TokenException, Exception;

	String queryProductsByType(int categoryId, int offset, int pagesize,
			int shopsid, String token) throws Exception;

	String checkOrder(String[] goodsids, String token) throws Exception;

	boolean checkPrice(int productId, String productPrice);

	void updateProductRecord(String orderid) throws Exception;

}
