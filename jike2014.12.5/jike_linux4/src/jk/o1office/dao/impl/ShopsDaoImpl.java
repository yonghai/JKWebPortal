package jk.o1office.dao.impl;

import java.util.List;

import jk.o1office.dao.ShopsDao;
import jk.o1office.domin.Shops;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class ShopsDaoImpl implements ShopsDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@SuppressWarnings("unchecked")
	public List<Shops> getShops(int areaid) {
		return hibernateTemplate.find("from Shops s where s.areaid='"+areaid+"'");
	}
	
	@SuppressWarnings("unchecked")
	public List<Shops> getShops() {
		return hibernateTemplate.find("from Shops");
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> getPCID(int shopsid) {
		return hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select pcid from shops_p where shopsid="+shopsid)
		.list();
	}
	
	/**
	 * 所有指定商家的所有商品id
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> getPID(int shopsid) {
		return hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select productid from shops_p where shopsid="+shopsid)
		.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> getPCID(int shopsid, int categoryId) {
		return hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select productid from shops_p where shopsid="+shopsid+" and pcid="+categoryId)
		.list();
	}
	
	public int getAreaID(int shopsid) {
		List<Shops> shops = hibernateTemplate.find("from Shops s where s.id="+shopsid);
		if(shops.size()>0){
			return shops.get(0).getAreaid();
		}
		return 0;
	}

	public List<Integer> getShopsIDs(int areaid) {
		return hibernateTemplate.find("select s.id from Shops s where s.areaid="+areaid);
	}
}
