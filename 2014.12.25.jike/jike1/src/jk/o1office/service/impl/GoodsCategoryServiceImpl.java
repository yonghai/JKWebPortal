package jk.o1office.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.GoodsCategoryDao;
import jk.o1office.dao.VersionDao;
import jk.o1office.domin.GoodsCategory;
import jk.o1office.domin.Shops;
import jk.o1office.service.GoodsCategoryService;
import jk.o1office.service.ShopsService;
import jk.o1office.utils.Distance;
import jk.o1office.utils.JsonHandler;

public class GoodsCategoryServiceImpl implements GoodsCategoryService {
	private GoodsCategoryDao goodsCategoryDao;
	private VersionDao versionDao;
	private ShopsService shopsService;
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
	}
	public VersionDao getVersionDao() {
		return versionDao;
	}
	public void setVersionDao(VersionDao versionDao) {
		this.versionDao = versionDao;
	}
	public GoodsCategoryDao getGoodsCategoryDao() {
		return goodsCategoryDao;
	}
	public void setGoodsCategoryDao(GoodsCategoryDao goodsCategoryDao) {
		this.goodsCategoryDao = goodsCategoryDao;
	}
	
	public String getGoodsCategories(int id, String token) throws Exception {
		List<GoodsCategory> goodsCategories = goodsCategoryDao.getGoodsCategories(id);
		return JsonHandler.MapToJson(getMap(true,"商品分类",versionDao.getVersion("category_ver", "customer"),token,JsonHandler.ObjectToJSONArray(goodsCategories, new String[]{"version"})));
	}
	
	public List<GoodsCategory> getGoodsCategories(int id) throws Exception {
		List<GoodsCategory> goodsCategories = goodsCategoryDao.getGoodsCategories(id);
		return goodsCategories;
	}
	
	private Map getMap(boolean isscuss,String emsg,String version,String token,List<GoodsCategory> goodsCategories){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("version", version);
		map.put("token", token);
		map.put("data", goodsCategories);
		return map;
	}
	
	/**
	 * 1.获取商家的经纬度
	 * 2.根据经纬度获取最近的商家
	 * 3.获取父分类下的所有子分类
	 * 3.获取该商家的商品分类
	 */
	@SuppressWarnings("unchecked")
	public String getGoodsCategories(int pid, double longitude,
			double latitude, String token) throws Exception{
		//获取所有的商家信息
		List<Shops> shopss = shopsService.getShops();
		//没有商家时返回提示信息
		if(shopss.size()==0)
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有商家\"}";
		//根据经纬度获取最近的商家
		Shops s = getMinDistanceShops(shopss, longitude, latitude);
		//如果没有最近的商家，抛出异常
		if(null==s)
			throw new Exception();
		//根据一级分类id获取该一级分类的所有二级分类
		List<GoodsCategory> goodsCategories = goodsCategoryDao.getGoodsCategories(pid);
		//根据最近的商家id，来获取该商家的所有商品的二级分类的id
		List<Integer> ids = shopsService.getPCID(s.getId());
		//如果一级分类下没有二级分类，或根据商家id查询的二级分类没有，则返回提示信息
		if(goodsCategories.size()==0 || ids.size()==0)
			return "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"没有分类\"}";
		//获取1级分类的存在于最近商家的所有二级分类信息
		List<GoodsCategory> goodsCategories2 = getShopsGoodsCategory(goodsCategories,ids);
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "商品分类");
		map.put("version", versionDao.getVersion("category_ver", "customer"));
		map.put("token", token);
		map.put("shopsid", s.getId());
		map.put("data", JsonHandler.ObjectToJSONArray(goodsCategories, new String[]{"version"}));
		return JsonHandler.MapToJson(map);
	}
	
	/**
	 * 把该商家的分类(属于一级分类的子分类)拿出来
	 * @param goodsCategories
	 * @param ids
	 * @return
	 */
	private List<GoodsCategory> getShopsGoodsCategory(List<GoodsCategory> goodsCategories,List<Integer> ids){
		List<GoodsCategory> goodsCategories2 = new ArrayList<GoodsCategory>();
		for(int id : ids){
			for(GoodsCategory gc : goodsCategories){
				if(id==gc.getId()){
					goodsCategories2.add(gc);
				}
			}
		}
		return goodsCategories2;
	}
	
	/**
	 * 根据经维度获取最近的商家
	 * @param ss
	 * @param longitude
	 * @param latitude
	 * @return
	 */
	private Shops getMinDistanceShops(List<Shops> ss, double longitude, double latitude){
		if(ss.size()==0)
			return null;
		double d1 = 0;		/*里商家最近的距离(m)*/
		int n = 0;			/*第几个商家*/
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
}
