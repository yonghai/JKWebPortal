package jk.o1office.domin;

import java.util.Date;

public class Shops {
	private int id;
	private String bossname;
	private String bosstel;
	private Date createtime;
	private String shopaddr;
	private String shopimg;
	private String shopname;
	private String shoptel;
	private int areaid;
	private String longitude;
	private String latitude;
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBossname() {
		return bossname;
	}
	public void setBossname(String bossname) {
		this.bossname = bossname;
	}
	public String getBosstel() {
		return bosstel;
	}
	public void setBosstel(String bosstel) {
		this.bosstel = bosstel;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getShopaddr() {
		return shopaddr;
	}
	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}
	public String getShopimg() {
		return shopimg;
	}
	public void setShopimg(String shopimg) {
		this.shopimg = shopimg;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getShoptel() {
		return shoptel;
	}
	public void setShoptel(String shoptel) {
		this.shoptel = shoptel;
	}
	public int getAreaid() {
		return areaid;
	}
	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}
}
