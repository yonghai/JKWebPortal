package jk.o1office.ht.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import jk.o1office.ht.dao.ProductDao;
import jk.o1office.ht.domin.Product;
import jk.o1office.ht.finals.Constant;
import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.service.ProductService;
import jk.o1office.ht.utils.ImageHandler;
import jk.o1office.ht.utils.JSONHandler;

public class ProductServiceImpl implements ProductService {
	private ProductDao productDao;
	private ProductCategoryService productCategoryService;
	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}
	public void setProductCategoryService(
			ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public void addP(Product product) throws Exception{
		productDao.save(product);
	//	FileUtil.reNameTo(product.getPimgpath(), product.getPname());
		String file = product.getPimgpath();
		file = file.replace(Constant.IMGURL, "");
		ImageHandler.resize(file, 300, 1f);
		ImageHandler.resize(file, 160, 1f);
	}
	
	public static void main(String[] args) {
		
		String file = "http://112.126.73.24:8080/jk/product/1000721.jpg";
		file = file.replace(Constant.IMGURL, "");
		System.out.println(file);
	}
	
	public String getProductList(int offset, int rows) {
		List<Product> products = productDao.getProductList(offset, rows);
		int total = productDao.getCount();
		System.out.println("total    "+total);
		Map map = new HashMap();
		map.put("total", total);
		map.put("rows", products);
		return JSONHandler.MapToJson(map);
	}
	
	public String delProduct(int id) throws Exception {
		productDao.delProduct(id);
		return "删除成功";
	}
	
	public String getProductList(int offset, int rows, String goodsname) {
		List<Product> products = productDao.getProductList(offset, rows, goodsname);
		int total = productDao.getCount(goodsname);
		System.out.println("total    "+total);
		Map map = new HashMap();
		map.put("total", total);
		map.put("rows", products);
		return JSONHandler.MapToJson(map);
	}
	
	public List<String> getProductImgNames() {
		List<String> productImgs = productDao.getProductImgs();
		List<String> productImgNames = new ArrayList<String>();
		for(String productImg : productImgs){
			productImgNames.add(productImg.substring(productImg.lastIndexOf("/")));
		}
		return productImgNames;
	}
	public String updateGoods(Product p) throws Exception {
		productDao.updateGoods(p);
		return "编辑成功";
	}
	
	public String getGoodsCount() throws Exception {
		int count1 = productCategoryService.getGoodsCount();	//获取分类的种类
		int count2 = productDao.getGoodsCount();				//获取商品的数量
		return "["+count1+","+count2+"]";
	}
	
	public void deletePromotionGoods(int goodsid) {
		productDao.deletePromotionGoods(goodsid);
	}
	
	public boolean checkPrice(int productId, String productPrice) {
		return productDao.checkPrice(productId, productPrice);
	}
}
