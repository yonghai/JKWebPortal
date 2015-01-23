package jk.o1office.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import jk.o1office.dao.DeviceDao;
import jk.o1office.domin.Device;
import jk.o1office.service.DeviceService;

public class DeviceServiceImpl implements DeviceService {
	private DeviceDao deviceDao;
	public DeviceDao getDeviceDao() {
		return deviceDao;
	}
	
	public void setDeviceDao(DeviceDao deviceDao) {
		this.deviceDao = deviceDao;
	}
	
	public boolean delete(Device d) {
		return false;
	}
	
	public boolean isOnline(String token) {
		return deviceDao.isOnline(token);
	}
	
	public void save(Device device) {
		
	}

	public List<Device> getDevices(String role) {
		return deviceDao.getDevices(role);
	}

	public Collection<String> getRegistrationIds() throws Exception {
		return deviceDao.getRegistrationIds();
	}
}
