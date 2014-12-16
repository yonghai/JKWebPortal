package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.ProductCategory;
import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

import org.apache.log4j.Logger;

public class EditType extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.EditType");
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
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "";
		try {
			int id = Integer.parseInt(validator.isNumber(req.getParameter("typeid")));
			String name = validator.isNullStr(req.getParameter("typename"),"");
			String desc = validator.isNullStr(req.getParameter("typedesc"),"");
			if(null==desc)
				productCategoryService.editTypeName(id,name);
			else{
				ProductCategory type = new ProductCategory();
				type.setId(id);
				type.setCategoryname(name);
				type.setDescript(desc);
				productCategoryService.editType(type);
			}
			returninfo = "编辑成功";
		} catch (Exception e) {
			returninfo = "编辑失败";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
