package jk.o1office.domin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UnFinshOrder {
	private String orderid;
	private Date createtime;			/*接单时间*/
	private String address;
	private String tel;
	private int goodsnum;
	private String total_price;
	private String name;
	private String deliveryprice;
	private int ordertype;
	public int getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(int ordertype) {
		this.ordertype = ordertype;
	}
	public String getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(String deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	private List<SP> goodsinfo = new ArrayList<SP>();
	public List<SP> getGoodsinfo() {
		return goodsinfo;
	}
	public void setGoodsinfo(List<SP> goodsinfo) {
		this.goodsinfo = goodsinfo;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
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
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String totalPrice) {
		total_price = totalPrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
