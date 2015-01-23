
package jk.o1office.dao.impl;

import java.sql.SQLException;
import java.util.List;

import jk.o1office.dao.KeyDao;
import jk.o1office.domin.Key;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class KeyDaoImpl implements KeyDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void saveOrUpdate(String keyword, int userid) {
		Key k = isHasKey(keyword,userid);
		if(null != k){
			k.setCount(k.getCount()+1);
			update(k);
		}else{
			Key key = new Key();
			key.setContent(keyword);
			key.setUserid(userid);
			key.setCount(1);
			save(key);
		}
	}
	
	public void save(Key key){
		hibernateTemplate.save(key);
	}
	
	public void update(Key key){
		hibernateTemplate.update(key);
	}
	
	@SuppressWarnings("unchecked")
	public Key isHasKey(String keyword,int userid ){
		List<Key> list = hibernateTemplate.find("from Key k where k.content='"+keyword+"' and k.userid="+userid);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getKeyList(final int userID) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<String>>() {
			public List<String> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createSQLQuery("select k.keyword from searchkeys k where k.userid="+userID+" order by k.count desc")
				.setFirstResult(0)
				.setMaxResults(15)
				.list();
			}
		});
		//	return hibernateTemplate.find("select k.content from Key k where k.userid="+userID+" order by k.count limit 0,10");
	}
}
