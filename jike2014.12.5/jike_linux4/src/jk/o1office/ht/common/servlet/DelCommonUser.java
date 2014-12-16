package jk.o1office.ht.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class DelCommonUser extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.DelCommonUser");
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
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			returninfo = userService.delUser(id);
		} catch (Exception e) {
			returninfo = "删除失败";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
