
package jk.o1office.mail;
 
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
/**
 * @author 作者: wangqm
 * @version 创建时间：2014-1-11 上午9:22:20
 * @description 说明：服务器邮箱登录验证，为了更加安全，所以加一个登陆验证，可以不加
 */
public class MailAuthenticator extends Authenticator {
 
    //用户名（登录邮箱）
    private String username;
    //密码
    private String password;
 
    /**
     * 初始化邮箱和密码
     * @param username 邮箱
     * @param password 密码
     */
    public MailAuthenticator(String username, String password) {
	    this.username = username;
	    this.password = password;
    }
 
    String getPassword() {
    	return password;
    }
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(username, password);
    }
 
    String getUsername() {
    return username;
    }
 
    public void setPassword(String password) {
    this.password = password;
    }
 
    public void setUsername(String username) {
    this.username = username;
    }
 
}