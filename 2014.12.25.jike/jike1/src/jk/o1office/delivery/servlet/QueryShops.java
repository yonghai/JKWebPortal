package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ShopsService;
import jk.o1office.validator.Validator;

/**
 *	查询区域附近的所有商家
 */
public class QueryShops extends HttpServlet{
	private ShopsService shopsService;
	private Validator validator;
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
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
		resp.setContentType("text/html;utf-8");
		PrintWriter printWriter = resp.getWriter();
		String token = "",returninfo = "";
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			int areaid = Integer.parseInt(req.getParameter("id"));
			returninfo = shopsService.getShops(areaid,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+e.getName()+"不能为null\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"异常错误\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
