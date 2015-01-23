package jk.o1office.mail;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

/** 
 * @author 作者: wangqm
 * @version 创建时间：2014-1-10 上午9:20:22 
 * @description 说明：此为MailManager类的使用示例
 */
public class SendMail{
	//发送邮箱的smtp地址
	private final String smtpHost="smtp.exmail.qq.com";//"smtp.gmail.com";
	//发送人的邮箱地址
	private  String from=null;
	//接收人的邮箱地址
	private  String to=null;
	//发送人的邮箱密码
	private  String pw=null;
	//是否需要验证
	private  boolean needAuth=false;
	//邮件标题
	private  String subject=null;
	//邮件内容
	private  String body=null;
	//邮件附件本地地址
	private  String affix=null;

	private Mail sm=null;
	/**
	 * 构造方法，初始化邮件发送地址以及密码
	 * @param mailFromAddr 发送人的邮箱地址
	 * @param mailFromPW 发送人邮箱的密码
	 */
	public SendMail(String mailFromAddr,String mailFromPW){
		this.from=mailFromAddr;
		this.pw=mailFromPW;	
	}
	/**
	 * 初始化发送邮件
	 * @throws MailException 如果在初始化邮件对象的时候失败，则抛出此异常
	 */
	public void init() throws MessagingException{
		sm=new Mail();
		sm.setSmtpHost(smtpHost);//设置邮件服务器地址
		sm.createMimeMessage();//创建邮件对象
	}
	/**
	 * 发送邮件
	 * @param destination 目标邮件地址
	 * @param affix	附件本地地址
	 * @param mailBody 邮件内容
	 * @param subject 邮件标题
	 * @param copyTo 邮件抄送地址
	 * @throws MessagingException 如果在
	 * @throws AddressException
	 * @return 是否发送成功
	 */
	public boolean sendEmail(String destination,String affix,String mailBody,String subject,String copyTo) throws  AddressException, MessagingException{
		if(sm==null){
			init();
		}
		if(from==null||pw==null){
			throw new MessagingException("没有设置发送人的邮箱地址以及邮箱的密码");
		}
		sm.setFrom(from);
		sm.setTo(destination);
		sm.setSubject(subject);
		sm.setBody(mailBody);
		sm.addFileAffix(affix);
		sm.setCopyTo(copyTo);
		return sm.sendOut(from ,pw);	
	}	
	//for test
	public static void main(String[] args){
		try {
			SendMail m=new SendMail("2642626143@qq.com","yanghai");
			boolean isSuccess=m.sendEmail("811067920@qq.com", null, "this is a test", "test mail", "2642626143@qq.com");
			System.out.println(isSuccess);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	
}
