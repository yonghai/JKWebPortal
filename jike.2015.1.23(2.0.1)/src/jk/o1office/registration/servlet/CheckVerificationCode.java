package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

/**
 *	验证验证码
 *	已进行参数验证
 *	没有进行token验证
 */
public class CheckVerificationCode extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.registration.servlet.CheckVerificationCode");
	private SessionCache session;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public SessionCache getSession() {
		return session;
	}
	public void setSession(SessionCache session) {
		this.session = session;
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
			String tel = TelValidator.isMobile(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber"));
			String code = validator.isNull(req.getParameter("code"), "code");
			token = validator.isNull(req.getParameter("token"), "token");
			String diviceid = req.getParameter("device_id");
			if(code.equals(session.getAttr(tel))){
				returninfo = "{\"success\":true,\"emsg\":\"验证码正确\",\"token\":\""+token+"\"}";
			}else{
				returninfo = "{\"success\":false,\"emsg\":\"验证码错误\",\"token\":\""+token+"\"}";
			}
		} catch(NullPointerException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"该验证码过期，请重新获取\"}";
			logger.error(e);
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式不正确\"}";
			logger.error(e);
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			logger.error(e);
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}

}
