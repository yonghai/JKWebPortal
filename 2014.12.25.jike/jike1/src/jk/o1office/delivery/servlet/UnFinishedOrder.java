package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.BillHandlerService;
import jk.o1office.validator.Validator;

/**
 * 查询配送员未完成的订单
 */
public class UnFinishedOrder extends HttpServlet{
	private Validator validator;
	private BillHandlerService billHandlerService;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public BillHandlerService getBillHandlerService() {
		return billHandlerService;
	}
	public void setBillHandlerService(BillHandlerService billHandlerService) {
		this.billHandlerService = billHandlerService;
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
			String deviceid = req.getParameter("device_id");
			returninfo = billHandlerService.getUnFinshOrder(token);
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
