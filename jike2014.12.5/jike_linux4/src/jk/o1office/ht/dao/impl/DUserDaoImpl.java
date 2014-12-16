package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.DeliveryUser;
import jk.o1office.ht.domin.User;

public  class DUserDaoImpl implements UserDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public int count() {
		return ((Long)hibernateTemplate.iterate("select count(*) from DeliveryUser")
				.next()).intValue();
	}

	public int count(String name) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
			//	.openSession()
				.getCurrentSession()
				.createQuery("select count(*) from DeliveryUser du where du.username like '%"+name+"%'")
				.uniqueResult()).intValue();
		return count;
	}

	public void delUser(int id) {
		DeliveryUser duser = new DeliveryUser();
		duser.setId(id);
		hibernateTemplate.delete(duser);
	}

	public boolean login(User user) {
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from DeliveryUser")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows, final String name) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from DeliveryUser du where du.username like '%"+name+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}

	public boolean updateUser(User user) {
		hibernateTemplate.update(user);
		return true;
	}
	
	public User getUserInfo(int id) {
		return (User) hibernateTemplate.find("from DeliveryUser du where du.id="+id).get(0);
	}
	public int count(int type) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<User> queryUser(int offset, int rows, int type) {
		// TODO Auto-generated method stub
		return null;
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
		int count = ((Long)hibernateTemplate.iterate("select count(*) from DeliveryUser").next()).intValue();
		return new int[]{count};
	}

}
