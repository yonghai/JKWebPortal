package jk.o1office.mail;

/** 
 * @author 作者: wangqm
 * @version 创建时间：2014-1-10 上午15:22:20 
 * @description 说明：Mail类实例，此处需要注意的地方有
 * 1.邮件服务器地址可能会变更，如qq的邮件服务器地址原来为mail.qq.com,现为：smtp.exmail.qq.com
 * 2.任何一个程序都可以从外部调用，使用例子为：
 * public boolean sendEmail(String destination,String affix,String mailBody,String subject,String copyTo) throws  AddressException, MessagingException{
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
 */
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mail {
	//要发送的email对象
    public MimeMessage mimeMsg;
    private Session session;
    private Properties props;
    private boolean needAuth=true;

    //存放邮件的title 内容和附件
    private Multipart multipart;

    /**
     * 设置邮件服务器地址
     * @param hostName smtp邮件服务器地址
     */
    public void setSmtpHost(String hostName){
        if(props==null){
            props=System.getProperties();
        }
        props.put("mail.smtp.host",hostName);
    }
    /**
     * 创建邮件对象
     * @throws MessagingException 如果在创建邮件对象的时候失败，则抛出此异常，有可能是无法初始化会话。
     */
    public void createMimeMessage() throws MessagingException{
		try{
			session=Session.getInstance(props,null); 
			mimeMsg=new MimeMessage(session);
			multipart=new MimeMultipart();
		}catch(Exception e){
			throw new MessagingException("创建邮件对象失败");
		}
    }
    /**
     * 是否需要授权
     * @param need 是否需要授权
     */
    public void setNeedAuth(boolean need){
        if(props==null){
            props=System.getProperties();
        }
        if(need){
            props.put("mail.smtp.auth","true");
        }else{
            props.put("mail.smtp.auth","false");
        }
    }
    /**
     * 设置邮件标题
     * @param mailSubject 邮件标题
     * @throws MessagingException 在设置邮件标题的时候抛出此异常
     */
    public void setSubject(String mailSubject) throws MessagingException{
		if(!mailSubject.equals("")&&mailSubject!=null)
			mimeMsg.setSubject(mailSubject);	       
    }
    /**
     * 添加附件，不同的附件以分号（;）进行分割
     * @param filename 附件对应的本地地址
     * @throws MessagingException 如果在设置（上传）附件的时候，抛出此异常
     */
    public void addFileAffix(String filename) throws MessagingException{     
        if(filename==null||filename.equals("")){
            return;
        }
        String file[];
        file=filename.split(";");
        for(int i=0;i<file.length;i++){
            BodyPart bp=new MimeBodyPart();
            FileDataSource fileds=new FileDataSource(file[i]);
            bp.setDataHandler(new DataHandler(fileds));
            bp.setFileName(fileds.getName());
            multipart.addBodyPart(bp);
         }  
   }
    /**
     * 设置发送人的源邮件地址
     * @param from 发送人的邮件地址
     * @throws MessagingException 无法设置发送人地址的时候抛出此异常
     * @throws AddressException 地址不正确的时候抛出此异常
     */
    public void setFrom(String from) throws AddressException, MessagingException{
    	mimeMsg.setFrom(new InternetAddress(from));
    }
    /**
     * 设置发送目标邮件地址
     * @param to 发送目标邮件地址
     * @throws MessagingException 无法设置发送目标地址的时候抛出此异常
     * @throws AddressException 地址不正确的时候抛出此异常
     */
    public void setTo(String to) throws AddressException, MessagingException, MessagingException{
        if(to==null||to.equals("")){
            throw new MessagingException("没有设置发送目标邮件地址");
        }
        mimeMsg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
    }
    /***
     * 设置抄送，涉及到多个抄送地址的时候，用分号（；）分割
     * @param copyto 抄送人邮件地址
     * @throws MessagingException 无法设置抄送地址的时候抛出此异常
     * @throws AddressException 地址不 正确的时候抛出此异常
     */
    public void setCopyTo(String copyto) throws AddressException, MessagingException{
        if(copyto==null||copyto.equals("")){
            return;
        }
		String copy[];
		copy=copyto.split(";");
		for(int i=0;i<copy.length;i++){
		    mimeMsg.addRecipients(Message.RecipientType.TO,(Address[])InternetAddress.parse(copy[i]));
		}
    }   
    /**
     * 设置邮件的正文的内容
     * @param mailBody 邮件的正文内容
     * @throws MessagingException 无法设置邮件正文内容的时候抛出异常
     */
    public void setBody(String mailBody) throws MessagingException{
        BodyPart bp=new MimeBodyPart();
        bp.setContent("<meta http-equiv=Context-Type context=text/html;charset=gb2312>"+mailBody,"text/html;charset=GB2312");
        multipart.addBodyPart(bp);
    }
    /**
     * 如果此邮件是一个内嵌网页的邮件，则在此设置网络地址url
     * @param htmlpath 内嵌的网页的地址url
     * @throws MessagingException 无法设置邮件为内嵌网页内容的时候抛出此异常，可能是由于远程网页不存在或者邮件对象有问题
     */
    public void setHtml(String htmlpath) throws MessagingException{
		if(!htmlpath.equals("")||htmlpath!=null){
			BodyPart mbp=new MimeBodyPart();
			DataSource ds=new FileDataSource(htmlpath);
			mbp.setDataHandler(new DataHandler(ds));
			mbp.setHeader("Context-ID","meme");
			multipart.addBodyPart(mbp);
		}
	         
	 }
    /**
     * 发送邮件
     * @param mailAddr 源邮件地址（发送人）
     * @param password 源邮件地址对应的邮箱密码
     * @return 是否发送成功
     */
     public boolean sendOut(String mailAddr,String password){
    	 Transport tp=null;
         try{
             mimeMsg.setContent(multipart);
             mimeMsg.saveChanges();
             System.out.println("正在SendMail.");
             Authenticator auth = new MailAuthenticator(mailAddr,password); // 进行邮件服务器用户认证
             Session mailSession=session.getInstance(props,auth);
             tp=mailSession.getTransport("smtp");
             tp.connect((String)props.getProperty("mail.smtp.host"),mailAddr,password);
             tp.sendMessage(mimeMsg,mimeMsg.getRecipients(Message.RecipientType.TO));
             System.out.println("Send Mail 成功..");        
             return true;
         }catch(Exception e){
        	 e.printStackTrace();
             return false;
         }finally{
        	    try {
					tp.close();
				} catch (MessagingException e) {
					e.printStackTrace();
				}
         }
     }
       
}