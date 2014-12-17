package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.GoodsCategory;

public interface GoodsCategoryService {

	String getGoodsCategories(int id,String token) throws Exception;
	
	List<GoodsCategory> getGoodsCategories(int id) throws Exception ;

	String getGoodsCategories(int parseInt, double longitude, double latitude,
			String token) throws Exception;

}
