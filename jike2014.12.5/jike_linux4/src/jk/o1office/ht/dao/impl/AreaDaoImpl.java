package jk.o1office.ht.dao.impl;
import java.util.List;

import jk.o1office.ht.dao.AreaDao;
import jk.o1office.ht.domin.Area;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class AreaDaoImpl implements AreaDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public int saveAera(Area a) {
		int id = (Integer)hibernateTemplate.save(a);
		return id;
	}
	
	public List<Area> getArea() {
		return hibernateTemplate.find("select new jk.o1office.ht.domin.Area(id,name,pid) from Area");
	}
	
	public List<Area> getArea(int id) {
		return hibernateTemplate.find("select new jk.o1office.ht.domin.Area(id,name,pid) from Area a where a.pid="+id);
	}
	
	public void editArea(int areaid, String areaname) {
		hibernateTemplate.bulkUpdate("update Area a set a.name='"+areaname+"' where a.id="+areaid);
	}
	
	public void delArea(int id, String jibie) {
		String sql = "";
		if(jibie.equals("1")){
			sql = "delete from Area a where a.id="+id;
			hibernateTemplate.bulkUpdate(sql);
			sql = "select a.id from Area a where a.pid="+id;
			List<Integer> ids = hibernateTemplate.find(sql);
			sql = "delete from Area a where a.pid="+id;
			hibernateTemplate.bulkUpdate(sql);
			sql = "delete from Area a where a.pid in (";
			if(ids.size()>0){
				for(Integer id1 : ids){
					sql += id1+",";
				}
				sql = sql.substring(0, sql.lastIndexOf(","));
				sql += ")";
				hibernateTemplate.bulkUpdate(sql);
			}
		}else if(jibie.equals("2")){
			sql = "delete from Area a where a.id="+id;
			hibernateTemplate.bulkUpdate(sql);
			sql = "delete from Area a where a.pid="+id;
			hibernateTemplate.bulkUpdate(sql);
		}else if(jibie.equals("3")){
			sql = "delete from Area a where a.id="+id;
			hibernateTemplate.bulkUpdate(sql);
		}
	}
	public int isHasArea(Area a) {
		List<Area> areas = hibernateTemplate.find("from Area a where a.name='"+a.getName()+"'");
		if(areas.size()>0){
			return areas.get(0).getId();
		}
		return 0;
	}
	
}
