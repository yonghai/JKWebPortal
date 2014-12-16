package jk.o1office.ht.domin;

import java.util.Date;

public class Product {
	private int id;
	private String barcode;
	private int pversion;
	private String pname;
	private int pcategoryid;
	private String pimgpath;
	private String pprice;
	private String pbrand;			/*商品品牌*/
	private String pdescript;
	private Date createtime;
	private String pweight;
	private String pbzq;
	private String pvalume;
	private String feature;
	private int ispromotion;
	private String promotionprice;		/*商品的促销价格*/
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
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getPweight() {
		return pweight;
	}
	public void setPweight(String pweight) {
		this.pweight = pweight;
	}
	public String getPbzq() {
		return pbzq;
	}
	public void setPbzq(String pbzq) {
		this.pbzq = pbzq;
	}
	public String getPvalume() {
		return pvalume;
	}
	public void setPvalume(String pvalume) {
		this.pvalume = pvalume;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public int getPversion() {
		return pversion;
	}
	public void setPversion(int pversion) {
		this.pversion = pversion;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPcategoryid() {
		return pcategoryid;
	}
	public void setPcategoryid(int pcategoryid) {
		this.pcategoryid = pcategoryid;
	}
	public String getPimgpath() {
		return pimgpath;
	}
	public void setPimgpath(String pimgpath) {
		this.pimgpath = pimgpath;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getPbrand() {
		return pbrand;
	}
	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}
	public String getPdescript() {
		return pdescript;
	}
	public void setPdescript(String pdescript) {
		this.pdescript = pdescript;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
