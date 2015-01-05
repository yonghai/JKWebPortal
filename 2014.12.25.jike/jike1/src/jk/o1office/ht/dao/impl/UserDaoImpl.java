package jk.o1office.ht.dao.impl;
import java.sql.SQLException;
import java.util.List;

import jk.o1office.ht.dao.UserDao;
import jk.o1office.ht.domin.AdminUser;
import jk.o1office.ht.domin.User;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class UserDaoImpl implements UserDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public boolean login(User user) {
		AdminUser admin = (AdminUser)user;
		List<AdminUser> aus = hibernateTemplate.find("from AdminUser au where au.username='"+admin.getUsername()+"' and au.password='"+admin.getPassword()+"' and au.type="+admin.getType());
		if(aus.size()==0)
			return false;
		else
			return true;
	}
	
	@Deprecated
	public int count() {
		return 0;
	}
	@Deprecated
	public List<User> queryUser(int offset, int rows) {
		return null;
	}
	
	public void delUser(int id) {
		AdminUser au = new AdminUser();
		au.setId(id);
		hibernateTemplate.delete(au);
	}
	
	public boolean updateUser(User user) {
		hibernateTemplate.update(user);
		return true;
	}
	public int count(String name) {
		return 0;
	}
	public List<User> queryUser(int offset, int rows, String name) {
		return null;
	}
	public User getUserInfo(int id) {
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows, final int type) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from AdminUser au where au.type="+type)
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public int count(int type) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createQuery("select count(*) from AdminUser au where au.type="+type)
				.uniqueResult()).intValue();
		return count;
	}
	
	public int count(int type, String name) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createQuery("select count(*) from AdminUser au where au.type="+type+" and au.username like '%"+name+"%'")
				.uniqueResult()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryUser(final int offset, final int rows, final int type, final String name) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<User>>() {
			public List<User> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from AdminUser au where au.type="+type+" and au.username like '%"+name+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	public int[] getOrderCount() {
		List list = hibernateTemplate.find("select au.type,count(*) from AdminUser au group by au.type");
		int[] ints = new int[3];
		for(Object obj : list){
			Object[] objs = (Object[])obj;
			if(objs[0].toString().equals("0")){
				ints[0] = ((Long)objs[1]).intValue();
			}else if(objs[0].toString().equals("1")){
				ints[1] = ((Long)objs[1]).intValue();
			}else if(objs[0].toString().equals("2")){
				ints[2] = ((Long)objs[1]).intValue();
			}
		}
		return ints;
	}
}
