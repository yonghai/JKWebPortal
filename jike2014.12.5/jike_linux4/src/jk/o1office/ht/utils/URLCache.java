package jk.o1office.ht.utils;

import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.finals.Constant;

import org.dom4j.DocumentException;

public class URLCache {
	private static URLCache urlCache = new URLCache();
	private URLCache() {
	}
	
	public static URLCache newInstance(){
		return urlCache;
	}
	
	/**
	 * 可能会存在并发访问
	 * @param cachename
	 */
	public synchronized void createCache(String cachename){
		if(Constant.xmls.get(cachename)==null){
			XMLHandler xml = new XMLHandler(cachename);
			Constant.xmls.put(cachename, xml);
		}
	}
	
	public synchronized void setAttr(String key,Object value, String cacheName){
		Constant.xmls.get(cacheName).setAttr(key, value);
	}
	
	public void flush(String name){
		String wname = Constant.xmls.get(name).getRootPath()+
		name+Constant.xmls.get(name).getLateName();
		try {
			Constant.xmls.get(name).write(wname);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeCache(String cacheName){
		String wcacheName = Constant.xmls.get(cacheName).getRootPath()+
		cacheName+Constant.xmls.get(cacheName).getLateName();
		Constant.xmls.get(cacheName).remove(wcacheName);
		Constant.xmls.remove(cacheName);
	}
	
	public LoginInfo getCacheInfo(String name) throws DocumentException{
		String wname = Constant.xmls.get(name).getRootPath()+
		name+Constant.xmls.get(name).getLateName();
		if(Constant.xmls.get(name).exists(wname)){
			return Constant.xmls.get(name).getLoginInfo(wname);
		}
		return null;
	}
	
	public static void main(String[] args) {
		
	}
	
}
