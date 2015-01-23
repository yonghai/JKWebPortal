package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.domin.Advertise;
import jk.o1office.domin.RotationImage;
import jk.o1office.domin.VersionInfo;
import jk.o1office.service.AdvertiseService;
import jk.o1office.service.GoodsCategoryService;
import jk.o1office.service.InitService;
import jk.o1office.service.VersionService;
import jk.o1office.utils.JsonHandler;

public class InitServiceImpl implements InitService{
	private VersionService versionService;
	private AdvertiseService advertiseService;
	private GoodsCategoryService goodsCategoryService;
	public VersionService getVersionService() {
		return versionService;
	}
	public void setVersionService(VersionService versionService) {
		this.versionService = versionService;
	}
	public AdvertiseService getAdvertiseService() {
		return advertiseService;
	}
	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}
	public GoodsCategoryService getGoodsCategoryService() {
		return goodsCategoryService;
	}
	public void setGoodsCategoryService(GoodsCategoryService goodsCategoryService) {
		this.goodsCategoryService = goodsCategoryService;
	}
	
	/**
	 * 客户端打开时初始化操作
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String init(String token) throws Exception {
		Map map = new HashMap();
	//	map.put("version",JsonHandler.ObjectToJson(versionService.getVersion("customer"), new String[]{"id","role","changetime"}));
		System.out.println("版本信息："+versionService.getVersion("customer").getIpstart());
		VersionInfo vi = versionService.getVersion("customer");
		if(vi!=null)
			map.put("version",vi);
		else
			map.put("version", "");
		List<Advertise> advertises = advertiseService.getAllAdImg(vi.getStyle());
		if(advertises.size()>0){
			map.put("imagepath",advertises);
		}
		else{
			map.put("imagepath","");
		}
		map.put("category",JsonHandler.ObjectToJSONArray(goodsCategoryService.getGoodsCategories(-1), new String[]{"version"}));
		List<RotationImage> images = versionService.getRotationImage();
		map.put("rotationimg", images);
		
		Map map1 = new HashMap();
		map1.put("success", "true");
		map1.put("emsg", "初始化信息");
		map1.put("data", map);
		map1.put("token", token);
		return JsonHandler.MapToJson1(map1);
	}
	
	@SuppressWarnings("unchecked")
	public String oldinit(String token) throws Exception {
		Map map = new HashMap();
	//	map.put("version",JsonHandler.ObjectToJson(versionService.getVersion("customer"), new String[]{"id","role","changetime"}));
		System.out.println("版本信息："+versionService.getVersion("customer").getIpstart());
		VersionInfo vi = versionService.getVersion("customer");
		if(vi!=null)
			map.put("version",vi);
		else
			map.put("version", "");
		List<Advertise> advertises = advertiseService.getAllAdImg();
		if(advertises.size()>0){
			map.put("imagepath",advertises);
		}
		else{
			map.put("imagepath","");
		}
		map.put("category",JsonHandler.ObjectToJSONArray(goodsCategoryService.getGoodsCategories(-1), new String[]{"version"}));
		Map map1 = new HashMap();
		map1.put("success", "true");
		map1.put("emsg", "初始化信息");
		map1.put("data", map);
		map1.put("token", token);
		return JsonHandler.MapToJson1(map1);
	}
}

