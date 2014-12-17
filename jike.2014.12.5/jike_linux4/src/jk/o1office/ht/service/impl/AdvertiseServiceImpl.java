package jk.o1office.ht.service.impl;
import java.util.List;

import jk.o1office.ht.dao.AdvertiseDao;
import jk.o1office.ht.domin.IDAndPrice;
import jk.o1office.ht.service.AdvertiseService;
import jk.o1office.ht.service.ProductService;
import jk.o1office.ht.utils.JSONHandler;

public class AdvertiseServiceImpl implements AdvertiseService {
	private AdvertiseDao advertiseDao;
	private ProductService productService;
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public AdvertiseDao getAdvertiseDao() {
		return advertiseDao;
	}
	public void setAdvertiseDao(AdvertiseDao advertiseDao) {
		this.advertiseDao = advertiseDao;
	}

	@SuppressWarnings("unchecked")
	public String getAdvers(int isshow) throws Exception{
		if(isshow>4 || isshow<1)
			throw new Exception();
		Object o = advertiseDao.getAdvers(isshow);
		//首页的促销一定有，如果没有，则加载失败
		if(null==o)
			throw new Exception();
		
		System.out.println("  ..............   "+JSONHandler.ArrayToJson(o));
		return JSONHandler.ArrayToJson(o);
	}
	
	
	public String deletePromotionGoods(String goodsid) throws Exception {
		advertiseDao.deletePromotionGoods(Integer.parseInt(goodsid));
		productService.deletePromotionGoods(Integer.parseInt(goodsid));
		return "删除成功";
	}
	
	public String webPromotionSetUp(String title, int isshow,
			String content) throws Exception {
		advertiseDao.webPromotionSetUp(title,isshow,content);
		return "促销页面设置成功";
	}
	
	public String DetailsPromotionSetUp(String title, int isshow,
			IDAndPrice nameAndPrice) throws Exception {
		advertiseDao.detailsPromotionSetUp(title,isshow,nameAndPrice);
		return "促销详情设置成功";
	}
	
	public String listPromotionSetUp(String title, int isshow,
			List<IDAndPrice> idAndPrices) throws Exception {
		advertiseDao.listPromotionSetUp(title,isshow,idAndPrices);
		return "促销列表设置成功";
	}
	
}
