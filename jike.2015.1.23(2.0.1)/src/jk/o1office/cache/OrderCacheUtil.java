package jk.o1office.cache;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import jk.o1office.service.OrderService;
import jk.o1office.service.impl.OrderServiceImpl;
import jk.o1office.utils.DateUtil;
import jk.o1office.utils.SDKMessage;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class OrderCacheUtil {
	public static int SECOND = 1000*70;			//订单超时的时间(耗秒)
	public static int TIMEOUT = 1000*60*5;			//客服处理订单时间
	public static int WARMTIME = 1000*60*5;		//提醒用户的订单时间
	private static CacheManager cacheManager = null;
	private static Cache cache = null;
	private Logger logger = Logger.getLogger("OrderCacheUtil");
	private OrderService orderService;
	public OrderService getOrderService() {
		return orderService;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public OrderCacheUtil() {
		cacheManager = new CacheManager();
		cache = cacheManager.getCache("orderCache");
	}

	public synchronized static void put(String orderid, OrderCache orderCache){
		if(null==cache){
			cacheManager = new CacheManager();
			cache = cacheManager.getCache("orderCache");
		}
		List<String> keys = cache.getKeys();
		Element element = new Element(orderid, orderCache);
		cache.put(element);
		cache.flush();
		/*boolean ishas = true;
		for(String key : keys){
			OrderCache oc = (OrderCache)cache.get(key).getValue();
			if(oc.getShopsIds().containsAll(orderCache.getShopsIds())){
				ishas = false;
				break;
			}
		}
		if(ishas){
			Element element = new Element(orderid, orderCache);
			cache.put(element);
			cache.flush();
		}*/
	}
	
	public synchronized static void remove(String orderid){
		cache.remove(orderid);
		cache.flush();
	}
	
	public List<OrderCache> scanOrder() throws Exception{
		List<OrderCache> ocs = new ArrayList<OrderCache>(); 
		List<String> keys = cache.getKeys();
		logger.info(keys);
		for(String key : keys){
			OrderCache orderCache = (OrderCache)cache.get(key).getValue();
			logger.info(orderCache);
			//未接订单的时间>1分钟时推送消息(1分钟推送一次)
		//	if(DateUtil.subDate(orderCache.getEndtime())>SECOND){
				boolean ishas = true;
				//去除重复的元素
				for(OrderCache oc : ocs){
					if(oc.getShopsIds().containsAll(orderCache.getShopsIds())){
					//	logger.info("ishas = false");
						ishas = false;
					}
				}
				if(ishas)
					ocs.add(orderCache);
		//	}
			logger.info("key="+key);
			//未接订单超过30分钟时，提醒用户无人接订单
			System.out.println("没进来  "+(DateUtil.subDate(orderCache.getEndtime())>WARMTIME));
			System.out.println("没进来  "+DateUtil.isDay(orderCache.getEndtime()));
			if(DateUtil.subDate(orderCache.getEndtime())>WARMTIME && DateUtil.isDay(orderCache.getEndtime())){
				String tel = orderService.getOrderUserTel(key);
				System.out.println("进来了");
				logger.info("tel="+tel +"  orderid="+key);
				if(null!=tel && !"".equals(tel)){
					SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1141);
					try {
						 m.sendMsg(tel,key,"orderid");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				//移除缓存中的订单
				remove(key);
				//将将订单状态更改为长时间未处理的异常状态
				logger.info("updateOrderStatus  start......"+key);
				//记录日志，改成状态5
				orderService.updateOrderStatus(key, 3);
				logger.info("updateOrderStatus  end......"+key);
			}
		/*	if(orderCache.isSend()){
				if(DateUtil.subDate(orderCache.getEndtime())>TIMEOUT){
					SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
					try {
						 m.sendMsg("15201351249","");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				orderCache.setSend(false);
			}*/
		}
		return ocs;
	}

	public List<OrderCache> scanOrder1() throws Exception{
		List<OrderCache> ocs = new ArrayList<OrderCache>(); 
		List<String> keys = cache.getKeys();
		logger.info(keys);
		for(String key : keys){
			OrderCache orderCache = (OrderCache)cache.get(key).getValue();
			logger.info(orderCache);
			//未接订单的时间>1分钟时推送消息(1分钟推送一次)
		//	if(DateUtil.subDate(orderCache.getEndtime())>SECOND){
				boolean ishas = true;
				//去除重复的元素
				for(OrderCache oc : ocs){
					logger.info(oc.getShopsIds()+"    "+orderCache.getShopsIds());
					if(oc.getShopsIds().containsAll(orderCache.getShopsIds())){
					//	logger.info("ishas = false");
						ishas = false;
					}
				}
				if(ishas)
					ocs.add(orderCache);
		//	}
			//未接订单超过30分钟时，提醒用户，并不显示订单
			if(DateUtil.subDate(orderCache.getEndtime())>WARMTIME){
				String tel = orderService.getOrderUserTel(key);
				SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
				try {
					 m.sendMsg(tel,key, "orderid");
				} catch (Exception e) {
					e.printStackTrace();
				}
				//移除缓存中的订单
				remove(key);
				//将将订单状态更改为长时间未处理的异常状态
				orderService.updateOrderStatus(key, 4);
			}
		/*	if(orderCache.isSend()){
				if(DateUtil.subDate(orderCache.getEndtime())>TIMEOUT){
					SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
					try {
						 m.sendMsg("15201351249","");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				orderCache.setSend(false);
			}*/
		}
		return ocs;
	}

	
	public static void main(String[] args) {
	/*	for(int i=0;i<10;i++){
			if(i<5){
				continue;
			}
			System.out.println(i);
			
		}*/
		SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1141);
		try {
			 m.sendMsg("17710171716","!","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
