package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.ShopsDao;
import jk.o1office.domin.Shops;
import jk.o1office.service.ShopsService;
import jk.o1office.utils.JsonHandler;

public class ShopsServiceImpl implements ShopsService{
	private ShopsDao shopsDao;
	public ShopsDao getShopsDao() {
		return shopsDao;
	}
	public void setShopsDao(ShopsDao shopsDao) {
		this.shopsDao = shopsDao;
	}

	@SuppressWarnings("unchecked")
	public String getShops(int areaid, String token) throws Exception {
		List<Shops> shops = shopsDao.getShops(areaid);
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "商家信息");
		map.put("token", token);
		map.put("data", JsonHandler.ObjectToJSONArray(shops, 
				new String[]{"bossname","bosstel",
				"createtime","shopaddr","shopimg","shoptel"}));
		return JsonHandler.MapToJson(map);
	}
	
	public List<Shops> getShops() throws Exception {
		return shopsDao.getShops();
	}
	
	public List<Integer> getPCID(int shopsid) {
		return shopsDao.getPCID(shopsid);
	}
	
	public List<Integer> getPID(int shopsid) {
		return shopsDao.getPID(shopsid);
	}
	
	public List<Integer> getPID(int shopsid, int categoryId) {
		return shopsDao.getPCID(shopsid,categoryId);
	}
	public int getAreaID(int shopsid) {
		return shopsDao.getAreaID(shopsid);
	}

	public List<Integer> getShopsIDs(int areaid) {
		return shopsDao.getShopsIDs(areaid);
	}
}
