package jk.o1office.domin;

import java.util.Date;

public class Shop {
	private int id;
	private int areaid;
	public int getAreaid() {
		return areaid;
	}
	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}
	private String product_name;
	private int longitude;
	private int latitude;
	private String business_hours;	
	private int business_status;		/*营业状态*/
	private int delivery_capacity;		/*配送能力*/
	private String description;			/*详情*/
	private Date createtime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public String getBusiness_hours() {
		return business_hours;
	}
	public void setBusiness_hours(String businessHours) {
		business_hours = businessHours;
	}
	public int getBusiness_status() {
		return business_status;
	}
	public void setBusiness_status(int businessStatus) {
		business_status = businessStatus;
	}
	public int getDelivery_capacity() {
		return delivery_capacity;
	}
	public void setDelivery_capacity(int deliveryCapacity) {
		delivery_capacity = deliveryCapacity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
