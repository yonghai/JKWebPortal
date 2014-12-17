package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.Device;

public interface DeviceService {
	boolean delete(Device d);

	void save(Device device);

	boolean isOnline(String token);

	List<Device> getDevices(String role);

}
