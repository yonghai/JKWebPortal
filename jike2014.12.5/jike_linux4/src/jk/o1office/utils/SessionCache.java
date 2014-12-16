package jk.o1office.utils;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class SessionCache {
	private CacheManager cacheManager;
	private Cache cache;
	public CacheManager getCacheManager() {
		return cacheManager;
	}
	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
		cache = cacheManager.getCache("sessionCache");
	}
	
	public SessionCache() {
	}

	public void setAttr(String key,Object value){
		Element element = new Element(key, value);
		cache.put(element);
	}
	
	public Object getAttr(String key) throws NullPointerException{
		Element ele = cache.get(key);
		if(null==ele)
			throw new NullPointerException();
		else
			return ele.getValue();
	}
	
	public void removeAttr(String key){
		cache.remove(key);
	}
}
