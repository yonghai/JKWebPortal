package jk.o1office.ht.dao.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.LogDao;
import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.domin.URLInfo;

public class LogDaoImpl implements LogDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void saveLog(LoginInfo loginInfo) {
		hibernateTemplate.save(loginInfo);
		for(URLInfo ui : loginInfo.getUrlsinfo()){
			ui.setAdminlogid(loginInfo.getId());
			hibernateTemplate.save(ui);
		}
	}
}
