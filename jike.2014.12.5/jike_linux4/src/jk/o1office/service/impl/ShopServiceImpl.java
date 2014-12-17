package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.ShopDao;
import jk.o1office.domin.Shop;
import jk.o1office.service.ShopService;
import jk.o1office.utils.JsonHandler;

public class ShopServiceImpl implements ShopService {
	private ShopDao shopDao;
	public ShopDao getShopDao() {
		return shopDao;
	}
	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}
	
	public String getShopListByArea(int areaid, String token) throws Exception{
		List<Shop> shops = shopDao.getShopByArea(areaid);
		return JsonHandler.MapToJson(getMap(true,"商店列表",token,shops));
	}
	
	private Map getMap(boolean isscuss,String emsg,String token,Object data){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		return map;
	}
	
	
}
