package jk.o1office.ht.domin;

import java.util.Date;

public class Shops {
	private String area;
	private String bossname;
	private String bosstel;
	private Date createtime;
	private int id;
	private String sheng;
	private String shi;
	private String shopaddr;
	private String shopimg;
	private String shopname;
	private String shoptel;

	public Shops() {
	}
	
	public Shops(int id,String shopname){
		this.id = id;
		this.shopname = shopname;
	}
	
	public String getArea() {
		return area;
	}

	public String getBossname() {
		return bossname;
	}

	public String getBosstel() {
		return bosstel;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public int getId() {
		return id;
	}

	public String getSheng() {
		return sheng;
	}

	public String getShi() {
		return shi;
	}

	public String getShopaddr() {
		return shopaddr;
	}

	public String getShopimg() {
		return shopimg;
	}

	public String getShopname() {
		return shopname;
	}

	public String getShoptel() {
		return shoptel;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setBossname(String bossname) {
		this.bossname = bossname;
	}

	public void setBosstel(String bosstel) {
		this.bosstel = bosstel;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}

	public void setShopimg(String shopimg) {
		this.shopimg = shopimg;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public void setShoptel(String shoptel) {
		this.shoptel = shoptel;
	}
}
