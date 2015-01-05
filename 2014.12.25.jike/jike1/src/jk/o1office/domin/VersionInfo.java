package jk.o1office.domin;
import java.util.Date;

/**
 * 版本信息
 */
public class VersionInfo {
	private int id;
	private String area_ver;
	private String category_ver;
	private String role;
	private String soft_ver;
	private String lowprice;
	private Date starttime; /* 开始的配送时间 */
	private Date endtime; /* 结束的配送时间 */
	private Date changetime;
	private String deliveryprice;
	private String deliveryrange;
	private int deliverytimer;
	private String ipurl;
	private String ipstart;
	private String ipend;
	public String getIpurl() {
		return ipurl;
	}
	public void setIpurl(String ipurl) {
		this.ipurl = ipurl;
	}
	public String getIpstart() {
		return ipstart;
	}
	public void setIpstart(String ipstart) {
		this.ipstart = ipstart;
	}
	public String getIpend() {
		return ipend;
	}
	public void setIpend(String ipend) {
		this.ipend = ipend;
	}
	public int getDeliverytimer() {
		return deliverytimer;
	}
	public void setDeliverytimer(int deliverytimer) {
		this.deliverytimer = deliverytimer;
	}
	public String getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(String deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getDeliveryrange() {
		return deliveryrange;
	}
	public void setDeliveryrange(String deliveryrange) {
		this.deliveryrange = deliveryrange;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArea_ver() {
		return area_ver;
	}
	public void setArea_ver(String areaVer) {
		area_ver = areaVer;
	}
	public String getCategory_ver() {
		return category_ver;
	}
	public void setCategory_ver(String categoryVer) {
		category_ver = categoryVer;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSoft_ver() {
		return soft_ver;
	}
	public void setSoft_ver(String softVer) {
		soft_ver = softVer;
	}
	public String getLowprice() {
		return lowprice;
	}
	public void setLowprice(String lowprice) {
		this.lowprice = lowprice;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Date getChangetime() {
		return changetime;
	}
	public void setChangetime(Date changetime) {
		this.changetime = changetime;
	}
}
