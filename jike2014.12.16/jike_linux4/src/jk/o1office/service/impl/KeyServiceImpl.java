package jk.o1office.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.KeyDao;
import jk.o1office.domin.Key;
import jk.o1office.excetion.TokenException;
import jk.o1office.service.KeyService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;
import jk.o1office.utils.XmlHandler;

public class KeyServiceImpl implements KeyService{
	private KeyDao keyDao;
	public KeyDao getKeyDao() {
		return keyDao;
	}
	public void setKeyDao(KeyDao keyDao) {
		this.keyDao = keyDao;
	}
	
	public void saveOrUpdate(String keyword, int userid) {
		keyDao.saveOrUpdate(keyword,userid);
	}
	
	@SuppressWarnings("unchecked")
	public String getKeyList(String token) throws TokenException,Exception {
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "你的关键字");
		map.put("token", token);
		List<String> defaultkeys = new XmlHandler("/jike/xml/defaultkeys.xml").getKeys();
		if(!token.equals
				("")){
			List<String> keys = keyDao.getKeyList(IDGenertor.getUserID(token)); 
			if(keys.size()>0){
				if(keys.size()==15)
					map.put("data", keys);
				else{
					//删除defaults中数据库中存在的关键词
					int len = defaultkeys.size();
					for(String key : keys){
						if(defaultkeys.contains(key)){
							defaultkeys.remove(key);
						}
					}
					int n = len-keys.size()-1;
					for(int i=defaultkeys.size()-1;i>n;i--){
						defaultkeys.remove(i);
					}
					keys.addAll(defaultkeys);
					map.put("data", keys);
				}
			}else{
				map.put("data", defaultkeys);
			}
			return JsonHandler.MapToJson(map);
		}else{
			map.put("data", defaultkeys);
			return JsonHandler.MapToJson(map);
		}
	}
	
	public static void main(String[] args) {
		List<String> keys = new ArrayList<String>();
		keys.add("1");
		keys.add("2");
		keys.add("22");
		keys.add("55");
		List<String> defaultkeys = new ArrayList<String>();
		defaultkeys.add("11");
		defaultkeys.add("22");
		defaultkeys.add("33");
		defaultkeys.add("44");
		defaultkeys.add("55");
		int len = defaultkeys.size();
		for(String key : keys){
			if(defaultkeys.contains(key)){
				defaultkeys.remove(key);
				System.out.println(defaultkeys);
			}
		}
		System.out.println(defaultkeys.size());
		int n = len-keys.size()-1;
		for(int i=defaultkeys.size()-1;i>n;i--){
			defaultkeys.remove(i);
		}
		keys.addAll(defaultkeys);
		System.out.println(keys);
	}
}
