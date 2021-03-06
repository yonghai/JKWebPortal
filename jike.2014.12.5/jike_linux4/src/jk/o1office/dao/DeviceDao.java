package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Device;

public interface DeviceDao {
	
	boolean delete(Device d);

	void save(Device device);

	boolean isOnline(String token);

	boolean isOnline(String token, int userid, String role);

	List<Device> getDevices(String role);

}
