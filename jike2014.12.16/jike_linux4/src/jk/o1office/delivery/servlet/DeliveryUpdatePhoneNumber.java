package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.domin.DeliveryUser;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

import org.apache.log4j.Logger;

/**
 *	修改手机号码
 *	参数已进行验证
 */
public class DeliveryUpdatePhoneNumber extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.info.servlet.UpdatePhoneNumber");
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
		DeliveryUser duser = new DeliveryUser();
		String token = "";
		String returninfo = "";
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			String tel = TelValidator.isMobile(validator.isNull(req.getParameter("newmobilenumber"), "newmobilenumber"));
			String checkcode = validator.isNull(req.getParameter("checkcode"), "checkcode");
			String newpassword = validator.isNull(req.getParameter("newpassword"), "newpassword");
			duser.setPassword(validator.isNull(req.getParameter("password"), "password"));
			duser.setId(IDGenertor.getUserID(token));
			duser.setUsername(tel);
			if(session.getAttr(tel).equals(checkcode)){
				returninfo = userService.updatePhoneNum(duser,tel,newpassword,token);
				MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "success");
			}else{
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"验证码错误\"}";
				MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "fail");
			}
		} catch(NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token异常'\"}";
			MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式错误\"}";
			MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"修改手机号码失败\"}";
			MyLog.newInstance().writeLog(OperateType.DUPDATETEL, FileType.DUSERINFO, token, "fail");
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
