package jk.o1office.dao.impl;

import java.util.List;

import jk.o1office.dao.VersionDao;
import jk.o1office.domin.VersionInfo;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class VersionDaoImpl implements VersionDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public VersionInfo getVersionInfo(String role) {
		return (VersionInfo) hibernateTemplate.find("from VersionInfo vi where vi.role='"+role+"'").get(0);
	}
	
	public String getVersion(String where,String role){
		VersionInfo vi = (VersionInfo)hibernateTemplate.find("from VersionInfo vi where vi.role='"+role+"'").get(0);
		if(where.equals("category_ver")){
			return vi.getCategory_ver();
		}else if(where.equals("area_ver")){
			return vi.getArea_ver();
		}else{
			return vi.getSoft_ver();
		}
	}
	
	//lowprice,deliveryprice,deliveryrange
	public String[] getPrices(String role) {
		List<VersionInfo> list = hibernateTemplate.find("from VersionInfo vi where vi.role='"+role+"'");
		String[] prices = new String[3];
		if(list.size()>0){
			VersionInfo versionInfo = list.get(0);
			prices[0] = versionInfo.getLowprice();
			prices[1] = versionInfo.getDeliveryprice();
			prices[2] = versionInfo.getDeliveryrange();
		}
		return prices;
	}
	
	public String[] getDeliveryTime() {
		List list = hibernateTemplate.find("select vi.deliverytimer,vi.starttime,vi.endtime from VersionInfo vi where vi.role='delivery'");
		if(list.size()>0){
			Object obj = list.get(0);
			Object[] os = (Object[])obj;
			return new String[]{os[0].toString(),os[1].toString(),os[2].toString()};
		}
		return new String[]{"30","09:00:00","20:00:00"};
	}
}
