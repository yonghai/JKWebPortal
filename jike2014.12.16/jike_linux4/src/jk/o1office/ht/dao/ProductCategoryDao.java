package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.ProductCategory;

public interface ProductCategoryDao {

	void save(ProductCategory pc);

	List<ProductCategory> getType(int id, int offset, int rows);

	/**
	 * 该分类是否存在
	 * @param categoryname
	 * @return
	 */
	boolean isHas(String categoryname);

	/**
	 * 修改分类
	 * @param id
	 * @param name
	 */
	void editTypeName(int id, String name);

	int getCount(int type);

	void delType(int id, int pid);

	List<ProductCategory> getType(int type);

	void editType(ProductCategory type);
	
	public List<String> getTypeImgs();

	int getGoodsCount();

	List<ProductCategory> getTwoTypes();

}
