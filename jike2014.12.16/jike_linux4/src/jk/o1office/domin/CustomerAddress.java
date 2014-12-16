package jk.o1office.domin;

import java.util.Date;

public class CustomerAddress {
	private String address;			/*详细地址*/
	private int area;			/*地区id*/
	private int community;		/*小区id*/
	private String communityname;	/*小区名称*/
	private String contact_number;	/*联系号码*/
	private String contacts;		/*联系人*/
	private Date createtime;
	private int customer_id;		/*客户id*/
	private int id;
	private int is_default;			/*默认收货地址*/
	private String shop;
	public String getAddress() {
		return address;
	}
	public int getArea() {
		return area;
	}
	public int getCommunity() {
		return community;
	}
	public String getCommunityname() {
		return communityname;
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
	public void setCommunityname(String communityname) {
		this.communityname = communityname;
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
