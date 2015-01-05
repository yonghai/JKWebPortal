package jk.o1office.ht.timer;

import java.util.Date;

import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.service.ProductService;
import jk.o1office.ht.service.ShopsService;
import jk.o1office.ht.utils.FileUtil;

import org.apache.log4j.Logger;

public class ClearImgCache {
	private Logger logger = Logger.getLogger(ClearImgCache.class);
	private ShopsService shopsService;
	private ProductService productService;
	private ProductCategoryService productCategoryService;
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}
	public void setProductCategoryService(
			ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}
	
	public void clear(){
		logger.info(new Date()+" clear...");
		FileUtil.delete("shops", shopsService.getShopsImgNames());
		FileUtil.delete("product", productService.getProductImgNames());
		FileUtil.delete("type", productCategoryService.getTypeImgNames());
	}

}
