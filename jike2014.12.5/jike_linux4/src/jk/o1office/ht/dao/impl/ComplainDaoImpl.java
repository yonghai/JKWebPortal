package jk.o1office.ht.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.ComplainDao;
import jk.o1office.ht.domin.Complain;

public class ComplainDaoImpl implements ComplainDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public List<Complain> getComplain() {
		return hibernateTemplate.find("from Complain");
	}
}
