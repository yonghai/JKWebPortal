package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.CommonUser;
import jk.o1office.ht.domin.User;

public class CUserDaoImpl implements UserDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public int count() {
		return ((Long)hibernateTemplate.iterate("select count(*) from CommonUser").next()).intValue();
	}
	
	@Deprecated
	public boolean login(User user) {
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from CommonUser")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public void delUser(int id) {
		CommonUser user = new CommonUser();
		user.setId(id);
		hibernateTemplate.delete(user);
	}
	
	public boolean updateUser(User user) {
		hibernateTemplate.update(user);
		return true;
	}
	
	public int count(String name) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
			//	.openSession()
				.getCurrentSession()
				.createQuery("select count(*) from CommonUser cu where cu.username like '%"+name+"%'")
				.uniqueResult()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows, final String name) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from CommonUser cu where cu.username like '%"+name+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	public User getUserInfo(int id) {
		return null;
	}
	public List<User> queryUser(int offset, int rows, int type) {
		return null;
	}
	public int count(int type) {
		return 0;
	}
	public int count(int type, String name) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<User> queryUser(int offset, int rows, int type, String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int[] getOrderCount() {
		int count =  ((Long)hibernateTemplate.iterate("select count(*) from CommonUser").next()).intValue();
		return new int[]{count};
	}

}
