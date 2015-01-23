package jk.o1office.filter;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import jk.o1office.cache.OrderCache;
import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.dao.OrderDao;
import jk.o1office.domin.AllOrderInfo;
import net.sf.ehcache.CacheManager;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ContextListener implements ServletContextListener{

	@SuppressWarnings("unchecked")
	public void contextDestroyed(ServletContextEvent sce) {
		List<CacheManager> knownCacheManagers = CacheManager.ALL_CACHE_MANAGERS;
	        while (!knownCacheManagers.isEmpty()) {
	            // 关闭的时候 刷到磁盘
	        	List<CacheManager> cacheManagers = CacheManager.ALL_CACHE_MANAGERS;
	        	for(CacheManager cacheManager : cacheManagers){
	        		cacheManager.shutdown();
	        	}
	        }
	}

	public void contextInitialized(ServletContextEvent sce) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		OrderDao orderDao = (OrderDao) ctx.getBean("orderDao");
		List<AllOrderInfo> allOrderInfos = orderDao.getAllOrderInfo(0);
		for(AllOrderInfo allOrderInfo : allOrderInfos){
			OrderCache orderCache = new OrderCache(null, allOrderInfo.getCreatetime());
			OrderCacheUtil.put(allOrderInfo.getOrderid(), orderCache);
		}
	}

}
