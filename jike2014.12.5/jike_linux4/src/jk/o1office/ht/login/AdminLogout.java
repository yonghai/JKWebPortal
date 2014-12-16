package jk.o1office.ht.login;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.domin.URLInfo;
import jk.o1office.ht.service.LogService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.utils.URLCache;

public class AdminLogout extends HttpServlet{
	private URLCache urlCache = URLCache.newInstance();
	private LogService logService;
	public LogService getLogService() {
		return logService;
	}
	public void setLogService(LogService logService) {
		this.logService = logService;
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
		HttpSession session = req.getSession();
		try {
		/*	urlCache.setAttr("logoutTime", new Date().toLocaleString(), session.getAttribute("username")+"");
			urlCache.flush(session.getAttribute("username")+"");
			logService.logout(session.getAttribute("username")+""); */
			session.removeAttribute("username");
			resp.sendRedirect("/jike/login.jsp");
		} catch (Exception e) {
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		}
	}
	
}
