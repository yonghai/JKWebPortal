package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.domin.Device;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.validator.Validator;
/**
 *	配送员注销用户臧浩
 */
public class Logout extends HttpServlet{
	private Validator validator;
	private UserService userService;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
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
			Device d = new Device();
			if(token.equals("")){
				returninfo = "{\"success\":true,\"emsg\":\"注销成功\",\"token\"\"}";
			}else{
				d.setToken(token);
				d.setUserid(IDGenertor.getUserID(token));
				d.setRole("delivery");
				returninfo = userService.logout(d);
			}
			MyLog.newInstance().writeLog(OperateType.DLOGOUT, FileType.DUSERINFO, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			MyLog.newInstance().writeLog(OperateType.DLOGOUT, FileType.DUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"emsg\":\"token异常\",\"token\":\""+token+"\"}";
			MyLog.newInstance().writeLog(OperateType.DLOGOUT, FileType.DUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"异常错误\",\"token\":\""+token+"\"}";
			MyLog.newInstance().writeLog(OperateType.DLOGOUT, FileType.DUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
