package jk.o1office.dao.impl;

import java.util.List;

import jk.o1office.dao.ActivityDao;
import jk.o1office.domin.Activity;
import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.U_A;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class ActivityDaoImpl implements ActivityDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/**
	 * -1： 该用户不存在
	 * 0：参与了该活动
	 * 用户id：没有参与该活动
	 */
	public int isJoin(String tel, int activityid) {
		List<CustomerUser> customerUsers = hibernateTemplate.find("from CustomerUser cu where cu.username='"+tel+"'");
		if(customerUsers.size()>0){
			CustomerUser customerUser = customerUsers.get(0);
			List<U_A> list = hibernateTemplate.find("from U_A ua where ua.userid="+customerUser.getId()+" and ua.activityid="+activityid);
			if(list.size()>0)	/*参与了活动*/
				return 0;
			else	/*没有参与活动*/
				return customerUser.getId();
		}else	/*该用户不存在*/
			return -1;
	}

	public void join(int userid, int activityid) throws Exception {
		U_A ua = new U_A();
		ua.setUserid(userid);
		ua.setActivityid(activityid);
		hibernateTemplate.save(ua);
	}
	
	public Activity getActivity(int activityid) {
		List<Activity> activities = hibernateTemplate.find("from Activity a where a.id="+activityid);
		if(activities.size()>0)
			return activities.get(0);
		return null;
	}
	
}
