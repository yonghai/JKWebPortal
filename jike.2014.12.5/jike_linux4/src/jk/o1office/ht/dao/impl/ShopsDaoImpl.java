package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.ShopsDao;
import jk.o1office.ht.domin.Shops;

public class ShopsDaoImpl implements ShopsDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public String saveShops(Shops shops) {
		List list = hibernateTemplate.find("from Shops s where s.shopname='"+shops.getShopname()+"'");
		if(list.size()>0){
			return "yes";
		}else{
			hibernateTemplate.save(shops);
			return "no";
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Shops> getShops(final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Shops>>() {
			public List<Shops> doInHibernate(Session session)
					throws HibernateException, SQLException {
				//select new jk.o1office.ht.domin.Shops(id,shopname) 
				return session.createQuery("from Shops")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	public int getCount() {
		return ((Long)hibernateTemplate.iterate("select count(*) from Shops").next()).intValue();
	}
	
	public void deleteShops(int id) {
		hibernateTemplate.bulkUpdate("delete from Shops s where s.id="+id);
	}
	
	public int getCount(String shopname) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createQuery("select count(*) from Shops s where s.shopname like '%"+shopname+"%'")
				.uniqueResult()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Shops> getShops(final int offset, final int rows, final String shopname) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Shops>>() {
			public List<Shops> doInHibernate(Session session)
					throws HibernateException, SQLException {
				//select new jk.o1office.ht.domin.Shops(id,shopname) 
				return session.createQuery("from Shops s where s.shopname like '%"+shopname+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public void editShops(Shops shops) {
		Shops shops1 = hibernateTemplate.load(Shops.class, shops.getId());
		shops1 = shops;
		hibernateTemplate.update(shops1);
	}
	
	public List<String> getShopsImgs() {
		return hibernateTemplate.find("select s.shopimg from Shops s");
	}
}
