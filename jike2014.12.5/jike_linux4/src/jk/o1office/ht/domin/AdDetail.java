package jk.o1office.ht.domin;

public class AdDetail {
	private int id;
	private int aid;
	private int goodsid;
	private String webaddr;
	private String promotionprice;
	public String getPromotionprice() {
		return promotionprice;
	}
	public void setPromotionprice(String promotionprice) {
		this.promotionprice = promotionprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public String getWebaddr() {
		return webaddr;
	}
	public void setWebaddr(String webaddr) {
		this.webaddr = webaddr;
	}
}
