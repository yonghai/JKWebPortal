package jk.o1office.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;
/**
 *	普通用户登陆
 *	参数已进行验证
 *	没有进行token验证
 */
public class OrdUserLogin extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.login.servlet.OrdUserLogin");
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
		CustomerUser cuser = new CustomerUser();
		Device device = new Device();
		String returninfo = "";
		try {
			cuser.setUsername(TelValidator.isMobile(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber")));
			cuser.setPassword(validator.isNull(req.getParameter("password"), "password"));
			device.setDevice_id(req.getParameter("device_id"));
			device.setToken(validator.isNull(req.getParameter("token"), "token"));
			device.setCreateTime(new Date());
			returninfo = userService.service(cuser, device);
			//记录登陆日志
			MyLog.newInstance().writeLog(OperateType.ULOGIN, FileType.UUSERINFO, device.getToken(), "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGIN, FileType.UUSERINFO, device.getToken(), "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\"用户名必须为手机号码\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGIN, FileType.UUSERINFO, device.getToken(), "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\"登陆出错了\"}";
			MyLog.newInstance().writeLog(OperateType.ULOGIN, FileType.UUSERINFO, device.getToken(), "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}finally{
			printWriter.println(returninfo);
		}
	}
}
