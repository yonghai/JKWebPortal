package jk.o1office.ht.domin;

public class ProductCategory {
	private int id;
	private String categoryname;
	private String categoryimg;
	private int level;
	private int pid;
	private String descript;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getCategoryimg() {
		return categoryimg;
	}
	public void setCategoryimg(String categoryimg) {
		this.categoryimg = categoryimg;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
}
