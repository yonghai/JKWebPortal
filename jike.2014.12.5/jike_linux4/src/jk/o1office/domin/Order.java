package jk.o1office.domin;

import java.util.Date;

public class Order {
	private int id;
	private String orderid; /* 订单id */
	private long customer_id; /* 客户id */
	private long delivery_address_id; /* 送货地址 */
	private long delivery_address_stamp;/* 配送地址版本 */
	private int pay_status; /* 支付状态0=未支付1=已支付 */
	private int pay_type; /* 支付类型 */
	private int actual_pay_type; /* 实际支付类型 */
	private String reserved_delivery_time;/* 预约送货时间 */
	private String actual_delivery_time;/* 实际送货时间 */
	private int bill_status; /* 订单状态 */
	private String total_price; /* 订单总价 */
	private long delivery_id; /* 配送员 */
	private Date createtime; /* 下单时间 */
	private Date lastupdatetime;
	private int isview;
	private String checkcode; /* 验证码 */
	private int goodsnum;
	private String tel;		/*收货人号码*/
	private String address; /*收货人地址*/
	private String name;	/*收货人姓名*/
	private String deliveryprice;
	public String getDeliveryprice() {
		return deliveryprice;
	}

	public void setDeliveryprice(String deliveryprice) {
		this.deliveryprice = deliveryprice;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public int getIsview() {
		return isview;
	}

	public void setIsview(int isview) {
		this.isview = isview;
	}

	public int getId() {
		return id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(long customerId) {
		customer_id = customerId;
	}

	public long getDelivery_address_id() {
		return delivery_address_id;
	}

	public void setDelivery_address_id(long deliveryAddressId) {
		delivery_address_id = deliveryAddressId;
	}

	public long getDelivery_address_stamp() {
		return delivery_address_stamp;
	}

	public void setDelivery_address_stamp(long deliveryAddressStamp) {
		delivery_address_stamp = deliveryAddressStamp;
	}

	public int getPay_status() {
		return pay_status;
	}

	public void setPay_status(int payStatus) {
		pay_status = payStatus;
	}

	public int getPay_type() {
		return pay_type;
	}

	public void setPay_type(int payType) {
		pay_type = payType;
	}

	public int getActual_pay_type() {
		return actual_pay_type;
	}

	public void setActual_pay_type(int actualPayType) {
		actual_pay_type = actualPayType;
	}

	public String getReserved_delivery_time() {
		return reserved_delivery_time;
	}

	public void setReserved_delivery_time(String reservedDeliveryTime) {
		reserved_delivery_time = reservedDeliveryTime;
	}

	public String getActual_delivery_time() {
		return actual_delivery_time;
	}

	public void setActual_delivery_time(String actualDeliveryTime) {
		actual_delivery_time = actualDeliveryTime;
	}

	public int getBill_status() {
		return bill_status;
	}

	public void setBill_status(int billStatus) {
		bill_status = billStatus;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String totalPrice) {
		total_price = totalPrice;
	}

	public long getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(long deliveryId) {
		delivery_id = deliveryId;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getLastupdatetime() {
		return lastupdatetime;
	}

	public void setLastupdatetime(Date lastupdatetime) {
		this.lastupdatetime = lastupdatetime;
	}
}
