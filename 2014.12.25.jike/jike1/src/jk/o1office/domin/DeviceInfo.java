package jk.o1office.domin;

import java.util.Date;

/**
 * 设备信息
 */
public class DeviceInfo {
	private int id;
	private String device_id;					/*�豸id*/
	private String device_name;					/*�豸���*/
	private String device_type;					/*�豸����*/
	private String device_resolution;			/*�豸�ֱ���*/
	private String device_screen;				/*�豸��Ļ*/	
	private String device_os;					/*�豸ϵͳ*/
	private String device_os_version;			/*�豸ϵͳ�汾*/
	private String device_hardware_vendors;		/*�豸����*/
	private String device_detail_info;			/*�豸��ϸ��Ϣ*/
	private String device_mac;					/*�豸mac��ַ*/
	private Date createTime;					/*�ϴ��豸��Ϣʱ��*/
	private String token;						/*��¼��½״̬*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String deviceId) {
		device_id = deviceId;
	}
	public String getDevice_name() {
		return device_name;
	}
	public void setDevice_name(String deviceName) {
		device_name = deviceName;
	}
	public String getDevice_type() {
		return device_type;
	}
	public void setDevice_type(String deviceType) {
		device_type = deviceType;
	}
	public String getDevice_resolution() {
		return device_resolution;
	}
	public void setDevice_resolution(String deviceResolution) {
		device_resolution = deviceResolution;
	}
	public String getDevice_screen() {
		return device_screen;
	}
	public void setDevice_screen(String deviceScreen) {
		device_screen = deviceScreen;
	}
	public String getDevice_os() {
		return device_os;
	}
	public void setDevice_os(String deviceOs) {
		device_os = deviceOs;
	}
	public String getDevice_os_version() {
		return device_os_version;
	}
	public void setDevice_os_version(String deviceOsVersion) {
		device_os_version = deviceOsVersion;
	}
	public String getDevice_hardware_vendors() {
		return device_hardware_vendors;
	}
	public void setDevice_hardware_vendors(String deviceHardwareVendors) {
		device_hardware_vendors = deviceHardwareVendors;
	}
	public String getDevice_detail_info() {
		return device_detail_info;
	}
	public void setDevice_detail_info(String deviceDetailInfo) {
		device_detail_info = deviceDetailInfo;
	}
	public String getDevice_mac() {
		return device_mac;
	}
	public void setDevice_mac(String deviceMac) {
		device_mac = deviceMac;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}	
	
}
