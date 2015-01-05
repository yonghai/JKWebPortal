package test;

import java.io.IOException;

import jk.o1office.utils.IDGenertor;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SDKMessage {
	private String key;
	private int tpl_id;
	private String tpl_value;
	/**
	 * 构造方法
	 * @param Uid 第三方运营商的用户名
	 * @param pw 第三方运营商的密码
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
		tpl_value = "#code#="+code;
		try{
			post = new PostMethod("http://v.juhe.cn/sms/send"); 
			NameValuePair[] data ={ 
					new NameValuePair("key", key),
					new NameValuePair("tpl_id", tpl_id+""),
					new NameValuePair("tpl_value",tpl_value),
					new NameValuePair("mobile",receiver),
					new NameValuePair("dtype","json")
					};
			post.setRequestBody(data);
			//执行发送
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			System.out.println(statusCode);
			//获取发送状态码
			String s = new String(post.getResponseBodyAsString().getBytes("utf8"));
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

	public static void main(String[] args){
		SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1);
		try {
			m.sendMessage("17710171716","");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
