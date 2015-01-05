package jk.o1office.ht.domin;

public class MyOrderDetails {
	private String orderid;
	private int product_id;
	private String product_price;
	private int product_number;
	private String product_name;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String productPrice) {
		product_price = productPrice;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int productNumber) {
		product_number = productNumber;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
}
