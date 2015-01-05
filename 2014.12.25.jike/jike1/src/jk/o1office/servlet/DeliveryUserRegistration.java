package jk.o1office.servlet;

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
import jk.o1office.service.UserService;
/**
 * 配送员注册
 * 保存配送员的信息
 */
public class DeliveryUserRegistration extends HttpServlet {
	private UserService userService;
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
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = resp.getWriter();
		HttpSession session = req.getSession();
		DeliveryUser cuser = new DeliveryUser();
		String token = "";
		String checkcode = req.getParameter("checkcode");
		cuser.setUsername(req.getParameter("username"));
		cuser.setNickname(req.getParameter("nickname"));
		cuser.setPassword(req.getParameter("password"));
		cuser.setTelphone(req.getParameter("telphone"));
		cuser.setCreatetime(new Date());
		if(!session.getAttribute("checkcode").equals(checkcode)){
			printWriter.println("{\"success\":false,\"token\":\"\",\"emsg\":\"校验码错误\"}");
		}else{
			Device device = new Device();
			String returninfo = null;
			try {
				returninfo = userService.save(cuser,device,token);
			} catch(Exception e) {
				e.printStackTrace();
			} finally{
				printWriter.println(returninfo);
			}
		}
	}
}
