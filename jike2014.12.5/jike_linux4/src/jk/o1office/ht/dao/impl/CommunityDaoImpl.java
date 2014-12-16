package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.CommunityDao;
import jk.o1office.ht.domin.Community;

public class CommunityDaoImpl implements CommunityDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void saveCommunity(Community community) {
		hibernateTemplate.save(community);
	}
	
	@SuppressWarnings("unchecked")
	public List<Community> getCommunity(final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Community>>() {
			public List<Community> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Community")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public int getCount() {
		int count = ((Long)hibernateTemplate.iterate("select count(*) from Community").next()).intValue();
		return count;
	}
	
	public void editCommunity(int cid, String cname) {
		hibernateTemplate.bulkUpdate("update Community c set c.name='"+cname+"' where c.id="+cid);
	}
	
	public void delCommunity(int cid) {
		hibernateTemplate.bulkUpdate("delete from Community c where c.id="+cid);
	}
	
	@SuppressWarnings("unchecked")
	public List<Community> getCommunity(final int offset, final int rows, final String keyword) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Community>>() {
			public List<Community> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Community c where c.name like '%"+keyword+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public int getCount(String keyword) {
		System.out.println("count");
		int count = ((Long)hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createQuery("select count(*) from Community c where c.name like '%"+keyword+"%'")
		.uniqueResult()).intValue();
		return count;
	}
	
	public boolean isHasCommunity(String name) {
		List list = hibernateTemplate.find("select c.name from Community c where c.name='"+name+"'");
		if(list.size()>0)
			return true;
		return false;
	}
}
