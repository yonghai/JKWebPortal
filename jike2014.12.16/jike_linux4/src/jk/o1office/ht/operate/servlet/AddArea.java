package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.Area;
import jk.o1office.ht.service.AreaService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class AddArea extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.AddArea");
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	private AreaService areaService;
	public AreaService getAreaService() {
		return areaService;
	}
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
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
			List<Area> areas = new ArrayList<Area>();
			Area sheng = new Area();
			sheng.setPid(-1);
			sheng.setName(validator.isNullStr(req.getParameter("sheng"),""));
			sheng.setDescription(sheng.getName());
			sheng.setCreatetime(new Date());
			areas.add(sheng);
			Area shi = new Area();
			shi.setPid(0);
			shi.setName(validator.isNullStr(req.getParameter("shi"),""));
			shi.setDescription(shi.getName());
			shi.setCreatetime(new Date());
			areas.add(shi);
			Area area = new Area();
			area.setPid(0);
			area.setName(validator.isNullStr(req.getParameter("area"),""));
			area.setDescription(req.getParameter("aread"));
			area.setCreatetime(new Date());
			areas.add(area);
			returninfo = areaService.addArea(areas);
		} catch (Exception e) {
			returninfo = "处错误了";
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
