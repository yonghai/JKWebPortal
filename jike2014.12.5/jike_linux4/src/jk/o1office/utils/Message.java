package jk.o1office.utils;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.log4j.Logger;

public class Message {
	private Logger logger = Logger.getLogger("jk.o1office.utils.Message");
	private String Uid=null;
	private String pw=null;
	/**
	 * 构造方法
	 * @param Uid 第三方运营商的用户名
	 * @param pw 第三方运营商的密码
	 */
	public Message(String Uid,String pw){
		this.Uid=Uid;
		this.pw=pw;
	}
	/**
	 * 发送短信
	 * @param receiver 接收短信人的手机号码
	 * @param messageText 发送的短信内容
	 * @throws IOException 
	 * @throws Exception 如果无法正常发送短信（指在发送过程中出现异常，而不是发送了但没有收到的情况），则抛出此异常
	 */
	public String[] sendMessage(String receiver,String token) throws IOException{
		HttpClient client = new HttpClient();
		PostMethod post=null;
		String checkcode = IDGenertor.randomCode();
		String messageText = "您的验证码是"+checkcode;
		String returninfo = "";
		try{
			//设置短信发送所需的权限验证信息
			//http://utf8.sms.webchinese.cn/?Uid=本站用户名&Key=
			logger.info("post");
			post = new PostMethod("http://utf8.sms.webchinese.cn"); 
			post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");//在头文件中设置转码
			NameValuePair[] data ={ new NameValuePair("Uid", Uid),new NameValuePair("Key", pw),new NameValuePair("smsMob",receiver),new NameValuePair("smsText",messageText)};
			logger.info("setRequestBody");
			post.setRequestBody(data);
			//执行发送
			logger.info("executeMethod");
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			logger.info("statusCode:"+statusCode);
			for(Header h : headers)
			{
				logger.info(h.toString()+"---");
			}
			//获取发送状态码
			int result = Integer.parseInt(new String(post.getResponseBodyAsString().getBytes("utf8")));
			logger.info("result="+result);
			/*if(result==-1 ){
			//	throw new MsmException("没有该用户账户,用户名称："+Uid);
			}else if(result==-2){
			//	throw new MsmException("密钥不正确");
			}else if(result==-3){
			//	throw new MsmException("短信数量不足");
			}else if(result==-11){
			//	throw new MsmException("该用户被禁用,用户名称："+Uid);
			}else if(result==-14){
			//	throw new MsmException("短信内容出现非法字符，短信内容："+messageText);
			}else if(result==-4){
			//	throw new MsmException("手机号格式不正确，手机号码："+receiver);
			}else if(result==-41){
			//	throw new MsmException("手机号码为空");
			}else if(result==-42){
			//	throw new MsmException("短信内容为空");
			}else if(result==-51){
			//	throw new MsmException("短信签名格式不正确（此签名应该登陆中国网建SMS短信通进行设置）");
			}else if(result<=0){
			//	throw new MsmException("无法确定异常类型，短信服务商返回代码："+result);
			}*/
			if(result>0){
				returninfo = "{\"checkcode\":\""+checkcode+"\",\"success\":true,\"emsg\":\"获取验证码成功\",\"token\":\""+token+"\"}";
			}else{
				returninfo = "{\"success\":false,\"emsg\":\"获取验证码失败\",\"token\":\""+token+"\"}";
			}
		}catch(IOException e){
			returninfo = "{\"success\":false,\"emsg\":\"获取验证码失败\",\"token\":\""+token+"\"}";
			throw e;
		}finally{
			if(post!=null)
				post.releaseConnection();
		}
		return new String[]{returninfo,checkcode};
	}

	public static void main(String[] args){
		Message m=new Message("lanbao_JG","830e2cad7d3f560ca241");
		try {
			m.sendMessage("15201351249","");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
