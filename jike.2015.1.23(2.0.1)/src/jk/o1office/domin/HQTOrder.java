package jk.o1office.domin;

import java.util.Date;

public class HQTOrder extends O{
	private int id;
	private String orderid;				//订单id
	private String qturl;				//语音地址
	private String content;				//提交订单的附带内容
	private int voicelength;			
	public int getVoicelength() {
		return voicelength;
	}
	public void setVoicelength(int voicelength) {
		this.voicelength = voicelength;
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
	public String getQturl() {
		return qturl;
	}
	public void setQturl(String qturl) {
		this.qturl = qturl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "  " +   " " +   "  " +content+"  "+"  ";
	}
}
