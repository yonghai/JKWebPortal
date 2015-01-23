package jk.o1office.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.DeliveryUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.UserService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.validator.Validator;

/**
 *	普通用户登陆
 */

public class DeliveryUserLogin extends HttpServlet {
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
		DeliveryUser duser = new DeliveryUser();
		Device device = new Device();
		String returninfo = "";
		try {
			duser.setTelphone(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber"));
			duser.setPassword(validator.isNull(req.getParameter("password"), "password"));
			device.setDevice_id(req.getParameter("device_id"));
			device.setToken(validator.isNull(req.getParameter("token"), "token"));
			device.setCreateTime(new Date());
			device.setRegistration_id(req.getParameter("registration_id"));
			returninfo = userService.service(duser, device);
			//记录操作日志
			MyLog.newInstance().writeLog(OperateType.DLOGIN, FileType.DUSERINFO, device.getToken(), "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.DLOGIN, FileType.DUSERINFO, device.getToken(), "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+device.getToken()+"\",\"emsg\":\"异常错误\"}";
			MyLog.newInstance().writeLog(OperateType.DLOGIN, FileType.DUSERINFO, device.getToken(), "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
