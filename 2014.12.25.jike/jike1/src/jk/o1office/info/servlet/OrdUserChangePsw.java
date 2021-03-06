package jk.o1office.info.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.domin.CustomerUser;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.validator.Validator;
/**
 *	普通用户修改密码
 *	通过原密码和用户id修改密码
 *	参数已进行验证
 */
public class OrdUserChangePsw extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.info.servlet.OrdUserChangePsw");
	private UserService userService;
	private Validator validator;
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
		String newpassword = null;
		String returninfo = null;
		String token = null;
		try {
			String deviceid = req.getParameter("device_id");
			newpassword = validator.isNull(req.getParameter("newpassword"), "newpassword");
			String oldpassword = validator.isNull(req.getParameter("oldpassword"), "oldpassword");
			token = validator.isNull(req.getParameter("token"), "token");
			returninfo = userService.updatePsw(newpassword,oldpassword,token);
			MyLog.newInstance().writeLog(OperateType.UUPDATEPASSWORD, FileType.UUSERINFO, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEPASSWORD, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token异常\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEPASSWORD, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"修改密码出错\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEPASSWORD, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
