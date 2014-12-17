package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import jk.o1office.domin.CustomerUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.UserService;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;
/**
 * 普通用户注册
 * 保存普通用户的信息
 */
public class OrdUserRegistration extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.registration.servlet.OrdUserRegistration");
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
		CustomerUser cuser = new CustomerUser();
		String checkcode = "";
		String returninfo = "";
		String token = "";
		try {
			token = validator.isNull(req.getParameter("token"),"token");
			checkcode = validator.isNull(req.getParameter("checkcode"), "checkcode");
			String tel = TelValidator.isMobile(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber"));
			cuser.setUsername(tel);			//用的注册名称就是手机号码
			cuser.setPassword(validator.isNull(req.getParameter("password"), "password"));
			cuser.setNickname(validator.isNull(req.getParameter("nickname"), "nickname"));
			if(!session.getAttr(tel).equals(checkcode)){
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"校验码错误\"}";
			}else{
				Device device = new Device();
				device.setDevice_id(req.getParameter("device_id"));
				returninfo = userService.save(cuser,device,token);
			}
		} catch(NullPointerException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"该验证码过期，请重新获取\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式错误\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"用户注册出错了\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
