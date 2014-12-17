package jk.o1office.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import jk.o1office.cache.OrderCache;
import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.ddh.timer.OrderFactoryBean;
import jk.o1office.domin.Order;
import jk.o1office.domin.OrderDetail;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.OrderService;
import jk.o1office.utils.DateUtil;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;
import jk.o1office.validator.Validator;

/**
 *	提交订单
 *	参数已验证
 */
public class SubmitOrder extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.order.servlet.SubmitOrder");
	private OrderService orderService;
	private Validator validator;
	private OrderFactoryBean orderFactoryBean;
	public OrderFactoryBean getOrderFactoryBean() {
		return orderFactoryBean;
	}
	public void setOrderFactoryBean(OrderFactoryBean orderFactoryBean) {
		this.orderFactoryBean = orderFactoryBean;
	}
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		Order order = new Order();
		String token = "";
		String returninfo = "";
		try {
			token = validator.isNull(req.getParameter("token"), req.getParameter("token"));
			String deviceid = req.getParameter("device_id");
			String sys = req.getParameter("system");
			order.setOrderid(orderFactoryBean.getOrderID());
		//	order.setActual_delivery_time(validator.isNull(req.getParameter("actual_delivery_time"), "actual_delivery_time"));
		//	order.setActual_pay_type(Integer.parseInt(validator.isNull(req.getParameter("actual_pay_type"), "actual_pay_type")));
		//	order.setBill_status(Integer.parseInt(validator.isNull(req.getParameter("billStatus"), "billStatus")));
			order.setCreatetime(new Date());
			order.setCustomer_id(IDGenertor.getUserID(token));
			order.setDelivery_address_id(Long.parseLong(validator.isNull(req.getParameter("address_id"), "address_id")));
		//	order.setDelivery_address_stamp(Long.parseLong(validator.isNull(req.getParameter("delivery_address_stamp"), "delivery_address_stamp")));
		//	order.setDelivery_id(Long.parseLong(validator.isNull(req.getParameter("delivery_id"), "delivery_id")));
			order.setPay_type(Integer.parseInt(validator.isNull(req.getParameter("pay_id"), "pay_id")));
			order.setTotal_price(""+Float.parseFloat(validator.isNull(req.getParameter("price_all"), "price_all")));
			order.setGoodsnum(Integer.parseInt(req.getParameter("goods_all")));
			order.setName(validator.isNull(req.getParameter("name"), "name"));
			order.setAddress(validator.isNull(req.getParameter("address"), "address"));
			order.setTel(validator.isNull(req.getParameter("tel"), "tel"));
			order.setDeliveryprice(validator.isNull(req.getParameter("deliveryprice"), "deliveryprice"));
			order.setCreatetime(new Date());
			//	order.setReserved_delivery_time(validator.isNull(req.getParameter("reserved_delivery_time"), "reserved_delivery_time"));
			List<OrderDetail> list = null;
			if(sys.equals("iOS")){
				list = JsonHandler.IOSJsonToList(validator.isNull(req.getParameter("data"), "data"));
			}else{
				list = JsonHandler.JsonToList(validator.isNull(req.getParameter("data"), "data"));
			}
			returninfo = orderService.saveOrders(order,list,token);
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(FailException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"天骄订单出错\"}";
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"意外错误\"}";
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			//订单提交成功，推送消息给配送端
			try {
				JSONObject obj = new JSONObject(returninfo);
				if(obj.getBoolean("success")){
					logger.info("start  sendNotification");
					//推送消息给配送端
					orderService.sendNotification(Integer.parseInt(""+order.getDelivery_address_id()));
					
					logger.info("end  sendNotification");
					//定时计算订单的时间,然后推送消息
					OrderCacheUtil.put(order.getOrderid(), 
							new OrderCache(orderService.getShopsIds(Integer.parseInt(""+order.getDelivery_address_id())), 
									order.getCreatetime()));
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
				e.printStackTrace(ExceptionInfo.out());
				ExceptionInfo.out().flush();
			} catch (Exception e) {
				e.printStackTrace();
				e.printStackTrace(ExceptionInfo.out());
				ExceptionInfo.out().flush();
			}
			printWriter.println(returninfo);
		}
	}
}
