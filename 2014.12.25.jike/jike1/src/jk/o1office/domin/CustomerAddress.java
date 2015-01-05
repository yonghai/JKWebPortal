package jk.o1office.domin;

import java.util.Date;

public class CustomerAddress {
	private String address;			/*详细地址*/
	private int area;			/*地区id*/
	private int community;		/*小区id*/
	private String contact_number;	/*联系号码*/
	private String contacts;		/*联系人*/
	private Date createtime;
	private int customer_id;		/*客户id*/
	private int id;
	private int is_default;			/*默认收货地址*/
	private String shop;
	private String communityName;	/*小区名称*/
	private String regionalName;	/*区域名称*/
	private String countryName;		/*地区名称*/
	private String provinceName;	/*省份名称*/
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public String getRegionalName() {
		return regionalName;
	}
	public void setRegionalName(String regionalName) {
		this.regionalName = regionalName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getAddress() {
		return address;
	}
	public int getArea() {
		return area;
	}
	public int getCommunity() {
		return community;
	}
	public String getContact_number() {
		return contact_number;
	}
	public String getContacts() {
		return contacts;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public int getId() {
		return id;
	}
	public int getIs_default() {
		return is_default;
	}
	public String getShop() {
		return shop;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public void setCommunity(int community) {
		this.community = community;
	}
	public void setContact_number(String contactNumber) {
		contact_number = contactNumber;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public void setCustomer_id(int customerId) {
		customer_id = customerId;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setIs_default(int isDefault) {
		is_default = isDefault;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}
	
}	
