package jk.o1office.ht.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.ShopsDao;
import jk.o1office.ht.domin.Shops;
import jk.o1office.ht.service.ShopsService;
import jk.o1office.ht.utils.JSONHandler;

public class ShopsServiceImpl implements ShopsService {
	private ShopsDao shopsDao;
	public ShopsDao getShopsDao() {
		return shopsDao;
	}
	public void setShopsDao(ShopsDao shopsDao) {
		this.shopsDao = shopsDao;
	}
	public String addShops(Shops shops) throws Exception{
		String s = shopsDao.saveShops(shops);
		if(s.equals("no")){
		//	FileUtil.reNameTo(shops.getShopimg(), shops.getShopname());
			return "添加商家成功";
		}else
			return "该商家名已被添加";
	}
	
	public String getShops(int offset, int rows) throws Exception {
		List<Shops> shops = shopsDao.getShops(offset,rows);
		int total = shopsDao.getCount();
		Map map = new HashMap();
		map.put("rows", shops);
		map.put("total", total);
		return JSONHandler.MapToJson(map);
	}
	
	public String delShops(int id,String name) throws Exception {
		shopsDao.deleteShops(id);
		return "删除成功";
	}
	
	public String getShops(int offset, int rows, String shopname) {
		List<Shops> shops = shopsDao.getShops(offset,rows,shopname);
		int total = shopsDao.getCount(shopname);
		Map map = new HashMap();
		map.put("rows", shops);
		map.put("total", total);
		return JSONHandler.MapToJson(map);
	}
	public String editShops(Shops shops) {
		shopsDao.editShops(shops);
		return "编辑成功";
	}
	
	public List<String> getShopsImgNames() {
		List<String> shopsimgs = shopsDao.getShopsImgs();
		List<String> shopsImgNames = new ArrayList<String>();
		for(String shopsimg : shopsimgs){
			shopsImgNames.add(shopsimg.substring(shopsimg.lastIndexOf("/")));
		}
		return shopsImgNames;
	}
}
