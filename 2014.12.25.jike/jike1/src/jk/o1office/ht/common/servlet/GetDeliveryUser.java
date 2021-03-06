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

public class GetDeliveryUser extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.GetDeliveryUser");
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "";
		try {
			int page = Integer.parseInt(validator.isNumber(req.getParameter("page")));
			int rows = Integer.parseInt(validator.isNumber(req.getParameter("rows")));
			int offset = (page-1) * rows;
			String name = req.getParameter("name");
			if(null==name){
				returninfo = userService.getUser(offset, rows);
			}else{
				returninfo = userService.getUser(offset, rows, name);
			}
		} catch (Exception e) {
			returninfo = "加载出错";
		//	e.printStackTrace(ExceptionInfo.htout());
		//	ExceptionInfo.htout().flush();
			e.printStackTrace();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
