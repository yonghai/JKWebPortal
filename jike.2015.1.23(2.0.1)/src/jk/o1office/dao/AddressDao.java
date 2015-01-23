package jk.o1office.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import jk.o1office.domin.CustomerAddress;

public interface AddressDao {
	@Deprecated
	List<CustomerAddress> getAddressList(int userid);
	
	List getAddressLists(int userid);
	
	List getAddressListsIOS(int userid);

	Serializable save(CustomerAddress ca);

	boolean updateAddress(CustomerAddress ca);

	boolean deleteAddress(int id);

	boolean setDefaultAddress(int id,int userid);

	Map getDefaultAddrss(int userID);

	Serializable saveNewAddress(CustomerAddress ca);

	boolean updateNewAddress(CustomerAddress ca);

	List<CustomerAddress> getOldAddressList(int userid);

}
