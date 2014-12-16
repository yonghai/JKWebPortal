package jk.o1office.ht.domin;

import java.util.Date;

/**
 * 普通用户
 */
public class CommonUser extends User {
	private String nickname;
	private int status;				/*是否激活*/
	private String email;			/*邮箱*/
	private String qq;				/*qq*/
	private String address;			/*地址*/
	private int sex;				/*性别(1男)*/
	private Date createtime;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}		
}
