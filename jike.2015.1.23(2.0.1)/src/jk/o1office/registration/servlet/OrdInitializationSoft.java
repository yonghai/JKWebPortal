package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.VersionService;
import jk.o1office.validator.Validator;
/**
 * 	该接口已弃用
 *	普通用户初始化请求
 *	参数已进行验证
 *	没有进行token验证
 */
public class OrdInitializationSoft extends HttpServlet {
	private VersionService versionService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public VersionService getVersionService() {
		return versionService;
	}
	public void setVersionService(VersionService versionService) {
		this.versionService = versionService;
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
		String returninfo = "",token = "";
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			String category_ver = validator.isNull(req.getParameter("category_ver"), "category_ver");
			String area_ver = validator.isNull(req.getParameter("area_ver"), "area_ver");
			String soft_ver = validator.isNull(req.getParameter("soft_ver"), "soft_ver");
			returninfo = versionService.getVersionInfo("customer",token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"初始化失败\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}finally{
			printWriter.println(returninfo);
		}
	}
}
