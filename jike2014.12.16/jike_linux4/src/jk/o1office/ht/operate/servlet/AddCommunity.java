package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.Community;
import jk.o1office.ht.service.CommunityService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

/*
 * 添加小区
 */
public class AddCommunity extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.AddCommunity");
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	private Validator validator;
	private CommunityService communityService; 
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
			Community community = new Community();
			community.setAreaid(Integer.parseInt(validator.isNumber(req.getParameter("areaid"))));
			community.setName(validator.isNullStr(req.getParameter("communityname"),""));
			community.setDescription(validator.isNullStr(req.getParameter("communitydesc"),""));
			returninfo = communityService.addCommunity(community);
		} catch (Exception e) {
			returninfo = "添加失败";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
