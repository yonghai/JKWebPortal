package jk.o1office.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import jk.o1office.domin.OrderDetail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

public class JsonHandler {
	public static String MapToJson(Map map){
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(java.util.Date.class,new JsonValueProcessor() {
			  private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
				  System.out.println(key+"  "+value);
				  return  value == null ?"" : sd.format(value);
			  }
			  public Object processArrayValue(Object value, JsonConfig jsonConfig) {
			    return null;
			  }
		});
		
		jc.setExcludes(new String[]{});

		return JSONObject.fromObject(map,jc).toString();
	}
	
	public static String MapToJson1(Map map){
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(java.util.Date.class,new JsonValueProcessor() {
			  private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  private SimpleDateFormat sd1 = new SimpleDateFormat("HH-mm-ss");
			  public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
				  System.out.println(key+"  "+value);
				  if(key.equals("changetime") || key.equals("createtime"))
					  return  value == null ?"" : sd.format(value);
				  else
					  return  value == null ?"" : sd1.format(value);
			  }
			  public Object processArrayValue(Object value, JsonConfig jsonConfig) {
			    return null;
			  }
		});
		
		jc.setExcludes(new String[]{});

		return JSONObject.fromObject(map,jc).toString();
	}
	
	public static String ObjectToJson(Object o,String[] excludes){
		JsonConfig jc = new JsonConfig();
		jc.setExcludes(excludes);
		return JSONArray.fromObject(o,jc).toString();
	}
	
	public static JSONArray ObjectToJSONArray(Object o,String[] excludes){
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(java.util.Date.class,new JsonValueProcessor() {
			  private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
			    return  value == null ?"" : sd.format(value);
			  }
			  public Object processArrayValue(Object value, JsonConfig jsonConfig) {
			    return null;
			  }
		});
		jc.setExcludes(excludes);
		return JSONArray.fromObject(o,jc);
	}
	
	public static List JsonToList(String json){
	 	List list = new ArrayList();
		JSONArray ja = JSONArray.fromObject(json);
		for(int i=0;i<ja.size();i++){
			JSONObject jo = (JSONObject)ja.get(i);
			JsonConfig jsonconfig = new JsonConfig();
			jsonconfig.setExcludes(new String[]{"id,","createtime"});
			OrderDetail o = (OrderDetail)JSONObject.toBean(jo, new OrderDetail(),jsonconfig);
			list.add(o);
		}
		return list;
	}
	

	public static List IOSJsonToList(String json){
		json = json.replace("\\", "")
		.replace("\"{", "{")
		.replace("}\"", "}");
	 	List list = new ArrayList();
		JSONArray ja = JSONArray.fromObject(json);
		for(int i=0;i<ja.size();i++){
			JSONObject jo = (JSONObject)ja.get(i);
			JsonConfig jsonconfig = new JsonConfig();
			jsonconfig.setExcludes(new String[]{"id,","createtime"});
			OrderDetail o = (OrderDetail)JSONObject.toBean(jo, new OrderDetail(),jsonconfig);
			list.add(o);
		}
		return list;
	}
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String str = s.nextLine();
		str = str.replace("\\", "")
		.replace("\"{", "{")
		.replace("}\"", "}");
		System.out.println(str);
	}
}
