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

public class GetAdmin extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.GetAdmin");
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
			int type = Integer.parseInt(validator.isNumber(req.getParameter("type")));
			int page = Integer.parseInt(validator.isNumber(req.getParameter("page")));
			int rows = Integer.parseInt(validator.isNumber(req.getParameter("rows")));
			int offset = (page-1) * rows;
			String name = req.getParameter("name");
			if(null==name){
				returninfo = userService.getUser(offset, rows, type);
			}else{
				returninfo = userService.getUser(offset, rows, type, name);
			}
			System.out.println(returninfo);
		} catch (Exception e) {
			returninfo = "获取管理员列表出错了";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
