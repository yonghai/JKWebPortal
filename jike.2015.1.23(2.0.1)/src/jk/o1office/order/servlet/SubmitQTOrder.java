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

import com.qiniu.api.config.Token;

import jk.o1office.cache.OrderCache;
import jk.o1office.cache.OrderCacheUtil;
import jk.o1office.ddh.timer.OrderFactoryBean;
import jk.o1office.domin.AllOrderInfo;
import jk.o1office.domin.Order;
import jk.o1office.domin.OrderDetail;
import jk.o1office.domin.QTOrder;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
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
 *	提交语音订单
 *	参数已验证
 */
public class SubmitQTOrder extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.order.servlet.SubmitQTOrder");
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
		AllOrderInfo allOrderInfo = new AllOrderInfo();
		String token = "";
		String returninfo = "";
		try {
			token = validator.isNull(req.getParameter("token"), req.getParameter("token"));
			String deviceid = req.getParameter("device_id");
			String sys = req.getParameter("system");
			QTOrder order = new QTOrder();
			order.setContent(req.getParameter("content"));
			order.setOrderid(orderFactoryBean.getOrderID());
			order.setQturl(validator.isNull(req.getParameter("qturl"),"qturl"));
			order.setVoicelength(Integer.parseInt(validator.isNumber(req.getParameter("voicelength"))));
			
			allOrderInfo.setAddressid(Integer.parseInt(validator.isNull(req.getParameter("address_id"), "address_id")));
			allOrderInfo.setBill_status(0);
			allOrderInfo.setCheckcode("");
			allOrderInfo.setTotal_price("0");
			allOrderInfo.setCreatetime(new Date());
			allOrderInfo.setCustomerid(IDGenertor.getUserID(token));
			allOrderInfo.setDeliveryid(0);
			allOrderInfo.setDeliveryprice(validator.isNullOrNullStr(req.getParameter("deliveryprice"), "deliveryprice"));
			allOrderInfo.setIsview(0);
			allOrderInfo.setGoodsnum(0);
			allOrderInfo.setAddress(validator.isNull(req.getParameter("address"), "address"));
			allOrderInfo.setTel(TelValidator.isMobile(req.getParameter("tel")));
			allOrderInfo.setName(req.getParameter("name"));
			allOrderInfo.setOrderid(order.getOrderid());
			if(order.getQturl().equals("") && !order.getContent().equals(""))
				allOrderInfo.setOrdertype(2);
			else
				allOrderInfo.setOrdertype(1);
			
			returninfo = orderService.saveQtOrder(allOrderInfo, order, token);
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"提交订单出错\"}";
			MyLog.newInstance().writeLog(OperateType.USUBMITORDER, FileType.UUSERORDER, token, "fail");
			e.printStackTrace();
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
				//	orderService.sendNotification(Integer.parseInt(""+allOrderInfo.getAddressid()));
					//发送消息给赵兴
					SDKMessage m = new SDKMessage("e0c62954158dcdafdb2f5c34a2ba47c1", 1060);
					try {
						 m.sendMsg("17710171716", allOrderInfo.getOrderid(),"orderid");
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
