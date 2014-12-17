package jk.o1office.cache;

import java.util.Date;
import java.util.List;

import jk.o1office.push.Demo;

public class OrderListener {
	private OrderCacheUtil orderCacheUtil;
	public OrderCacheUtil getOrderCacheUtil() {
		return orderCacheUtil;
	}
	public void setOrderCacheUtil(OrderCacheUtil orderCacheUtil) {
		this.orderCacheUtil = orderCacheUtil;
	}

	public void warm() throws Exception{
		System.out.println("warming......"+new Date());
		List<OrderCache> orderCaches = orderCacheUtil.scanOrder();
		Demo<Integer> demo = new Demo<Integer>("54477cacfd98c591e302398d", "3pihrjqs806lv47qx53tizcypyr6id5q");
	/*	for(OrderCache oc : orderCaches){
			demo.sendAndroidGroupcast();
		}*/
		if(orderCaches.size()>0){
			demo.sendAndroidGroupcast();
		}
	}
}
