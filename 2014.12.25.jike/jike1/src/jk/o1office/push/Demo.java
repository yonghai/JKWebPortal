package jk.o1office.push;

import java.util.List;

import jk.o1office.push.android.AndroidBroadcast;
import jk.o1office.push.android.AndroidCustomizedcast;
import jk.o1office.push.android.AndroidFilecast;
import jk.o1office.push.android.AndroidGroupcast;
import jk.o1office.push.android.AndroidUnicast;
import jk.o1office.push.ios.IOSBroadcast;
import jk.o1office.push.ios.IOSCustomizedcast;
import jk.o1office.push.ios.IOSFilecast;
import jk.o1office.push.ios.IOSGroupcast;
import jk.o1office.push.ios.IOSUnicast;
import jk.o1office.utils.DateUtil;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

public class Demo<T> {
	private String appkey = null;
	private String masterSecret = null;
	private String timestamp = null;
	private String validationToken = null;
	private String device_tokens = null;
	private Logger logger = Logger.getLogger("Demo");
	public Demo(String key, String secret, String device_tokens) {
		try {
			appkey = key;
			masterSecret = secret;
			this.device_tokens = device_tokens;
			timestamp = Integer.toString((int)(System.currentTimeMillis() / 1000));
			// Generate MD5 of appkey, masterSecret and timestamp as validation_token
			validationToken = DigestUtils.md5Hex(appkey.toLowerCase() + masterSecret.toLowerCase() + timestamp);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
	
	public Demo(String key, String secret) {
		this(key,secret,"");
	}

	public void sendAndroidBroadcast() throws Exception {
		AndroidBroadcast broadcast = new AndroidBroadcast();
		broadcast.setPredefinedKeyValue("appkey", this.appkey);
		broadcast.setPredefinedKeyValue("timestamp", this.timestamp);
		broadcast.setPredefinedKeyValue("validation_token", this.validationToken);
		broadcast.setPredefinedKeyValue("ticker", "Android broadcast ticker");
		broadcast.setPredefinedKeyValue("title",  "中文的title");
		broadcast.setPredefinedKeyValue("text",   "Android broadcast text");
		broadcast.setPredefinedKeyValue("after_open", "go_app");
		broadcast.setPredefinedKeyValue("display_type", "notification");
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		broadcast.setPredefinedKeyValue("production_mode", "true");
		// Set customized fields
		broadcast.setExtraField("test", "helloworld");
		broadcast.send();
	}
	
	public String sendAndroidUnicast() throws Exception {
		AndroidUnicast unicast = new AndroidUnicast();
		unicast.setPredefinedKeyValue("appkey", this.appkey);
		unicast.setPredefinedKeyValue("timestamp", this.timestamp);
		unicast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO Set your device token
		unicast.setPredefinedKeyValue("device_tokens", device_tokens);
		unicast.setPredefinedKeyValue("ticker", "您有新的订单");
		unicast.setPredefinedKeyValue("title",  "jikesoon");
		unicast.setPredefinedKeyValue("text",   "您有新的订单");
		unicast.setPredefinedKeyValue("after_open", "go_app");
		unicast.setPredefinedKeyValue("display_type", "notification");
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		unicast.setPredefinedKeyValue("production_mode", "true");
		// Set customized fields
		unicast.setExtraField("test", "helloworld");
		return unicast.send();
	}
	
	public String sendAndroidGroupcast(List<T> tags) throws Exception {
		AndroidGroupcast groupcast = new AndroidGroupcast();
		groupcast.setPredefinedKeyValue("appkey", this.appkey);
		groupcast.setPredefinedKeyValue("timestamp", this.timestamp);
		groupcast.setPredefinedKeyValue("validation_token", this.validationToken);
		/*  TODO
		 *  Construct the filter condition:
		 *  "where": 
		 *	{
    	 *		"and": 
    	 *		[
      	 *			{"tag":"test"},
      	 *			{"tag":"Test"}
    	 *		]
		 *	}
		 */
		JSONObject filterJson = new JSONObject();
		JSONObject whereJson = new JSONObject();
		JSONArray tagArray = new JSONArray();
		for(Object t : tags){
			JSONObject tag = new JSONObject();
			tag.put("tag", t+"");
			tagArray.put(tag);
		}
		whereJson.put("or", tagArray);
		filterJson.put("where", whereJson);
		System.out.println(filterJson.toString());
		
		groupcast.setPredefinedKeyValue("filter", filterJson);
		groupcast.setPredefinedKeyValue("ticker", "您有新的订单，请立即查收！");
		groupcast.setPredefinedKeyValue("title",  "即客送");
		groupcast.setPredefinedKeyValue("text",   "您有新的订单，请立即查收！");
		groupcast.setPredefinedKeyValue("after_open", "go_activity");
		groupcast.setPredefinedKeyValue("activity", "com.jike.module.task.Activity_TaskOne");
		groupcast.setPredefinedKeyValue("display_type", "notification");
		groupcast.setPredefinedKeyValue("sound",  "test");
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		groupcast.setPredefinedKeyValue("production_mode", "true");
		return groupcast.send();
	}
	
	public String sendAndroidGroupcast() throws Exception {
		logger.info("sendAndroidGroupcast");
		AndroidGroupcast groupcast = new AndroidGroupcast();
		groupcast.setPredefinedKeyValue("appkey", this.appkey);
		groupcast.setPredefinedKeyValue("timestamp", this.timestamp);
		groupcast.setPredefinedKeyValue("validation_token", this.validationToken);
		/*  TODO
		 *  Construct the filter condition:
		 *  "where": 
		 *	{
    	 *		"and": 
    	 *		[
      	 *			{"tag":"test"},
      	 *			{"tag":"Test"}
    	 *		]
		 *	}
		 */
		JSONObject filterJson = new JSONObject();
		JSONObject whereJson = new JSONObject();
		JSONArray tagArray = new JSONArray();
		JSONObject tag = new JSONObject();
		tag.put("tag", "login");
		tagArray.put(tag);
		whereJson.put("and", tagArray);
		filterJson.put("where", whereJson);
		logger.info("mylog = "+filterJson.toString());
		
		groupcast.setPredefinedKeyValue("filter", filterJson);
		groupcast.setPredefinedKeyValue("ticker", "您有新的订单，请立即查收！");
		groupcast.setPredefinedKeyValue("title",  "即客送");
		groupcast.setPredefinedKeyValue("text",   "您有新的订单，请立即查收！");
		groupcast.setPredefinedKeyValue("after_open", "go_activity");
		groupcast.setPredefinedKeyValue("activity", "com.jike.module.task.Activity_TaskOne");
		groupcast.setPredefinedKeyValue("display_type", "notification");
		groupcast.setPredefinedKeyValue("sound",  "test");
		logger.info("expire_time");
		String expire_time = DateUtil.addDate(1000*60*10L);
		logger.info(expire_time);
		groupcast.setPredefinedKeyValue("expire_time",  expire_time);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		groupcast.setPredefinedKeyValue("production_mode", "true");
		return groupcast.send();
	}

	
	public void sendAndroidCustomizedcast() throws Exception {
		AndroidCustomizedcast customizedcast = new AndroidCustomizedcast();
		customizedcast.setPredefinedKeyValue("appkey", this.appkey);
		customizedcast.setPredefinedKeyValue("timestamp", this.timestamp);
		customizedcast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO Set your alias here, and use comma to split them if there are multiple alias.
		// And if you have many alias, you can also upload a file containing these alias, then 
		// use file_id to send customized notification.
		customizedcast.setPredefinedKeyValue("alias", "xx");
		// TODO Set your alias_type here
		customizedcast.setPredefinedKeyValue("alias_type", "xx");
		customizedcast.setPredefinedKeyValue("ticker", "您有新的订单");
		customizedcast.setPredefinedKeyValue("title", "jikesoon");
		customizedcast.setPredefinedKeyValue("text", "您有新的订单");
		customizedcast.setPredefinedKeyValue("after_open", "go_app");
		customizedcast.setPredefinedKeyValue("display_type", "notification");
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		customizedcast.setPredefinedKeyValue("production_mode", "true");
		customizedcast.send();
	}
	
	public void sendAndroidFilecast() throws Exception {
		AndroidFilecast filecast = new AndroidFilecast();
		filecast.setPredefinedKeyValue("appkey", this.appkey);
		filecast.setPredefinedKeyValue("timestamp", this.timestamp);
		filecast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO upload your device tokens, and use '\n' to split them if there are multiple tokens 
		filecast.uploadContents("aa"+"\n"+"bb");
		filecast.setPredefinedKeyValue("ticker", "Android filecast ticker");
		filecast.setPredefinedKeyValue("title",  "中文的title");
		filecast.setPredefinedKeyValue("text",   "Android filecast text");
		filecast.setPredefinedKeyValue("after_open", "go_app");
		filecast.setPredefinedKeyValue("display_type", "notification");
		filecast.send();
	}
	
	public void sendIOSBroadcast() throws Exception {
		IOSBroadcast broadcast = new IOSBroadcast();
		broadcast.setPredefinedKeyValue("appkey", this.appkey);
		broadcast.setPredefinedKeyValue("timestamp", this.timestamp);
		broadcast.setPredefinedKeyValue("validation_token", this.validationToken);
		broadcast.setPredefinedKeyValue("alert", "IOS 广播测试");
		broadcast.setPredefinedKeyValue("badge", 0);
		broadcast.setPredefinedKeyValue("sound", "chime");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		broadcast.setPredefinedKeyValue("production_mode", "false");
		// Set customized fields
		broadcast.setCustomizedField("test", "helloworld");
		broadcast.send();
	}
	
	public void sendIOSUnicast() throws Exception {
		IOSUnicast unicast = new IOSUnicast();
		unicast.setPredefinedKeyValue("appkey", this.appkey);
		unicast.setPredefinedKeyValue("timestamp", this.timestamp);
		unicast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO Set your device token
		unicast.setPredefinedKeyValue("device_tokens", "xx");
		unicast.setPredefinedKeyValue("alert", "IOS 单播测试");
		unicast.setPredefinedKeyValue("badge", 0);
		unicast.setPredefinedKeyValue("sound", "chime");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		unicast.setPredefinedKeyValue("production_mode", "false");
		// Set customized fields
		unicast.setCustomizedField("test", "helloworld");
		unicast.send();
	}
	
	public void sendIOSGroupcast() throws Exception {
		IOSGroupcast groupcast = new IOSGroupcast();
		groupcast.setPredefinedKeyValue("appkey", this.appkey);
		groupcast.setPredefinedKeyValue("timestamp", this.timestamp);
		groupcast.setPredefinedKeyValue("validation_token", this.validationToken);
		/*  TODO
		 *  Construct the filter condition:
		 *  "where": 
		 *	{
    	 *		"and": 
    	 *		[
      	 *			{"tag":"iostest"}
    	 *		]
		 *	}
		 */
		JSONObject filterJson = new JSONObject();
		JSONObject whereJson = new JSONObject();
		JSONArray tagArray = new JSONArray();
		JSONObject testTag = new JSONObject();
		testTag.put("tag", "iostest");
		tagArray.put(testTag);
		whereJson.put("and", tagArray);
		filterJson.put("where", whereJson);
		System.out.println(filterJson.toString());
		
		// Set filter condition into rootJson
		groupcast.setPredefinedKeyValue("filter", filterJson);
		groupcast.setPredefinedKeyValue("alert", "IOS 组播测试");
		groupcast.setPredefinedKeyValue("badge", 0);
		groupcast.setPredefinedKeyValue("sound", "chime");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		groupcast.setPredefinedKeyValue("production_mode", "false");
		groupcast.send();
	}
	
	public void sendIOSCustomizedcast() throws Exception {
		IOSCustomizedcast customizedcast = new IOSCustomizedcast();
		customizedcast.setPredefinedKeyValue("appkey", this.appkey);
		customizedcast.setPredefinedKeyValue("timestamp", this.timestamp);
		customizedcast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO Set your alias here, and use comma to split them if there are multiple alias.
		// And if you have many alias, you can also upload a file containing these alias, then 
		// use file_id to send customized notification.
		customizedcast.setPredefinedKeyValue("alias", "xx");
		// TODO Set your alias_type here
		customizedcast.setPredefinedKeyValue("alias_type", "xx");
		customizedcast.setPredefinedKeyValue("alert", "IOS 个性化测试");
		customizedcast.setPredefinedKeyValue("badge", 0);
		customizedcast.setPredefinedKeyValue("sound", "chime");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		customizedcast.setPredefinedKeyValue("production_mode", "false");
		customizedcast.send();
	}
	
	public void sendIOSFilecast() throws Exception {
		IOSFilecast filecast = new IOSFilecast();
		filecast.setPredefinedKeyValue("appkey", this.appkey);
		filecast.setPredefinedKeyValue("timestamp", this.timestamp);
		filecast.setPredefinedKeyValue("validation_token", this.validationToken);
		// TODO upload your device tokens, and use '\n' to split them if there are multiple tokens 
		filecast.uploadContents("aa"+"\n"+"bb");
		filecast.setPredefinedKeyValue("alert", "IOS 文件播测试");
		filecast.setPredefinedKeyValue("badge", 0);
		filecast.setPredefinedKeyValue("sound", "chime");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		filecast.setPredefinedKeyValue("production_mode", "false");
		filecast.send();
	}
	
	public static void main(String[] args) {
		// TODO set your appkey and master secret here
		Demo demo = new Demo("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q", "AlM5ERoCxNKXeQ7eFDlKy2ipbDgWzCqff5yB-RMzWwii");
		try {
			demo.sendAndroidUnicast();
			/* TODO these methods are all available, just fill in some fields and do the test
			 * demo.sendAndroidBroadcast();
			 * demo.sendAndroidGroupcast();
			 * demo.sendAndroidCustomizedcast();
			 * demo.sendAndroidFilecast();
			 * 
			 * demo.sendIOSBroadcast();
			 * demo.sendIOSUnicast();
			 * demo.sendIOSGroupcast();
			 * demo.sendIOSCustomizedcast();
			 * demo.sendIOSFilecast();
			 */
			Object o = "12";
			System.out.println(o.equals("12"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/*
	public boolean check(){
		for(int i=0;i<=10;i++){
			if(i!=10){
				return false;
			}
		}
		return true;
	}*/
	
}
