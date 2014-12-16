package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import antlr.PrintWriterWithSMAP;

import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.OrderService;
import jk.o1office.validator.Validator;

/**
 * 配送员查看客户提交的订单列表
 */
public class QueryBillList extends HttpServlet {
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
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String token = "";
		String returninfo = "";
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			String deviceid = req.getParameter("device_id");
			int pagesize = Integer.parseInt(validator.isNull(req.getParameter("pagesize"), "pagesize"));
			int page = Integer.parseInt(validator.isNull(req.getParameter("page"), "page"));
			int offset = (page-1) * pagesize;
			returninfo = orderService.getOrder(pagesize,offset, token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"emsg\":\"token异常\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"异常错误\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
