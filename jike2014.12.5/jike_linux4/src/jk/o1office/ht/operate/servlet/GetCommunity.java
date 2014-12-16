package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.service.CommunityService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class GetCommunity extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.GetCommunity");
	private CommunityService communityService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public CommunityService getCommunityService() {
		return communityService;
	}
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
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
			String name = req.getParameter("name");
			int page = Integer.parseInt(validator.isNumber(req.getParameter("page")));
			int rows = Integer.parseInt(validator.isNumber(req.getParameter("rows")));
			int offset = (page-1) * rows;
			if(null!=name){
				returninfo = communityService.getCommunity(offset,rows,name);
			}else
				returninfo = communityService.getCommunity(offset,rows);
		} catch (Exception e) {
			returninfo = "获取小区列表失败";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
