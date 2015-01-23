package jk.o1office.domin;

import java.util.Date;

public class Product {	
	private String bar_code;				/*商品条形码*/
	private Date createtime;
	private String dosing;				/*配料*/
	private String feature;
	private int id;						/*商品ID*/
	private int ordernum;
	private String pbzq;				/*保质期*/
	private String product_brand;		/*商品品牌*/
	private int product_category;	/*商品分类*/
	private String product_description; /*商品详情*/
	private String product_img;			/*商品图片*/
	private String product_name;		/*商品名称*/
	private String product_price;		/*商品价格*/
	private int product_version;		/*商品版本号*/
	private String protechnics;			/*生产工艺*/
	private String pvalume;				/*商品体积*/
	private String pweight;				/*商品重量*/
	private String qualitylevel;		/*质量等级*/
	private String storerange;			/*存储条件*/
	private int tradenum;
	private	int version;
	private int ishas = 1;					/*该商品是否有存货*/
	private String promotionprice = "";		/*促销价*/
	private int ispromotion = 0;			/*是否促销商品*/
	public String getPromotionprice() {
		return promotionprice;
	}
	public void setPromotionprice(String promotionprice) {
		this.promotionprice = promotionprice;
	}
	public int getIspromotion() {
		return ispromotion;
	}
	public void setIspromotion(int ispromotion) {
		this.ispromotion = ispromotion;
	}
	public int getIshas() {
		return ishas;
	}
	public void setIshas(int ishas) {
		this.ishas = ishas;
	}
	public String getBar_code() {
		return bar_code;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public String getDosing() {
		return dosing;
	}
	public String getFeature() {
		return feature;
	}
	public int getId() {
		return id;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public String getPbzq() {
		return pbzq;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public int getProduct_category() {
		return product_category;
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
	public int getProduct_version() {
		return product_version;
	}
	public String getProtechnics() {
		return protechnics;
	}
	public String getPvalume() {
		return pvalume;
	}
	public String getPweight() {
		return pweight;
	}
	public String getQualitylevel() {
		return qualitylevel;
	}
	public String getStorerange() {
		return storerange;
	}
	public int getTradenum() {
		return tradenum;
	}
	public int getVersion() {
		return version;
	}
	public void setBar_code(String barCode) {
		bar_code = barCode;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public void setDosing(String dosing) {
		this.dosing = dosing;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public void setPbzq(String pbzq) {
		this.pbzq = pbzq;
	}
	public void setProduct_brand(String productBrand) {
		product_brand = productBrand;
	}
	public void setProduct_category(int productCategory) {
		product_category = productCategory;
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
	public void setProduct_version(int productVersion) {
		product_version = productVersion;
	}
	public void setProtechnics(String protechnics) {
		this.protechnics = protechnics;
	}
	public void setPvalume(String pvalume) {
		this.pvalume = pvalume;
	}
	public void setPweight(String pweight) {
		this.pweight = pweight;
	}
	public void setQualitylevel(String qualitylevel) {
		this.qualitylevel = qualitylevel;
	}
	public void setStorerange(String storerange) {
		this.storerange = storerange;
	}
	public void setTradenum(int tradenum) {
		this.tradenum = tradenum;
	}
	public void setVersion(int version) {
		this.version = version;
	}
}
