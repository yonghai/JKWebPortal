package jk.o1office.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.UserDao;
import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.DeliveryUser;

public class DeliveryUserDaoImpl implements UserDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public Object getUserByName(String tel) {
		List list = hibernateTemplate.find("from DeliveryUser du where du.telphone='"+tel+"'");
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}

	/**
	 * 没有该用户返回0
	 * 密码错误返回-1
	 * 正确返回用户id
	 */
	@SuppressWarnings("unchecked")
	public int isHasUser(String tel, String password) {
		List<DeliveryUser> list = hibernateTemplate.find("from DeliveryUser du where du.telphone='"+tel+"'");
		if(list.size()>0){
			DeliveryUser deliveryUser = list.get(0);
			if(deliveryUser.getPassword().equals(password))
				return deliveryUser.getId();
			return -1;
		}
		return 0;
	}

	public boolean save(Object o)throws DataAccessException {
		boolean flag = false;
		try{
			hibernateTemplate.save(o);
			flag = true;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updateNickName(String nickName, int userid) {
		return false;
	}

	public boolean updatePhoneNum(Object o, String newphonenum) {
		boolean flag = false;
		DeliveryUser cuser = null;
		if(o instanceof DeliveryUser){
			cuser = (DeliveryUser)o;
		}else{
			return false;
		}
		try{
			int c = hibernateTemplate.bulkUpdate("update DeliveryUser cu set cu.telphone='"+newphonenum+"' where cu.id="+cuser.getId()+" and cu.password='"+cuser.getPassword()+"'");
			if(c>0){
				flag = true;
			}else{
				flag = false;
			}
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updatePsw(Object o) {
		boolean flag = false;
		DeliveryUser cuser = null;
		if(o instanceof DeliveryUser){
			cuser = (DeliveryUser)o;
		}else{
			return false;
		}
		try{
			int c = hibernateTemplate.bulkUpdate("update DeliveryUser cu set cu.password='"+cuser.getPassword()+"' where cu.telphone='"+cuser.getTelphone()+"'");
			if(c>0)
				flag = true;
			else
				flag = false;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updatePsw(String newpassword,String oldpassword, int userid) {
		boolean flag = false;
		try{
			int c = hibernateTemplate.bulkUpdate("update DeliveryUser cu set cu.password='"+newpassword+"' where cu.id="+userid+" and cu.password='"+oldpassword+"'");
			if(c>0)
				flag = true;
			else 
				flag = false;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 跟新用户信息
	 */
	public boolean updateInfo(Object o) {
		DeliveryUser duser = (DeliveryUser)o;
		boolean flag = false;
		try {
			DeliveryUser duser1 = hibernateTemplate.get(DeliveryUser.class, duser.getId());
			duser1.setCreatetime(duser.getCreatetime());
			duser1.setShop_id(duser.getShop_id());
			duser1.setUsername(duser.getUsername());
			hibernateTemplate.update(duser1);
			flag = true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public String getNickNameByTel(String tel) {
		List<String> nn =  hibernateTemplate.find("select cu.telphone from DeliveryUser cu where cu.telphone='"+tel+"'");
		if(nn.size()!=0){
			return nn.get(0).toString();
		}
		return "";
	}
	
	@SuppressWarnings("unchecked")
	public int isHasUser(String tel) {
		List<DeliveryUser> list = hibernateTemplate.find("from DeliveryUser du where du.telphone='"+tel+"'");
		if(list.size()!=0){
			return list.get(0).getId();
		}
		return 0;
	}
	public String getUserID(String name) {
		return null;
	}
	
	public Serializable saveBasicInfo(Object o) {
		Serializable id = 0;
		try{
			id = hibernateTemplate.save(o);
		}catch(Exception e){
			id = 0;
			e.printStackTrace();
		}
		return id;
	}
	
	/**
	 * 获取配送员所属的区域
	 */
	public String getShopsAddress(int deliveryid) {
		//获取配送员所属商家的省，市，区域的id
		String sql = "select s.sheng,s.shi,s.area from shops s where s.id=" +
				"(select d.shop_id from user_delivery d where d.id="+deliveryid+")";
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		List list = session.createSQLQuery(sql).list();
		//获取省，市，区域id所对应的名字，组成地址
		sql = "select area_name from area where id in (";
		String address = "";
		if(list.size()>0){
			Object obj = list.get(0);
			Object[] os = (Object[])obj;
			sql += os[0]+","+os[1]+","+os[2]+")";
			List list1 = session.createSQLQuery(sql).list();
			if(list1.size()==3){
				address = list1.get(0)+""+list1.get(1)+""+list1.get(2);
			}
		}
		return address;
	}
	
	public void updatePassWord(Object user, String newpassword) {
		DeliveryUser duser = null;
		if(user instanceof DeliveryUser)
			duser = (DeliveryUser)user;
		try{
			hibernateTemplate.bulkUpdate("update DeliveryUser cu set cu.password='"+newpassword+"' where cu.id="+duser.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int getShopsID(int userid) {
		List<DeliveryUser> deliveryUsers = hibernateTemplate.find("from DeliveryUser du where du.id="+userid);
		if(deliveryUsers.size()>0){
			return deliveryUsers.get(0).getShop_id();
		}
		return 0;
	}
}
