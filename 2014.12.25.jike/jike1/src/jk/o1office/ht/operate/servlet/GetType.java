package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import jk.o1office.ht.domin.ProductCategory;
import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class GetType extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.GetType");
	private ProductCategoryService productCategoryService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}
	public void setProductCategoryService(
			ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
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
		int page = Integer.parseInt(req.getParameter("page"));
		int rows = Integer.parseInt(req.getParameter("rows"));
		System.out.println(page+"  "+rows);
		int offset = (page-1) * rows;
		try {
			int type = Integer.parseInt(req.getParameter("type"));
			if(page==0 && rows==0){
				returninfo = productCategoryService.getType(type);
			}else
				returninfo = productCategoryService.getType(type, offset, rows);
		} catch (Exception e) {
			returninfo = "出错误了";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
