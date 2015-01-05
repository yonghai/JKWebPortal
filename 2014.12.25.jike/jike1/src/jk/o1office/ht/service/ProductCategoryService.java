package jk.o1office.ht.service;

import java.util.List;

import jk.o1office.ht.domin.ProductCategory;

public interface ProductCategoryService {
	
	/**
	 * 保存分类
	 * @param pc
	 * @throws Exception
	 */
	String save(ProductCategory pc) throws Exception;

	/**
	 * 获取分类
	 * @param type (-1为所有父分类;0为所有分类;n父分类id为n的子分类)
	 * @return
	 * @throws Exception
	 */
	String getType(int type, int offset, int rows) throws Exception;
	
	String getType(int type) throws Exception;
	
	/**
	 * 更新分类
	 * @param id
	 * @param name
	 * @throws Exception
	 */
	void editTypeName(int id, String name) throws Exception;

	String delType(int id, int pid) throws Exception;

	void editType(ProductCategory type);

	/**
	 * 获取分类的所有图片名字
	 * @return
	 */
	List<String> getTypeImgNames();

	int getGoodsCount();

	String getTwoTypes() throws Exception;

}
