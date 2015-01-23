package jk.o1office.service;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import jk.o1office.domin.Device;

public interface DeviceService {
	boolean delete(Device d);

	void save(Device device);

	boolean isOnline(String token);

	List<Device> getDevices(String role);

	Collection<String> getRegistrationIds() throws Exception;

}
