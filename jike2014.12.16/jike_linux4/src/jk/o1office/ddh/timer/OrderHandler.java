package jk.o1office.ddh.timer;

import jk.o1office.service.OrderService;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
/**
 * 每两个小时监测一次，是否有超过一个月的订单，有则存入订单历史表中
 */
public class OrderHandler{
	private OrderService orderService;
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public void execute() throws Exception{
		System.out.println("定时程序...start");
		orderService.moveOrder();
		System.out.println("定时程序...end");
	}

	
}
