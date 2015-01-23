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
import jk.o1office.domin.AllOrderInfo;
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
import jk.o1office.utils.SDKMessage;
import jk.o1office.validator.TelValidator;
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
		String token = "";
		String returninfo = "";
		AllOrderInfo allOrderInfo = new AllOrderInfo();
		try {
			token = validator.isNull(req.getParameter("token"), req.getParameter("token"));
			String deviceid = req.getParameter("device_id");
			String sys = req.getParameter("system");
			String orderid = orderFactoryBean.getOrderID();
			allOrderInfo.setBill_status(0);
			allOrderInfo.setCheckcode("");
			allOrderInfo.setCreatetime(new Date());
			allOrderInfo.setIsview(0);
			allOrderInfo.setOrderid(orderid);
			allOrderInfo.setOrdertype(0);
			allOrderInfo.setCustomerid(IDGenertor.getUserID(token));
			allOrderInfo.setDeliveryid(0);
			allOrderInfo.setTotal_price(validator.isNullOrNullStr(req.getParameter("price_all"), "price_all"));
			allOrderInfo.setAddressid(Integer.parseInt(req.getParameter("address_id")));
			allOrderInfo.setDeliveryprice(validator.isNull(req.getParameter("deliveryprice"), "deliveryprice"));
			allOrderInfo.setGoodsnum(Integer.parseInt(req.getParameter("goods_all")));
			allOrderInfo.setTel(TelValidator.isMobile(validator.isNull(req.getParameter("tel"), "tel")));
			allOrderInfo.setAddress(validator.isNull(req.getParameter("address"), "address"));
			allOrderInfo.setName(validator.isNull(req.getParameter("name"), "name"));
			List<Order> list = null;
			if(sys.equals("iOS")){
				list = JsonHandler.IOSJsonToList(validator.isNull(req.getParameter("data"), "data"));
			}else{
				list = JsonHandler.JsonToList(validator.isNull(req.getParameter("data"), "data"));
			}
			returninfo = orderService.saveOrders(allOrderInfo,list,token);
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
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			//订单提交成功，推送消息给配送端
			try {
				JSONObject obj = new JSONObject(returninfo);
				if(obj.getBoolean("success")){
					logger.info("start  sendNotification");
					//推送消息给配送端
			//		orderService.sendNotification(Integer.parseInt(""+allOrderInfo.getAddressid()));
					//发送短信给指定人
					SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
					try {//15201351249
						 m.sendMsg("17710171716",allOrderInfo.getOrderid(),"orderid");
					} catch (Exception e) {
						e.printStackTrace();
					}
					logger.info("end  sendNotification");
					//定时计算订单的时间,然后推送消息
					OrderCacheUtil.put(allOrderInfo.getOrderid(), 
							new OrderCache(orderService.getShopsIds(Integer.parseInt(""+allOrderInfo.getAddressid())), 
									allOrderInfo.getCreatetime()));
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
