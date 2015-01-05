package jk.o1office.ht.domin;

import java.util.HashSet;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class LoginInfo {
	private String adminName;
	private int id;
	private String loginIP;
	private String loginTime;
	private String logoutTime;
	private Set<URLInfo> urlsinfo = new HashSet<URLInfo>();

	public String getAdminName() {
		return adminName;
	}

	public int getId() {
		return id;
	}

	public String getLoginIP() {
		return loginIP;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public String getLogoutTime() {
		return logoutTime;
	}

	public Set<URLInfo> getUrlsinfo() {
		return urlsinfo;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}

	public void setUrlsinfo(Set<URLInfo> urlsinfo) {
		this.urlsinfo = urlsinfo;
	}
}
