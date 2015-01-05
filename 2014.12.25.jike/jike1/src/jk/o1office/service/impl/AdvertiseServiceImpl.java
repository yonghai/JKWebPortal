package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.AdvertiseDao;
import jk.o1office.domin.AdDetail;
import jk.o1office.domin.Advertise;
import jk.o1office.service.AdvertiseService;
import jk.o1office.utils.JsonHandler;


public class AdvertiseServiceImpl implements AdvertiseService{
	private AdvertiseDao advertiseDao;
	public AdvertiseDao getAdvertiseDao() {
		return advertiseDao;
	}
	public void setAdvertiseDao(AdvertiseDao advertiseDao) {
		this.advertiseDao = advertiseDao;
	}
	
	/**
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String getAdvers(int isshow,String token) throws Exception{
		if(isshow>4 || isshow<1)
			throw new Exception();
		Object o = advertiseDao.getAdvers(isshow);
		//首页的促销一定有，如果没有，则加载失败
		if(null==o)
			throw new Exception();
		Object[] data =(Object[])o;
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "广告信息");
		map.put("token", token);
		if(data[1].toString().equals("list")){
			map.put("data", JsonHandler.ObjectToJSONArray(data[0], 
					new String[]{
					"ordernum","tradenum","createtime","version",
					"product_version","protechnics","pvalume","pweight",
					"qualitylevel","storerange","dosing","pbzq"}));
			map.put("type", "list");
		}else if(data[1].toString().equals("web")){
			if(((AdDetail)data[0]).getWebaddr().equals("")){
				map.put("data", "");
			}else
				map.put("data", JsonHandler.ObjectToJSONArray(data[0], new String[]{"goodsid"}));
			map.put("type", "web");
		}else{
			map.put("data", data[0]);
			map.put("type", "details");
		}
		return JsonHandler.MapToJson(map);
	}
	
	/*
	 * 添加促销价格
	 */
	@SuppressWarnings("unchecked")
	public String getAdvers1(int isshow,String token) throws Exception{
		//如果参数错误，抛出异常
		if(isshow>4 || isshow<1)
			throw new Exception();
		//获取促销的详细信息
		Object o = advertiseDao.getAdvers1(isshow);
		//首页的促销一定有，如果没有，则加载失败
		if(null==o)
			throw new Exception();
		Object[] data =(Object[])o;
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "广告信息");
		map.put("token", token);
		map.put("title", data[2]);
		if(data[1].toString().equals("list")){
			map.put("data", JsonHandler.ObjectToJSONArray(data[0], new String[]{"product_description"}));
			map.put("type", "list");
		}else if(data[1].toString().equals("web")){
			if(((AdDetail)data[0]).getWebaddr().equals("")){
				map.put("data", "");
			}else
				map.put("data", JsonHandler.ObjectToJSONArray(data[0], new String[]{"goodsid"}));
			map.put("type", "web");
		}else{
			map.put("data", data[0]);
			map.put("type", "details");
		}
		return JsonHandler.MapToJson(map);
	}
	
	public List<Advertise> getAllAdImg() throws Exception{
		return advertiseDao.getAllAdImg();
	}
}
