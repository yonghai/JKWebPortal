package jk.o1office.service.impl;

import java.util.List;

public interface CustomerAddressDao {

	int getAreaID(int addressid);

	List<Integer> getAddressIds(int areaid);

}
