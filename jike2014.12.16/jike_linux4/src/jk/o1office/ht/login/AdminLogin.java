package jk.o1office.ht.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jk.o1office.ht.domin.AdminUser;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.utils.URLCache;

public class AdminLogin extends HttpServlet{
	private URLCache urlCache = URLCache.newInstance();
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
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		PrintWriter printWriter = resp.getWriter();
		AdminUser user = new AdminUser();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setType(Integer.parseInt(req.getParameterValues("type")[0]));
		String view = "", returninfo = "";
		try {
			returninfo = userService.login(user);
			if(returninfo.equals("success")){
				session.setAttribute("username", user.getUsername());
				session.setAttribute("usertype", user.getType());
			//	urlCache.createCache(user.getUsername());
			//	urlCache.setAttr("loginTime", new Date().toLocaleString(), user.getUsername());
			//	urlCache.setAttr("loginIP", req.getRemoteAddr(), user.getUsername());
			//	urlCache.flush(user.getUsername());
				if(user.getType()==0){
					view = "<script>location.href='/jike/common/index.jsp'</script>";
				}else if(user.getType()==1){
					view = "<script>location.href='/jike/operate/index.jsp'</script>";
				}else{
					view = "<script>location.href='/jike/super/index.jsp'</script>";
				}
			}else{
				view = "<script>alert('登陆失败');location.href='/jike/login.jsp';</script>";
			}
		} catch (Exception e) {
			view = "<script>alert('登陆失败');location.href='/jike/login.jsp';</script>";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(view);
		}
	}
}
