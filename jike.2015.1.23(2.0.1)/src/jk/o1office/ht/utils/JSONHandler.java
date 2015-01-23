package jk.o1office.ht.utils;

import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class JSONHandler {
	
	public static String ArrayToJson(Object o){
		return JSONArray.fromObject(o).toString();
	} 

	public static String ArrayToJson(Object o, String[] excludes){
		JsonConfig config = new JsonConfig();
		config.setExcludes(excludes);
		return JSONArray.fromObject(o,config).toString();
	} 
	
	public static String ObjectToJson(Object o){
		return JSONObject.fromObject(o).toString();
	}
	
	public static String MapToJson(Map map){
		return JSONObject.fromObject(map).toString();
	}
}
