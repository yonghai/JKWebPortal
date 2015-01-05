package jk.o1office.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


import jk.o1office.dao.ProductDao;
import jk.o1office.domin.Product;
import jk.o1office.domin.ProductRecord;
import jk.o1office.domin.Shops;
import jk.o1office.excetion.TokenException;
import jk.o1office.service.KeyService;
import jk.o1office.service.ProductService;
import jk.o1office.service.ShopsService;
import jk.o1office.utils.Distance;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

public class ProductServiceImpl implements ProductService {
	private Logger logger = Logger.getLogger("ProductServiceImpl");
	private ProductDao productDao;
	private KeyService keyService;
	private ShopsService shopsService;
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
	}
	public KeyService getKeyService() {
		return keyService;
	}
	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	/**
	 * 根据商品类别查询商品，支持分页
	 */
	@SuppressWarnings("unchecked")
	public String queryProductsByType(int categoryId, int offset,int pagesize, String token) throws Exception{
		List<Product> products = productDao.queryProductByType(categoryId,offset,pagesize);
		boolean issuccss = true;
		String emsg = "商品加载完成";
		if(products.size()==0){
			//issuccss = false;
			emsg = "没有该类商品";
		}
		int total = productDao.getCount(categoryId);
		return JsonHandler.MapToJson(getMap(issuccss,emsg,token,total, 
				JsonHandler.ObjectToJSONArray(products, 
				new String[]{"ordernum","tradenum","createtime","version","product_description"})));
	}
	
	private Map getMap(boolean issucss,String emsg,String token,int total,List<Product> products){
		Map map = new HashMap();
		map.put("success", issucss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("total", total);
		map.put("data", products);
		return map;
	}
	
	private Map getMap(boolean issucss,String emsg,String token,Object data){
		Map map = new HashMap();
		map.put("success", issucss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		return map;
	}
	
	/**
	 *	根据关键字查询商品
	 *	如果关键字大于3位则存入库中
	 */
	@SuppressWarnings("unchecked")
	public String searchProductByKeyWord(int offset, int rows, String keyword, String token) throws TokenException,Exception {
		logger.info(offset+"  "+rows);
		logger.info(keyword);
		if(keyword.length()>0 && keyword.length()<=3 && !token.equals("")){
			keyService.saveOrUpdate(keyword,IDGenertor.getUserID(token));
		}
		//根据分类模糊查询
		List<Product> products = productDao.searchProductLikeName(offset,rows,keyword);
		int total = productDao.getCountLikeName(keyword);
		logger.info("product=="+products);
		logger.info("total=="+total);
		//如果根据分类查询没有结果，则根据商品名称模糊查询
		if(products.size()==0){
			products = productDao.searchProductByKeyWord(offset,rows,keyword);
			total = productDao.getCount(keyword);
		}
		logger.info(total);
		logger.info(products);
		logger.info("============================");
		logger.info(JsonHandler.MapToJson(getMap(true, "搜索的商品", token, total,
				JsonHandler.ObjectToJSONArray(products, 
						new String[]{"ordernum","tradenum","createtime","version","product_description"}))));
		return JsonHandler.MapToJson(getMap(true, "搜索的商品", token, total,
				JsonHandler.ObjectToJSONArray(products, 
						new String[]{"ordernum","tradenum","createtime","version","product_description"})));
	}
	
	/**
	 * 返回自己的商品记录
	 * @return
	 */
	private List<Product> hasSelfProductRecord(int userid){
		return productDao.getProductRecord(userid);
	}
	
	/**
	 * 查询销量由高到低的记录商品列表
	 * @return
	 */
	private List<Product> getTopProductRecord(){
		return productDao.getTopProductRecoed();
	}
	
	/**
	 * 商品记录
	 * 如果自己有购买记录则显示自己的购买记录
	 * 如果没有购买记录则显示销量较高的商品
	 */
	@SuppressWarnings("unchecked")
	public String productRecord(String token) throws TokenException,Exception{
		List<Product> products = hasSelfProductRecord(IDGenertor.getUserID(token));
		Map map = new HashMap();
		if(products.size()==0){
			map.put("success", true);
			map.put("emsg", "销量最高记录");
			map.put("token", token);
			map.put("data", getTopProductRecord());
			map.put("type", "0");
			return JsonHandler.MapToJson(map);
		}else{
			map.put("success", true);
			map.put("emsg", "购买记录");
			map.put("token", token);
			map.put("data", JsonHandler.ObjectToJSONArray(products, new String[]{
					"ordernum","tradenum","createtime","version","product_description"}));
			map.put("type", "1");
			return JsonHandler.MapToJson(map);
		}
	}
	
	/**
	 * 根据条形码获取商品信息
	 */
	public String getProductByBarCode(String barcode, String token) throws Exception{
		List<Product> products = productDao.getProductByBarCode(barcode);
		return JsonHandler.MapToJson(getMap(true, "商品列表", token, 
				JsonHandler.ObjectToJson(products, new String[]{
				"ordernum","tradenum","createtime","version"})));
	}
	
	/**
	 * 根据商品id查询商品信息
	 */
	public String getProductByID(int productid, String token) throws Exception{
		List<Product> products = productDao.getProductByID(productid);
		return JsonHandler.MapToJson(getMap(true, "根据id查找的商品", token, 
				JsonHandler.ObjectToJSONArray(products, new String[]{
						"ordernum","tradenum","createtime","version",
						"product_version","protechnics","pvalume","pweight",
						"qualitylevel","storerange","dosing","pbzq",
						"product_category"})));
	}
	
	public static void main(String[] args) {
		String where = "";
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(1);
		ids.add(2);
		ids.add(3);
		for(int id : ids)
			where += (id+",");
		where = where.substring(0,where.length()-1);
		System.out.println(where);
	}
	
	/**
	 * 1.获取商品的所有id
	 * 2.更新商品的销售次数
	 */
	public void updateProductCount(String orderid) {
		List list = productDao.getProductIDAndProductNum(orderid);
		System.out.println(list);
		for(Object obj : list){
			Object[] os = (Object[])obj;
			productDao.updateProductCount(Integer.parseInt(os[0]+""),Integer.parseInt(os[1]+""));
		}
	}

	/**
	 * 定位后的操作，暂时未实现
	 */
	@SuppressWarnings("unchecked")
	public String productRecord(double longitude, double latitude, String token) throws TokenException,Exception{
		//获取所有的商家信息
		List<Shops> shopss = shopsService.getShops();
		if(shopss.size()==0)
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有商家\"}";
		//获取最近的商家信息
		Shops shops = getMinDistanceShops(shopss, longitude, latitude);
		if(null==shops)
			throw new Exception();
		//获取用户历史的购买商品记录
		List<Product> products = hasSelfProductRecord(IDGenertor.getUserID(token));
		Map map = new HashMap();
		//如果没有商品购买记录，则获取该最近商家的的销量记录
		if(products.size()==0){
			map.put("success", true);
			map.put("emsg", "销量最高记录");
			map.put("token", token);
			map.put("data", getTopProductRecord());
			map.put("type", "0");
			return JsonHandler.MapToJson(map);
		}else{
			map.put("success", true);
			map.put("emsg", "购买记录");
			map.put("token", token);
			map.put("data", JsonHandler.ObjectToJSONArray(products, new String[]{
					"ordernum","tradenum","createtime","version","product_description"}));
			map.put("type", "1");
			return JsonHandler.MapToJson(map);
		}
	}
	
	/**
	 * 根据定位搜索最近商家的商品列表
	 */
	@SuppressWarnings("unchecked")
	public String searchProductByKeyWord(int offset, int rows,
			double longitude, double latitude, String keyword, String token)throws TokenException,Exception {
		//如果用户登录，保存或更新用户搜索的关键字次数
		if(keyword.length()>0 && keyword.length()<=3 && !token.equals("")){
			keyService.saveOrUpdate(keyword,IDGenertor.getUserID(token));
		}
		//获取所有的商家
		List<Shops> shopss = shopsService.getShops();
		if(shopss.size()==0)
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有商家\"}";
		//获取最近的商家
		Shops shops = getMinDistanceShops(shopss, longitude, latitude);
		if(null==shops)
			throw new Exception();
		//该最近的商家的所有商品id
		List<Integer> ids = shopsService.getPID(shops.getId());
		String where = "";
		for(int id : ids)
			where += (id+",");
		where = where.substring(0,where.length()-1);
		List<Product> products = productDao.searchProductByKeyWord(offset,rows,keyword,where);
		int total = productDao.getCount(keyword,where);
		return JsonHandler.MapToJson(getMap(true, "搜索的商品", token, total,
				JsonHandler.ObjectToJSONArray(products, 
						new String[]{"ordernum","tradenum","createtime","version","product_description"})));
	}
	
	
	/**
	 * 根据经维度获取最近的商家
	 * @param ss
	 * @param longitude
	 * @param latitude
	 * @return
	 */
	private Shops getMinDistanceShops(List<Shops> ss,double longitude, double latitude){
		if(ss.size()==0)
			return null;
		double d1 = 0;
		int n = 0;
		for(int i=0;i<ss.size();i++){
			Shops s = ss.get(i);
			double d2 = Distance.GetDistance(Double.parseDouble(s.getLongitude()), Double.parseDouble(s.getLatitude()), longitude, latitude);
			if(i==0){
				d1 = d2;
			}
			if(d1>d2){
				d1 = d2;
				n = i;
			}
		}
		return ss.get(n);
	}
	
	/**
	 * @throws Exception 
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String queryProductsByType(int categoryId, int offset, int pagesize,
			int shopsid, String token) throws Exception {
		//根据商家id和分类id获取该商家的某二级分类的所有商品的id
		List<Integer> pids = shopsService.getPID(shopsid,categoryId);
		String where = "";
		for(int id : pids)
			where += (id+",");
		where = where.substring(0,where.length()-1);
		//获取所有where条件的商品的信息
		List<Product> products = productDao.queryProductByWhere(where,offset,pagesize);
		boolean issuccss = true;
		String emsg = "商品加载完成";
		if(products.size()==0){
			emsg = "没有该类商品";
		}
		int total = pids.size();
		return JsonHandler.MapToJson(getMap(issuccss,emsg,token,total, 
				JsonHandler.ObjectToJSONArray(products, 
				new String[]{"ordernum","tradenum","createtime","version","product_description"})));
	}
	
	/**
	 * 返回改商品的价格，是否促销，促销价格，是否缺货
	 */
	
	@SuppressWarnings("unchecked")
	public String checkOrder(String[] goodsids, String token) throws Exception {
		if(goodsids.length<1){
			throw new Exception();
		}
		List<Product> products = productDao.getProductIDs(goodsids);
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "商品信息");
		map.put("token", token);
		map.put("data", JsonHandler.ObjectToJSONArray(products, new String[]{
			"bar_code","createtime","dosing","feature","ordernum","pbzq","product_brand",
			"product_category","product_description","product_img","product_name",
			"product_version","protechnics","pvalume","pweight","qualitylevel","storerange",
			"tradenum","version"
		}));
		return JsonHandler.MapToJson(map);
	}
	
	public boolean checkPrice(int productId, String productPrice) {
		return productDao.checkPrice(productId,productPrice);
	}
	
	public void updateProductRecord(String orderid) throws Exception {
		List list = productDao.getProductIDAndUserID(orderid);
		for(Object obj : list){
			Object[]os = (Object[])obj;
			ProductRecord productRecord = new ProductRecord();
			productRecord.setProductid(Integer.parseInt(os[0]+""));
			productRecord.setShopsid(0);
			productRecord.setUserid(Integer.parseInt(os[1]+""));
			productDao.save(productRecord);
		}
	}
}
