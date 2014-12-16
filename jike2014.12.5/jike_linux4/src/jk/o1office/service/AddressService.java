package jk.o1office.service;

import jk.o1office.domin.CustomerAddress;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.UpdateException;

public interface AddressService {

	String getAddressList(String token) throws Exception;
	
	String getAddressListIOS(String token) throws Exception;

	String save(CustomerAddress ca, String token) throws Exception;

	String updateAddress(CustomerAddress ca, String token) throws Exception;

	String deleteAddres(int id, String token) throws Exception;

	String setDefaultAddress(int parseInt, String token) throws Exception;

	String getDefaultAddress(String token) throws Exception;

}
