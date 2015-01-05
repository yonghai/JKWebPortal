package jk.o1office.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import jk.o1office.dao.AddressDao;
import jk.o1office.domin.Area;
import jk.o1office.domin.Community;
import jk.o1office.domin.CustomerAddress;
import jk.o1office.utils.JsonHandler;

import org.hibernate.StaleStateException;
import org.json.JSONObject;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class AddressDaoImpl implements AddressDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Deprecated
	public List<CustomerAddress> getAddressList(int userid) {
		return hibernateTemplate.find("from CustomerAddress ca where ca.customer_id="+userid+" and ca.community=0 and ca.area=0");
	}
	
	
	/**
	select * from area where id=7
	union
	select * from area where id=(select parent_id from area where id=7)
	union
	select * from area where id=(select parent_id from area where id=
	(select parent_id from area where id=7))
	*/
	//获取用户的配送地址
	@SuppressWarnings("unchecked")
	public List getAddressLists(int userid){
		List<CustomerAddress> cas = hibernateTemplate.find("from CustomerAddress ca where ca.customer_id="+userid);
	//	List<Community> community = new ArrayList<Community>();
	//	List<Object> area = new ArrayList<Object>();
		List cass = new ArrayList();
		if(cas.size()!=0){
			for(CustomerAddress ca : cas){
				Map<String,Object> list = new HashMap<String,Object>();
				list.put("details",ca);
				int areaid = ca.getArea();
				int communityid = ca.getCommunity();
				if(communityid != 0){
					Community community = hibernateTemplate.get(Community.class, communityid);	
					list.put("community",community);
				}else{
					Community community = new Community();
					community.setName(ca.getCommunityName());
					list.put("community",community);
				//	return null;
				}
				if(areaid != 0){
					Area a1 = hibernateTemplate.get(Area.class, areaid);
					list.put("regional",a1);
					Area a2 = hibernateTemplate.get(Area.class, a1.getPid());
					list.put("counties",a2);
					Area a3 = hibernateTemplate.get(Area.class, a2.getPid());
					list.put("provinces",a3);
				}else{
					Area a1 = new Area();
					a1.setName(ca.getRegionalName());
					list.put("regional",a1);
					Area a2 = new Area();
					a2.setName(ca.getCountryName());
					list.put("counties",a2);
					Area a3 = new Area();
					a3.setName(ca.getProvinceName());
					list.put("provinces",a3);
					//return null;
				}
				cass.add(JsonHandler.ObjectToJSONArray(list, 
						new String[]{"createtime","longitude","latitude","description"}));
			}
		//	cass.add(area);
		//	cass.add(JsonHandler.ObjectToJSONArray(community, new String[]{"createtime"}));
			return cass;
		}else{
			return cass;
		}
	}
	
	
	public List getAddressListsIOS(int userid){
		List<CustomerAddress> cas = hibernateTemplate.find("from CustomerAddress ca where ca.customer_id="+userid);
	//	List<Community> community = new ArrayList<Community>();
	//	List<Object> area = new ArrayList<Object>();
		List cass = new ArrayList();
		System.out.println(cas);
		if(cas.size()!=0){
			for(CustomerAddress ca : cas){
				Map<String, Object> list = new HashMap<String, Object>();
				list.put("details",ca);
				int areaid = ca.getArea();
				int communityid = ca.getCommunity();
				if(communityid != 0)
					list.put("community",hibernateTemplate.get(Community.class, communityid));
				else{
					list.put("community","");
					return null;
				}
				if(areaid != 0){
					Area a1 = hibernateTemplate.get(Area.class, areaid);
					list.put("regional",a1);
					Area a2 = hibernateTemplate.get(Area.class, a1.getPid());
					list.put("counties",a2);
					Area a3 = hibernateTemplate.get(Area.class, a2.getPid());
					list.put("provinces",a3);
				}else{
					list.put("regional","");
					list.put("counties","");
					list.put("provinces","");
					return null;
				}
				Map map = new HashMap();
				map.put("item",JsonHandler.ObjectToJSONArray(list, 
						new String[]{"createtime","longitude","latitude","description"}));
				cass.add(map);
			}
			System.out.println(cass.size());
		//	cass.add(area);
		//	cass.add(JsonHandler.ObjectToJSONArray(community, new String[]{"createtime"}));
			return cass;
		}else{
			return cass;
		}
	}
	/**
	 * 保存新增用户配送地址
	 * 如过新增地址是默认地址，则将以前的默认地址修改为非默认地址
	 */
	public Serializable save(CustomerAddress ca) {
		Serializable id = 0;
		try{
			//如果新增的地址是默认地址,则将改用户的其他默认地址更改为非默认地址
			if(ca.getIs_default()==1){
				hibernateTemplate.bulkUpdate("update CustomerAddress ca set ca.is_default=0 where ca.customer_id="+ca.getCustomer_id());
			}
			id = hibernateTemplate.save(ca);
		}catch(Exception e){
			id = 0;
			e.printStackTrace();
		}
		return id;
	}
	
	
	/**
	 * 更新用户配送地址
	 */
	@SuppressWarnings("finally")
	public boolean updateAddress(CustomerAddress ca)throws StaleStateException,DataAccessException {
		boolean flag = false;
		try{
			if(ca.getIs_default()==1){
				hibernateTemplate.bulkUpdate("update CustomerAddress ca set ca.is_default=0 where ca.customer_id="+ca.getCustomer_id());
			}
			hibernateTemplate.update(ca);
			flag = true;
		}catch(Exception e){
			flag = false;
		}finally{
			return flag;
		}
	}
	
	/**
	 * 删除用户配送地址
	 */
	@SuppressWarnings("finally")
	public boolean deleteAddress(int id) {
		boolean flag = false;
		try{
			hibernateTemplate.delete((CustomerAddress)hibernateTemplate.get(CustomerAddress.class, id));
			flag = true;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}finally{
			return flag;
		}
	}
	
	/**
	 * 设置默认的收货地址
	 * 将其他的默认地址设为非默认地址
	 * 设置成功返回true
	 */
	public boolean setDefaultAddress(int id,int userid) {
		boolean flag = false;
		try{
			hibernateTemplate.bulkUpdate("update CustomerAddress ca set ca.is_default=0 where ca.customer_id="+userid);
			int c = hibernateTemplate.bulkUpdate("update CustomerAddress ca set ca.is_default=1 where ca.id="+id+" and ca.customer_id="+userid);
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
	 * select area_name from tablename where id=7
union 
select area_name from tablename where id=(select parent_id from tablename where id=7)
union 
select area_name from tablename where id=(select parent_id from tablename where id=(select parent_id from tablename where id=7))
	 */
	
	@SuppressWarnings("unchecked")
	public Map getDefaultAddrss(int userID) {
		Map map = new HashMap();
		List<CustomerAddress> list = hibernateTemplate.find("from CustomerAddress ca where ca.customer_id="+userID+" and ca.is_default=1");
		if(list.size()>0){
			CustomerAddress ca = list.get(0);
			map.put("id", ca.getId());
			map.put("address", ca.getAddress());
			map.put("name", ca.getContacts());
			map.put("tel", ca.getContact_number());
			String sql = "select area_name from area where id="+ca.getArea()+" union" +
					" select area_name from area where id=(select parent_id from area where id="+ca.getArea()+") union" +
							" select area_name from area where id=(select parent_id from area where id=(select parent_id from area where id="+ca.getArea()+"))";
			List<String> areas = hibernateTemplate.getSessionFactory()
			//.openSession()
			.getCurrentSession()
			.createSQLQuery(sql).list();
			if(areas.size()<3){
				map.put("provinces", ca.getProvinceName());
				map.put("counties", ca.getCountryName());
				map.put("regional", ca.getRegionalName());
				map.put("community", ca.getCommunityName());
				
			}else{
				if(null!=areas.get(2))
					map.put("provinces", areas.get(2));
				else
					map.put("provinces", "");
				if(null!=areas.get(1))
					map.put("counties", areas.get(1));
				else
					map.put("counties", "");
				if(null!=areas.get(0))
					map.put("regional", areas.get(0));
				else
					map.put("regional", "");
				Community c = (Community)hibernateTemplate.find("from Community c where c.id="+ca.getCommunity()).get(0);
				if(null!=c)
					map.put("community", c.getName());
				else
					map.put("community", "");
			}
		}else{
			//没有默认地址
			map.put("addressnum", getAddressNum(userID));
		}
		return map;
	}
	
	//获取配送地址的数量
	private int getAddressNum(int userid){
		int num = ((Long)hibernateTemplate.find("select count(*) from CustomerAddress ca where ca.customer_id="+userid).get(0)).intValue();
		if(num>0){
			return 1;
		}
		return 0;
	}
	
	public static void main(String[] args) {
		Map m = new IdentityHashMap();
		m.put(new String("a"), "a");
		m.put(new String("a"), "b");
		System.out.println(m);
	}

	public Serializable saveNewAddress(CustomerAddress ca) {
		Serializable id = 0;
		try{
			id = hibernateTemplate.save(ca);
		}catch(Exception e){
			id = 0;
			e.printStackTrace();
		}
		return id;
	}

	public boolean updateNewAddress(CustomerAddress ca) {
		boolean flag = false;
		try{
	//		CustomerAddress address = hibernateTemplate.load(CustomerAddress.class, ca.getId());
		//	hibernateTemplate.evict(ca);
		//	hibernateTemplate.update(ca);
			hibernateTemplate.merge(ca);
			flag = true;
			System.out.println("updateNewAddress  success");
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}finally{
			System.out.println("updateNewAddress  "+flag);
			return flag;
		}
	}
	
	/**
	 * 获取旧版本添加的地址
	 */
	@SuppressWarnings("unchecked")
	public List<CustomerAddress> getOldAddressList(int userid) {
		List<CustomerAddress> cas = hibernateTemplate
				.find("from CustomerAddress ca where ca.customer_id=" + userid
						+ " and ca.area!=0 and ca.community!=0");
		if (cas.size() != 0) {
			for (CustomerAddress ca : cas) {
				int areaid = ca.getArea();
				int communityid = ca.getCommunity();
				if (communityid != 0) {
					Community community = hibernateTemplate.get(
							Community.class, communityid);
					ca.setCommunityName(community.getName());
				} else {
					return null;
				}
				if (areaid != 0) {
					Area a1 = hibernateTemplate.get(Area.class, areaid);
					ca.setRegionalName(a1.getName());
					Area a2 = hibernateTemplate.get(Area.class, a1.getPid());
					ca.setCountryName(a2.getName());
					Area a3 = hibernateTemplate.get(Area.class, a2.getPid());
					ca.setProvinceName(a3.getName());
				} else {
					return null;
				}
			//	ca.setAddress(ca.getProvinceName()+ca.getCountryName()+ca.getRegionalName()+ca.getCommunityName()+ca.getAddress());
			}
		}
		return cas;
	}
}
