package jk.o1office.domin;

import java.util.Date;

public class HAllOrderInfo {
	private int id;
	private String orderid;
	private int customerid;
	private int deliveryid;
	private String deliveryprice;
	private String total_price;
	private int ordertype;
	private int bill_status;
	private int isview;
	private String checkcode;
	private int goodsnum;
	private String address;
	private int addressid;
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	private String tel;
	private String name;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	private Date createtime;
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String totalPrice) {
		total_price = totalPrice;
	}
	public String getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(String deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public int getDeliveryid() {
		return deliveryid;
	}
	public void setDeliveryid(int deliveryid) {
		this.deliveryid = deliveryid;
	}
	public int getIsview() {
		return isview;
	}
	public void setIsview(int isview) {
		this.isview = isview;
	}
	public int getBill_status() {
		return bill_status;
	}
	public void setBill_status(int billStatus) {
		bill_status = billStatus;
	}
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(int ordertype) {
		this.ordertype = ordertype;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
