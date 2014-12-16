package jk.o1office.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.AreaDao;
import jk.o1office.domin.Area;
import jk.o1office.domin.Community;

public class AreaDaoImpl implements AreaDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/**
	 * 从数据库中读取地区信息
	 */
	@SuppressWarnings("unchecked")
	public List<Area> getAreas() {
		List<Area> areas = hibernateTemplate.find("from Area");
		return areas;
	}
	
	/**
	 * 根据地区id从数据库中读取小区列表
	 */
	@SuppressWarnings("unchecked")
	public List<Community> getCommunities(int areaid) {
		return hibernateTemplate.find("from Community c where c.areaid="+areaid);
	}
	
	@SuppressWarnings("unchecked")
	public List<Area> getArea(int pid) {
		List<Area> areas = hibernateTemplate.find("from Area a where a.pid="+pid);
		return areas;
	}
}
