package jk.o1office.utils;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import net.sf.json.JSONObject;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.log4j.Logger;

public class SDKMessage {
	private String key;
	private int tpl_id;
	private String tpl_value;
	private Logger logger = Logger.getLogger(SDKMessage.class);
	/**
	 * 构造方法
	 */
	public SDKMessage(String key,int tpl_id){
		this.key = key;
		this.tpl_id = tpl_id;
	}
	/**
	 * 发送短信
	 * @param receiver 接收短信人的手机号码
	 * @param messageText 发送的短信内容
	 * @throws IOException 
	 * @throws Exception 如果无法正常发送短信（指在发送过程中出现异常，而不是发送了但没有收到的情况），则抛出此异常
	 */
	public String[] sendMessage(String receiver,String token, String param) throws IOException{
		String returninfo = "";
		HttpClient client = new HttpClient();
		PostMethod post=null;
		String code = IDGenertor.randomCode();
		tpl_value = URLDecoder.decode("#"+param+"#="+code,"utf-8");
		try{
			post = new PostMethod("http://v.juhe.cn/sms/send"); 
		//	post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");//在头文件中设置转码
			NameValuePair[] data ={ 
					new NameValuePair("key", key),
					new NameValuePair("dtype","json"),
					new NameValuePair("mobile", receiver),
					new NameValuePair("tpl_id", tpl_id+""),
					new NameValuePair("tpl_value", tpl_value)
					};
			post.setRequestBody(data);
			//执行发送
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			//获取发送状态码
			String s = new String(post.getResponseBodyAsString().getBytes("utf8"));
			System.out.println(s);
			logger.info(s);
			JSONObject jo = JSONObject.fromObject(s);
			if(jo.get("error_code").toString().equals("0")){
				returninfo = "{\"checkcode\":\""+code+"\",\"success\":true,\"emsg\":\"获取验证码成功\",\"token\":\""+token+"\"}";
			}else{
				returninfo = "{\"success\":false,\"emsg\":\"获取验证码失败\",\"token\":\""+token+"\"}";
			}
		}catch(IOException e){
			returninfo = "{\"success\":false,\"emsg\":\"获取验证码失败\",\"token\":\""+token+"\"}";
			throw e;
		}finally{
			if(post!=null)
				post.releaseConnection();
			return new String[]{returninfo,code};
		}
	}

	public void sendMsg(String receiver, String message, String param) throws IOException{
		String returninfo = "";
		HttpClient client = new HttpClient();
		PostMethod post=null;
		tpl_value = URLDecoder.decode("#"+param+"#="+message,"utf-8");
		try{
			post = new PostMethod("http://v.juhe.cn/sms/send"); 
			NameValuePair[] data ={ 
					new NameValuePair("key", key),
					new NameValuePair("dtype", "json"),
					new NameValuePair("mobile", receiver),
					new NameValuePair("tpl_id", tpl_id+""),
					new NameValuePair("tpl_value", tpl_value)
					};
			post.setRequestBody(data);
			//执行发送
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			//获取发送状态码
			String s = new String(post.getResponseBodyAsString().getBytes("utf8"));
			System.out.println(s);
			JSONObject jo = JSONObject.fromObject(s);
			if(jo.get("error_code").toString().equals("0")){
			}
		}catch(IOException e){
			throw e;
		}finally{
			if(post!=null)
				post.releaseConnection();
		}
	}
	
	public static void main(String[] args){
		SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1498);
		try {
			 m.sendMsg1("18913513535","您有","sd","sd","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String s = "#name#=您有&#tel#=sd&#code#=sd";
	}
	
	public void sendMsg1(String tel, String nickname, String telphone,
			String checkcode, String orderid) {
		String returninfo = "";
		HttpClient client = new HttpClient();
		PostMethod post=null;
		try{
		//	tpl_value = URLEncoder.encode("#name#="+nickname+"&#tel#="+telphone+"&#code#="+checkcode,"utf-8");
			tpl_value = "#tel#="+telphone+"&#code#="+checkcode+"&#orderid#="+orderid;	
			post = new PostMethod("http://v.juhe.cn/sms/send"); 
			NameValuePair[] data ={ 
					new NameValuePair("key", key),
					new NameValuePair("dtype", "json"),
					new NameValuePair("mobile", tel),
					new NameValuePair("tpl_id", tpl_id+""),
					new NameValuePair("tpl_value", tpl_value)
					};
			post.setRequestBody(data);
			//执行发送
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			//获取发送状态码
			String s = new String(post.getResponseBodyAsString().getBytes("utf8"));
			System.out.println(s);
			JSONObject jo = JSONObject.fromObject(s);
			if(jo.get("error_code").toString().equals("0")){
			}
		}catch(IOException e){
		}finally{
			if(post!=null)
				post.releaseConnection();
		}
	}
}
