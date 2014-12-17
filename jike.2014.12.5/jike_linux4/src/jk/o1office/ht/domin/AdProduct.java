package jk.o1office.ht.domin;

public class AdProduct {
	private String feature;
	private int id;
	private String product_description;
	private String product_img;
	private String product_name;
	private String product_price;
	private String promotionprice;			/*促销价格*/
	public String getPromotionprice() {
		return promotionprice;
	}
	public void setPromotionprice(String promotionprice) {
		this.promotionprice = promotionprice;
	}
	public String getFeature() {
		return feature;
	}
	public int getId() {
		return id;
	}
	public String getProduct_description() {
		return product_description;
	}
	public String getProduct_img() {
		return product_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setProduct_description(String productDescription) {
		product_description = productDescription;
	}
	public void setProduct_img(String productImg) {
		product_img = productImg;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public void setProduct_price(String productPrice) {
		product_price = productPrice;
	}
}
