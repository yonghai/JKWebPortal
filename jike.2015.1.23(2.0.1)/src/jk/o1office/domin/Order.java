package jk.o1office.domin;

public class Order extends O{
	private int id;
	private String orderid; /* 订单id */
	private int product_id;
	private int product_number;
	private String product_price;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int productNumber) {
		product_number = productNumber;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String productPrice) {
		product_price = productPrice;
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
	
	@Override
	public String toString() {
		return "";
	}
	
}
