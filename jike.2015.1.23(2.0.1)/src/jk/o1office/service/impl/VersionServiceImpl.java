package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.VersionDao;
import jk.o1office.domin.RotationImage;
import jk.o1office.domin.VersionInfo;
import jk.o1office.service.VersionService;
import jk.o1office.utils.JsonHandler;

public class VersionServiceImpl implements VersionService {
	private VersionDao versionDao;
	public VersionDao getVersionDao() {
		return versionDao;
	}
	public void setVersionDao(VersionDao versionDao) {
		this.versionDao = versionDao;
	}
	
	public String getVersionInfo(String role,String token) throws Exception{
		//return JsonHandler.ObjectToJson(versionDao.getVersionInfo(role),new String[]{"id","changetime"});
		return JsonHandler.MapToJson(getMap(true, token,"版本信息", 
				JsonHandler.ObjectToJSONArray(versionDao.getVersionInfo(role),new String[]{"id","role","changetime"})));
	}
	
	public VersionInfo getVersion(String role) throws Exception{
		return versionDao.getVersionInfo(role);
	}

	private Map getMap(boolean issucss,String token,String emsg,Object o){
		Map map = new HashMap();
		map.put("success", issucss);
		map.put("token", token);
		map.put("emsg", emsg);
		map.put("data", o);
		return map;
	}
	
	//lowprice,deliveryprice,deliveryrange
	public String[] getPrices(String role) {
		return versionDao.getPrices(role);
	}
	
	public String[] getDeliveryTime() throws Exception {
		return versionDao.getDeliveryTime();
	}
	
	public List<RotationImage> getRotationImage() throws Exception {
		return versionDao.getRotationImage();
	}

}
