package jk.o1office.dao.impl;


import java.util.List;

import jk.o1office.domin.CustomerAddress;
import jk.o1office.service.impl.CustomerAddressDao;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class CustomerAddressDaoImpl implements CustomerAddressDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public int getAreaID(int addressid) {
		List<CustomerAddress> customerAddresses = hibernateTemplate.find("from CustomerAddress ca where ca.id="+addressid);
		if(customerAddresses.size()>0){
			return customerAddresses.get(0).getArea();
		}
		return 0;
	}
	
	public List<Integer> getAddressIds(int areaid) {
		List<Integer> ids = hibernateTemplate.find("select ca.id from CustomerAddress ca where ca.area="+areaid);
		return ids;
	}
}
