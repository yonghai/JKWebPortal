package jk.o1office.ht.domin;

import java.util.Date;

/**
 * 订单
 */
public class Order {
	private int billstatus;
	private Date createtime;
	private int deliveryid;
	private int goodsnum;
	private int id;
	private String orderid;
	private String totalprice;
	private int userid;
	public int getBillstatus() {
		return billstatus;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public int getDeliveryid() {
		return deliveryid;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public int getId() {
		return id;
	}
	public String getOrderid() {
		return orderid;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public int getUserid() {
		return userid;
	}
	public void setBillstatus(int billstatus) {
		this.billstatus = billstatus;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public void setDeliveryid(int deliveryid) {
		this.deliveryid = deliveryid;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
}
