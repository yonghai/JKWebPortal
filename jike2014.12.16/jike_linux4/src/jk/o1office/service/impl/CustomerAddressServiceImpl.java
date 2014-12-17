package jk.o1office.service.impl;

import java.util.List;

public class CustomerAddressServiceImpl implements CustomerAddressService{
	private CustomerAddressDao customerAddressDao;
	public CustomerAddressDao getCustomerAddressDao() {
		return customerAddressDao;
	}
	public void setCustomerAddressDao(CustomerAddressDao customerAddressDao) {
		this.customerAddressDao = customerAddressDao;
	}
	public int getAreaID(int addressid) {
		return customerAddressDao.getAreaID(addressid);
	}
	
	public Integer[] getAddressIds(int areaid) {
		List<Integer> ids = customerAddressDao.getAddressIds(areaid);
		Integer[] addressids = new Integer[ids.size()];
		addressids = ids.toArray(addressids);
		return addressids;
	} 
}
