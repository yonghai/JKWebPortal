package jk.o1office.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.domin.Device;
import jk.o1office.excetion.FailException;
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
 *	用户注销
 *	参数已进行验证
 */
public class UserLogout extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.login.servlet.UserLogout");
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
		Device d = new Device();
		String returninfo = "";
		try {
			d.setDevice_id(req.getParameter("device_id"));
			d.setToken(validator.isNull(req.getParameter("token"), "token"));
			if(d.getToken().equals(""))
				returninfo = "{\"success\":true,\"token\":\"\",\"emsg\":\"注销成功\"}";
			else{
				d.setUserid(IDGenertor.getUserID(d.getToken()));
				d.setRole("customer");
				returninfo = userService.logout(d);
			}
			MyLog.newInstance().writeLog(OperateType.ULOGOUT, FileType.UUSERINFO, d.getToken(), "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+d.getToken()+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGOUT, FileType.UUSERINFO, d.getToken(), "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+d.getToken()+"\",\"emsg\":\"token异常\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGOUT, FileType.UUSERINFO, d.getToken(), "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+d.getToken()+"\",\"emsg\":\"用户注销失败\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGOUT, FileType.UUSERINFO, d.getToken(), "fail");
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
		
	}
}
