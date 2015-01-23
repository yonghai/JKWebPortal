package jk.o1office.domin;

import java.util.Date;

/**
 * 设备信息
 */
public class Device {
	private int id;
	private String device_id;					/*�豸id*/
	private String device_mac;					/*�豸���*/
	private String device_model_id;			/*�豸��ϸ��Ϣ*/
	private Date createTime;					/*�ϴ��豸��Ϣʱ��*/
	private String token;						/*��¼��½״̬*/
	private int userid;						/*用户唯一id*/
	private String role;						/*用户角色*/
	private String registration_id;
	public String getRegistration_id() {
		return registration_id;
	}
	public void setRegistration_id(String registrationId) {
		registration_id = registrationId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getDevice_model_id() {
		return device_model_id;
	}
	public void setDevice_model_id(String deviceModelId) {
		device_model_id = deviceModelId;
	}
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
