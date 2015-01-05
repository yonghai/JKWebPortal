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
	public String[] sendMessage(String receiver,String token) throws IOException{
		String returninfo = "";
		HttpClient client = new HttpClient();
		PostMethod post=null;
		String code = IDGenertor.randomCode();
		tpl_value = URLDecoder.decode("#code#="+code,"utf-8");
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

	public void sendMsg(String receiver, String message) throws IOException{
		String returninfo = "";
		HttpClient client = new HttpClient();
		PostMethod post=null;
		tpl_value = URLDecoder.decode("#code#="+message,"utf-8");
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
		SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
		try {
			 m.sendMsg("15201351248","您有一条新的订单，已超过五分钟，请快速处理!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
