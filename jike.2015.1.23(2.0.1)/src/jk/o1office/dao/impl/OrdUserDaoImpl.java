package jk.o1office.dao.impl;
import java.io.Serializable;
import java.util.List;
import jk.o1office.dao.UserDao;
import jk.o1office.domin.CustomerUser;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class OrdUserDaoImpl implements UserDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 注册时保存用户信息
	 */
	public boolean save(Object o) {
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
	/**
	 * 根据用户名和密码判断是否有该用户
	 * 有用户返回该用户的id
	 * 用户名不存在返回0
	 * 密码错误返回-1
	 * 登陆成功用户id
	 */
	
	@SuppressWarnings("unchecked")
	public int isHasUser(String username, String password) {
		List<CustomerUser> list = hibernateTemplate.find("from CustomerUser cu where cu.username='"+username+"'");
		if(list.size()>0){
			CustomerUser customerUser = list.get(0);
			if(password.equals(customerUser.getPassword())){
				return customerUser.getId();
			}
			return -1;
		}
		return 0;
	}
	
/*
	@SuppressWarnings("unchecked")
	public int isHasUser(String username, String password) {
		List<CustomerUser> list = hibernateTemplate.find("from CustomerUser cu where cu.username='"+username+"' and cu.password='"+password+"'");
		if(list.size()!=0){
			return list.get(0).getId();
		}
		return 0;
	}
	*/
	
	
	
	public Object getUserByName(String username) {
		List list = hibernateTemplate.find("from CustomerUser cu where cu.username='"+username+"'");
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 修改用户密码
	 */
	public boolean updatePsw(Object o) {
		boolean flag = false;
		CustomerUser cuser = null;
		if(o instanceof CustomerUser){
			cuser = (CustomerUser)o;
		}else{
			return false;
		}
		try{
			int c = hibernateTemplate.bulkUpdate("update CustomerUser cu set cu.password='"+cuser.getPassword()+"' where cu.username='"+cuser.getUsername()+"'");
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
	 * 修改用户手机号码
	 */
	public boolean updatePhoneNum(Object o, String newphonenum) {
		boolean flag = false;
		CustomerUser cuser = null;
		if(o instanceof CustomerUser){
			cuser = (CustomerUser)o;
		}else{
			return false;
		}
		try{
			int c = hibernateTemplate.bulkUpdate("update CustomerUser cu set cu.username='"+newphonenum+"' where cu.id="+cuser.getId()+" and cu.password='"+cuser.getPassword()+"'");
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
	/**
	 * 修改用户昵称s
	 */
	public boolean updateNickName(String nickName, int userid) {
		boolean flag = false;
		try{
			int c = hibernateTemplate.bulkUpdate("update CustomerUser cu set cu.nickname='"+nickName+"' where cu.id="+userid);
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
	
	public boolean updatePsw(String newpassword, String oldpassword, int userid) {
		boolean flag = false;
		try{
			int c = hibernateTemplate.bulkUpdate("update CustomerUser cu set cu.password='"+newpassword+"' where cu.id="+userid+" and cu.password='"+oldpassword+"'");
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
	public boolean updateInfo(Object o) {
		// TODO Auto-generated method stub
		return false;
	}
	
	/**
	 * 根据用户名（手机号码）获取用户的昵称
	 */
	@SuppressWarnings("unchecked")
	public String getNickNameByTel(String username) {
		List<String> nn =  hibernateTemplate.find("select cu.nickname from CustomerUser cu where cu.username='"+username+"'");
		if(nn.size()>0){
			return nn.get(0).toString();
		}
		return "";
	}
	
	/**
	 * 判断改用户是否已经注册
	 */
	@SuppressWarnings("unchecked")
	public int isHasUser(String username) {
		List<CustomerUser> list = hibernateTemplate.find("from CustomerUser cu where cu.username='"+username+"'");
		if(list.size()!=0){
			return list.get(0).getId();
		}
		return 0;
	}
	public String getUserID(String name) {
		return  hibernateTemplate.find("select cu.id from CustomerUser cu where cu.username='"+name+"'").get(0).toString();
	}
	public Serializable saveBasicInfo(Object o) {
		return null;
	}
	public String getShopsAddress(int deliveryid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void updatePassWord(Object o, String newpassword) {
		CustomerUser cuser = null;
		if(o instanceof CustomerUser)
			cuser = (CustomerUser)o;
		try{
			hibernateTemplate.bulkUpdate("update CustomerUser cu set cu.password='"+newpassword+"' where cu.id="+cuser.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int getShopsID(int userid) {
		return 0;
	}
	public String getUserByID(int userID) {
		return null;
	}
	public String getUserTelByID(int userID) {
		return null;
	}
	
	/**
	 * 用户注销操作
	 * 删除对应的在线标示
	 *//*
	public boolean delete(Device d) {
		boolean flag = false;
		try{
			int c = hibernateTemplate.bulkUpdate("delete from Device d where d.device_id='"+d.getDevice_id()+"' and d.token='"+d.getToken()+"'");
			if(c>0)
				flag = true;
			else
				flag = false;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}*/
	
}
