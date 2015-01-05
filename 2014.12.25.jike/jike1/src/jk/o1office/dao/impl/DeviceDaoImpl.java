package jk.o1office.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.DeviceDao;
import jk.o1office.domin.Device;
import jk.o1office.utils.IDGenertor;

public class DeviceDaoImpl implements DeviceDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 用户注销操作
	 * 删除对应的在线标示
	 */
	public boolean delete(Device d) {
		boolean flag = false;
		try{
			int c = hibernateTemplate.bulkUpdate("delete from Device d where (d.token='"+d.getToken()+"' or d.userid='"+d.getUserid()+"') and d.role='"+d.getRole()+"'");
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
	
	public void save(Device device) {
		hibernateTemplate.save(device);
	}
	
	/**
	 * 判断用户是否在线
	 */
	public boolean isOnline(String token){
		List list = hibernateTemplate.find("from Device d where d.token ='"+token+"'");
		if(list.size()!=0){
			return true;
		}
		return false;
	}
	
	/**
	 * 用户在线是返回true
	 */
	public boolean isOnline(String token, int userid,String role) {
		List list = hibernateTemplate.find("from Device d where d.role='"+role+"' and (d.token ='"+token+"' or d.userid='"+userid+"')");
		if(list.size()!=0){
			return true;
		}
		return false;
	}
	
	public List<Device> getDevices(String role) {
		return hibernateTemplate.find("from Device d where d.role='"+role+"')");
	}
}	
