package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jk.o1office.domin.DeliveryUser;
import jk.o1office.domin.Device;
import jk.o1office.excetion.DuserReisterException;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.UserService;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.Validator;

import org.springframework.dao.DataAccessException;
/**
 *	配送端注册
 */
public class DeliveryUserRegistration extends HttpServlet {
	private UserService userService;
	private Validator validator;
	private SessionCache session;
	public SessionCache getSession() {
		return session;
	}
	public void setSession(SessionCache session) {
		this.session = session;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
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
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = resp.getWriter();
		String returninfo = "";
		String checkcode = "";
		String token = "";
		DeliveryUser duser = new DeliveryUser();
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"),"token");
			checkcode = validator.isNull(req.getParameter("checkcode"), "checkcode");
			duser.setPassword(validator.isNull(req.getParameter("password"), "password"));
			duser.setNickname(validator.isNull(req.getParameter("nickname"), "nickname"));
			duser.setTelphone(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber"));
			duser.setCreatetime(new Date());
			if(!session.getAttr(duser.getTelphone()).equals(checkcode)){
				returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"校验码错误\"}";
			}else{
				Device device = new Device();
				returninfo = userService.save(duser,device,token);
			}
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(DuserReisterException e){
			returninfo = "{\"success\":false,\"emsg\":\"注册超时，请重新注册\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"未知错误\",\"token\":\""+token+"\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
