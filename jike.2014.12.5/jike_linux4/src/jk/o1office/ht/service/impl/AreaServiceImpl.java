package jk.o1office.ht.service.impl;

import java.util.List;

import jk.o1office.ht.dao.AreaDao;
import jk.o1office.ht.domin.Area;
import jk.o1office.ht.service.AreaService;
import jk.o1office.ht.utils.JSONHandler;

public class AreaServiceImpl implements AreaService {
	private AreaDao areaDao;
	public AreaDao getAreaDao() {
		return areaDao;
	}
	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}
	/**
	 * 后台添加区域地址，包括省、市。区域
	 * 要按顺序添加
	 */
	public String addArea(List<Area> areas) throws Exception {
		int id = 0;
		for(Area a : areas){
			if(a.getPid()==0){
				a.setPid(id);
			}
			id = areaDao.isHasArea(a);
			if(id==0)
				id = areaDao.saveAera(a);
		}
		return "保存成功";
	}
	
	public String getArea() {
		List<Area> areas = areaDao.getArea();
		return JSONHandler.ArrayToJson(areas,new String[]{"longitude","latitude","createtime","description"});
	}
	public String getArea(int id) {
		List<Area> areas = areaDao.getArea(id);
		return JSONHandler.ArrayToJson(areas,new String[]{"longitude","latitude","createtime","description"});
	}
	
	public String editArea(int areaid, String areaname) throws Exception{
		areaDao.editArea(areaid, areaname);
		return "修改成功";
	}
	public String delArea(int id,String jibie) throws Exception {
		areaDao.delArea(id,jibie);
		return "删除成功";
	}
}
