package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.Perf.GetPerfAction;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ReceiveBillService;
import jk.o1office.validator.Validator;

/**
 * 配送员接单列表的详情
 */
public class QueryReceBillDec extends HttpServlet{
	private ReceiveBillService receiveBillService;
	private Validator validator;
	public ReceiveBillService getReceiveBillService() {
		return receiveBillService;
	}
	public void setReceiveBillService(ReceiveBillService receiveBillService) {
		this.receiveBillService = receiveBillService;
	}
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
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
		String token = "", returninfo = "";
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			String deviceid = req.getParameter("deviceid");
			String orderid = validator.isNull(req.getParameter("orderid"), "orderid");
			returninfo = receiveBillService.getReceBillDec(orderid,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"emsg\":\"token异常\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"不知名错误\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}

}
