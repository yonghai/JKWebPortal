package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSON;

import jk.o1office.dao.AreaDao;
import jk.o1office.dao.VersionDao;
import jk.o1office.domin.Area;
import jk.o1office.domin.Community;
import jk.o1office.service.AreaService;
import jk.o1office.utils.JsonHandler;

public class AreaServiceImpl implements AreaService {
	private AreaDao areaDao;
	public VersionDao getVersionDao() {
		return versionDao;
	}
	public void setVersionDao(VersionDao versionDao) {
		this.versionDao = versionDao;
	}
	private VersionDao versionDao;
	public AreaDao getAreaDao() {
		return areaDao;
	}
	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}
	
	/**
	 * 获取地区列表
	 */
	public String getAreaList(String token) throws Exception {
		List areas = areaDao.getAreas();
		return JsonHandler.MapToJson(getMap(true, "地区列表",versionDao.getVersion("area_ver", "customer"), token, 
				JsonHandler.ObjectToJSONArray(areas, new String[]{"createtime"})));
	}
	
	private Map getMap(boolean isscuss,String emsg,String version,String token,List data){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("version", version);
		map.put("data", data);
		return map;
	}
	
	private Map getMap(boolean isscuss,String emsg,String token,Object data){
		Map map = new HashMap();
		map.put("success", isscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		return map;
	}
	
	/**
	 * 获取小区列表
	 */
	public String getCommunity(int areaid, String token) throws Exception {
		List<Community> list = areaDao.getCommunities(areaid);
		return JsonHandler.MapToJson(getMap(true, "小区列表", token, 
				JsonHandler.ObjectToJSONArray(list, new String[]{"createtime"})));
	}
	
	public String getArea(int pid,String token) {
		List<Area> areas = areaDao.getArea(pid);
		return JsonHandler.MapToJson(getMap(true, "区域信息", token, 
				JsonHandler.ObjectToJSONArray(areas, new String[]{"createtime","longitude","latitude","description"})));
	}
}
