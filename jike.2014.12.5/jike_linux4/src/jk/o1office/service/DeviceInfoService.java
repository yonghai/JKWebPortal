package jk.o1office.service;

import jk.o1office.domin.DeviceInfo;

public interface DeviceInfoService {
	
	/**
	 * 保存设备信息
	 * @throws Exception 
	 */
	String save(DeviceInfo deviceInfo, String token) throws Exception;
}
