package jk.o1office.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.chainsaw.Main;

import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.OrderService;
import jk.o1office.validator.Validator;

/**
 * 根据订单ID查询订单详情
 * 参数已验证
 */
public class QueryOrderByID extends HttpServlet{
	private OrderService orderService;
	private Validator validator;
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
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String token = "";
		String returninfo = "";
		try {
			String deviceid = req.getParameter("device_id");
			String time = validator.isNull(req.getParameter("time"), "time");
			/*0=文字订单，1=语音订单*/
			String orderType = req.getParameter("ordertype");
			token = validator.isNull(req.getParameter("token"), "token");
			String orderid = validator.isNull(req.getParameter("order_id"), "order_id");
			if(null==orderType)
				returninfo = orderService.getOldOrderByID(orderid,time,token);
			//	returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"版本过低，请更新版本!\"}";	
			else{
				if(orderType.equals("0")){
					returninfo = orderService.getOrderByID(orderid,time,token);
				}else
					returninfo = orderService.getQTOrderByID(orderid,time,token);	
			}
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			if(null == e.getMessage() || e.getMessage().equals(""))
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"查询订单详情出错\"}";
			else
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+e.getMessage()+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}finally{
			printWriter.println(returninfo);
		}
		
	}
}
