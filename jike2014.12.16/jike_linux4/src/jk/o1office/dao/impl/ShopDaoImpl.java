package jk.o1office.dao.impl;

import java.util.List;

import javax.ejb.FinderException;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.ShopDao;
import jk.o1office.domin.Shop;

public class ShopDaoImpl implements ShopDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<Shop> getShopByArea(int areaid) {
		return hibernateTemplate.find("from Shop s where s.areaid="+areaid);
	}
}
