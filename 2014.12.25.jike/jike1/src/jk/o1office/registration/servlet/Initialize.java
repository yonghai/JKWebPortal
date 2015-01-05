package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.InitService;
import jk.o1office.validator.Validator;
/**
 *	软件初始化
 *	1.版本信息
 *	2.广告信息
 *	3.一级分类信息
 *	
 */
public class Initialize extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.registration.servlet.Initialize");
	private InitService initService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public InitService getInitService() {
		return initService;
	}
	public void setInitService(InitService initService) {
		this.initService = initService;
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
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"),"token");
			returninfo = initService.init(token);
		} catch(NullException e){
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"异常错误\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.print(returninfo);
		}
	}
	
}
