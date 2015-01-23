package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.DeliveryUser;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;
/**
 *	普通用户忘记密码
 *	参数已进行验证
 */
public class DeliveryForgotPsw extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.info.servlet.OrdForgotPsw");
	private UserService userService;
	private Validator validator;
	private SessionCache session;
	public SessionCache getSession() {
		return session;
	}
	public void setSession(SessionCache session) {
		this.session = session;
	}
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
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = resp.getWriter();
		DeliveryUser cuser = new DeliveryUser();
		String returninfo = "";
		String token = "";
		try {
			String deviceid = req.getParameter("device_id");
			cuser.setTelphone(TelValidator.isMobile(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber")));
			cuser.setPassword(validator.isNull(req.getParameter("newpassword"), "newpassword"));
			String checkcode = validator.isNull(req.getParameter("checkcode"), "checkcode");
			token = validator.isNull(req.getParameter("token"), "token");
			if(session.getAttr(cuser.getTelphone()).equals(checkcode)){
				returninfo = userService.updatePsw(cuser,token);
				MyLog.newInstance().writeLog(OperateType.DFORGETPASSWORD, FileType.DUSERINFO, token, "success");
			}else{
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"验证码错误\"}";
				MyLog.newInstance().writeLog(OperateType.DFORGETPASSWORD, FileType.DUSERINFO, token, "fail");
			}
		} catch(NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.DFORGETPASSWORD, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"用户名必须为手机号码\"}";
			MyLog.newInstance().writeLog(OperateType.DFORGETPASSWORD, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"修改密码出错\"}";
			MyLog.newInstance().writeLog(OperateType.DFORGETPASSWORD, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
