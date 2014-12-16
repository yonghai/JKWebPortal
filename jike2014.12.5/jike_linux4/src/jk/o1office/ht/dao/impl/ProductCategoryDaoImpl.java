package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.ProductCategoryDao;
import jk.o1office.ht.domin.ProductCategory;

public class ProductCategoryDaoImpl implements ProductCategoryDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void save(ProductCategory pc) {
		hibernateTemplate.save(pc);
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductCategory> getType(final int id, final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<ProductCategory>>() {
			public List<ProductCategory> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from ProductCategory pc where pc.pid="+id)
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public boolean isHas(String categoryname) {
		List list = hibernateTemplate.find("from ProductCategory pc where pc.categoryname='"+categoryname+"'");
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public void editTypeName(int id, String name) {
	//	ProductCategory pc = hibernateTemplate.get(ProductCategory.class, id);
	//	pc.setCategoryname(name);
	//	hibernateTemplate.save(pc);
		hibernateTemplate.bulkUpdate("update ProductCategory pc set pc.categoryname='"+name+"' where pc.id="+id);
	}
	public int getCount(int type) {
		return ((Long)hibernateTemplate.iterate("select count(*) from ProductCategory pc where pc.pid="+type).next()).intValue();
	}

	public void delType(int id, int pid) {
		String hql = "";
		if(pid==-1){
			hql = "delete from ProductCategory pc where pc.pid="+id;
			hibernateTemplate.bulkUpdate(hql);
			hql = "delete from ProductCategory pc where pc.id="+id;
			hibernateTemplate.bulkUpdate(hql);
		}else{
			hql = "delete from ProductCategory pc where pc.id="+id;
			hibernateTemplate.bulkUpdate(hql);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductCategory> getType(int type) {
		if(type==0){
			return hibernateTemplate.find("from ProductCategory");
		}
		return hibernateTemplate.find("from ProductCategory pc where pc.pid="+type);
	}
	
	public void editType(ProductCategory type) {
		ProductCategory pc = hibernateTemplate.load(ProductCategory.class, type.getId());
		pc.setDescript(type.getDescript());
		hibernateTemplate.update(pc);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getTypeImgs(){
		return hibernateTemplate.find("select pc.categoryimg from ProductCategory pc");
	}
	
	public int getGoodsCount() {
		return ((Long)hibernateTemplate.iterate("select count(*) from ProductCategory pc where pc.pid!=-1").next()).intValue();
	}
	
	public List<ProductCategory> getTwoTypes() {
		return hibernateTemplate.find("from ProductCategory pc where pc.pid!=-1");
	}
}
