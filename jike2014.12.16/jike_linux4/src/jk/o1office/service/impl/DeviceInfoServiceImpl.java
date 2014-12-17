package jk.o1office.service.impl;

import jk.o1office.dao.DeviceInfoDao;
import jk.o1office.domin.DeviceInfo;
import jk.o1office.service.DeviceInfoService;
import jk.o1office.utils.JsonHandler;

public class DeviceInfoServiceImpl implements DeviceInfoService {
	private DeviceInfoDao deviceInfoDao;
	public DeviceInfoDao getDeviceInfoDao() {
		return deviceInfoDao;
	}
	public void setDeviceInfoDao(DeviceInfoDao deviceInfoDao) {
		this.deviceInfoDao = deviceInfoDao;
	}

	public String save(DeviceInfo deviceInfo,String token)throws Exception {
		String flag = deviceInfoDao.save(deviceInfo);
		String returninfo = "";
		if(flag.equals("true")){
			returninfo = "{\"success\":true,\"emsg\":\"提交设备信息成功\",\"token\":\""+token+"\"}";
		}else if(flag.equals("exists")){
			returninfo = "{\"success\":true,\"emsg\":\"设备信息已存在\",\"token\":\""+token+"\"}";
		}else
			returninfo = "{\"success\":false,\"emsg\":\"提交设备信息失败\",\"token\":\""+token+"\"}";
		return returninfo;
	}

}
