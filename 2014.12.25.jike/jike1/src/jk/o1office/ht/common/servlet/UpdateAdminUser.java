package jk.o1office.ht.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.AdminUser;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class UpdateAdminUser extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.UpdateAdminUser");
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
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "";
		try {
			AdminUser user = new AdminUser();
			user.setId(Integer.parseInt(validator.isNumber(req.getParameter("id"))));
			user.setUsername(validator.isNullStr(req.getParameter("username"),""));
			user.setNickname(validator.isNullStr(req.getParameter("nickname"),""));
			user.setPassword(validator.isNullStr(req.getParameter("password"),""));
			user.setType(Integer.parseInt(validator.isNumber(req.getParameter("type"))));
			user.setCreatetime(new Date());
			if(userService.updateUser(user)){
				returninfo = "更新成功";
			}
		} catch (Exception e) {
			returninfo = "更新出错了";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
