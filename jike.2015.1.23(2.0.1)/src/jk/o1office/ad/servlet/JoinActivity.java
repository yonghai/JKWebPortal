package jk.o1office.ad.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ActivityService;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

/**
 *	用户是否参加活动
 */
public class JoinActivity extends HttpServlet{
	
	private Validator validator;
	private ActivityService activityService;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public ActivityService getActivityService() {
		return activityService;
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "", token = "";
		String deviceid = req.getParameter("device_id");
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			int activityid = Integer.parseInt(validator.isNumber((req.getParameter("activityid"))));
			String tel = TelValidator.isMobile(req.getParameter("tel"));
			returninfo = activityService.join(tel,activityid,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
		} catch (TelException e) {
			returninfo = "{\"success\":false,\"emsg\":\"手机号码格式不正确!\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"异常错误!\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
