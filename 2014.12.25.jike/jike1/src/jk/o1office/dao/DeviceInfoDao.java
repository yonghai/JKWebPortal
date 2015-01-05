package jk.o1office.dao;

import jk.o1office.domin.DeviceInfo;

public interface DeviceInfoDao {

	/**
	 * 保存设备信息
	 * @param deviceInfo
	 * @return
	 */
	String save(DeviceInfo deviceInfo);
}
