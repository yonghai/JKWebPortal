package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.Area;

public interface AreaDao {

	/**
	 * 保存地区，保存成功时返回该地区的id
	 * @param a
	 * @return
	 */
	int saveAera(Area a);

	List<Area> getArea();

	/**
	 * 根据id查询区域
	 * @param id
	 * @return
	 */
	List<Area> getArea(int id);

	/**
	 * 修改区域名称
	 * @param areaid
	 * @param areaname
	 */
	void editArea(int areaid, String areaname);

	/**
	 * 删除指定id的区域,并删除其下级的区域
	 * @param id
	 */
	void delArea(int id,String jibie);
	
	/**
	 * 判断是否有该区域
	 * @param a
	 * @return
	 */
	int isHasArea(Area a);

}
