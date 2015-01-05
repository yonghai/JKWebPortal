package jk.o1office.ht.service;

import java.util.List;

import jk.o1office.ht.domin.Area;

public interface AreaService {

	String addArea(List<Area> areas) throws Exception;

	/**
	 * 获取所有的区域并返回
	 * @return
	 */
	String getArea() throws Exception;

	/**
	 * 通过id查询区域
	 * @param parseInt
	 * @return
	 */
	String getArea(int id) throws Exception;

	/**
	 * 
	 * 修改区域名称
	 * @param areaid
	 * @param areaname
	 * @return
	 * @throws Exception 
	 */
	String editArea(int areaid, String areaname) throws Exception;

	/**
	 * 删除指定的区域
	 * 如果是最上层区域，则删除下级所有区域
	 * @param id
	 * @return
	 */
	String delArea(int id,String jibie) throws Exception;

}
