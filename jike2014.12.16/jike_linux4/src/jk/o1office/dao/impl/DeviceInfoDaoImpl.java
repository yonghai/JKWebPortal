package jk.o1office.dao.impl;
import java.util.List;
import jk.o1office.dao.DeviceInfoDao;
import jk.o1office.domin.DeviceInfo;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class DeviceInfoDaoImpl implements DeviceInfoDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 * 判断是否存在该设备信息
	 * @param id
	 * @return
	 */
	private boolean isHasDeviceInfo(String deviceid){
		List list = hibernateTemplate.find("from DeviceInfo di where di.device_id='"+deviceid+"'");
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}
	
	public String save(DeviceInfo deviceInfo) {
		String flag = "";
		if(isHasDeviceInfo(deviceInfo.getDevice_id())){
			flag = "exists";
		}else{
			try{
				hibernateTemplate.save(deviceInfo);
				flag = "true";
			}catch(Exception e){
				flag = "false";
				e.printStackTrace();
			}
		}
		return flag;
	}

}
