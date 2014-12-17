package jk.o1office.ht.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.ProductCategoryDao;
import jk.o1office.ht.domin.ProductCategory;
import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.utils.JSONHandler;

public class ProductCategoryServiceImpl implements ProductCategoryService {
	private ProductCategoryDao productCategoryDao;
	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}
	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}
	
	
	public String save(ProductCategory pc) throws Exception {
		String returninfo = "";
		if(productCategoryDao.isHas(pc.getCategoryname())){
			returninfo = "<script>alert('该分类已经存在')</script>";
		}else{
			productCategoryDao.save(pc);
			returninfo = "<script>alert('添加分类成功')</script>";
		}
		return returninfo;
	}
	
	public String getType(int type, int offset, int rows)throws Exception {
		List<ProductCategory> productcates =  productCategoryDao.getType(type, offset, rows);
		int total = productCategoryDao.getCount(type);
		Map map = new HashMap();
		map.put("rows", productcates);
		map.put("total", total);
		return JSONHandler.MapToJson(map);
	}
	
	public String getType(int type) throws Exception{
		List<ProductCategory> productCategories = productCategoryDao.getType(type);
		return JSONHandler.ArrayToJson(productCategories);
	}
	public void editTypeName(int id, String name) throws Exception {
		productCategoryDao.editTypeName(id,name);
	}

	public String delType(int id, int pid) throws Exception {
		productCategoryDao.delType(id, pid);
		return "删除成功";
	}
	
	public void editType(ProductCategory type) {
		productCategoryDao.editType(type);
	}
	
	public List<String> getTypeImgNames() {
		List<String> typeImgs = productCategoryDao.getTypeImgs();
		List<String> typeImgNames = new ArrayList<String>();
		for(String typeImg : typeImgs){
			typeImgNames.add(typeImg.substring(typeImg.lastIndexOf("/")));
		}
		return typeImgNames;
	}
	
	public int getGoodsCount() {
		return productCategoryDao.getGoodsCount();
	}
	
	public String getTwoTypes() throws Exception {
		List<ProductCategory> categories = productCategoryDao.getTwoTypes();
		List<Map> maps = new ArrayList<Map>();
		for(ProductCategory category : categories){
			Map map = new HashMap();
			map.put("id", category.getId());
			map.put("text", category.getCategoryname());
			maps.add(map);
		}
		return JSONHandler.ArrayToJson(maps);
	}

}
