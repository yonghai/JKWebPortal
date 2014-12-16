package jk.o1office.dao.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.ComplainDao;
import jk.o1office.domin.Complain;

public class ComplainDaoImpl implements ComplainDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public boolean save(Complain complain) {
		boolean flag = false;
		try{
			hibernateTemplate.save(complain);
			flag = true;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
}
