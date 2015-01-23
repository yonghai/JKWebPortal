package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.OrderService;
import jk.o1office.service.ReceiveBillService;
import jk.o1office.validator.Validator;

/**
 * 配送员的接单列表
 */
public class QueryReceBillList extends HttpServlet{
	private ReceiveBillService receiveBillService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public ReceiveBillService getReceiveBillService() {
		return receiveBillService;
	}
	public void setReceiveBillService(ReceiveBillService receiveBillService) {
		this.receiveBillService = receiveBillService;
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
		String returninfo = "", token = "";
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			String deviceid = req.getParameter("device_id");
			int pagesize = Integer.parseInt(validator.isNull(req.getParameter("pagesize"), "pagesize"));
			int page = Integer.parseInt(validator.isNull(req.getParameter("page"), "page"));
			int offset = (page-1) * pagesize;
			String time = validator.isNull(req.getParameter("time"), "time");
			returninfo = receiveBillService.getReceiceBill(pagesize,offset,time,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"不知名错误\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}

}
