package jk.o1office.domin;

import java.util.Date;

public class OrderDetail {
	private Date createtime;
	private int id;
	private String orderid;			/*订单id*/
	private int product_id;		/*商品id*/
	private int product_number;		/*商品数量*/
	private String product_price; /*商品价格*/
	private String product_stamp;	/*商品版本号*/
	public Date getCreatetime() {
		return createtime;
	}
	public int getId() {
		return id;
	}
	public String getOrderid() {
		return orderid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public int getProduct_number() {
		return product_number;
	}
	public String getProduct_price() {
		return product_price;
	}
	public String getProduct_stamp() {
		return product_stamp;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public void setProduct_number(int productNumber) {
		product_number = productNumber;
	}
	public void setProduct_price(String productPrice) {
		product_price = productPrice;
	}
	public void setProduct_stamp(String productStamp) {
		product_stamp = productStamp;
	}
	
}
