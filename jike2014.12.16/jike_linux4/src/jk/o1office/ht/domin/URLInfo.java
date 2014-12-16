package jk.o1office.ht.domin;


public class URLInfo {
	private int id;
	private String content;
	private String time;
	private int adminlogid;
	public int getAdminlogid() {
		return adminlogid;
	}
	public void setAdminlogid(int adminlogid) {
		this.adminlogid = adminlogid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}