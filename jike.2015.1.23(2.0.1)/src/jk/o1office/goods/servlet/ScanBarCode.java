package jk.o1office.goods.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ProductService;
import jk.o1office.validator.Validator;

public class ScanBarCode extends HttpServlet{
	private Validator validator;
	private ProductService productService;
	public Validator getValidator() {
		return validator;
	}

	public void setValidator(Validator validator) {
		this.validator = validator;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
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
		String returninfo = "", token = "";
		try {
			String barcode = validator.isNullOrNullStr(req.getParameter("barcode"), "barcode");
			token = validator.isNull(req.getParameter("token"), "token");
			returninfo = productService.getProductByBarCode(barcode, token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为空\",\"token\":\""+token+"\"}";
			e.printStackTrace();
		//	e.printStackTrace(ExceptionInfo.out());
		//	ExceptionInfo.out().flush();
		} catch (Exception e) {
			if(null==e.getMessage() || e.getMessage().equals(""))
				returninfo = "{\"success\":false,\"emsg\":\"意外错误\",\"token\":\""+token+"\"}";
			else
				returninfo = "{\"success\":false,\"emsg\":\""+e.getMessage()+"\",\"token\":\""+token+"\"}";
			e.printStackTrace();
		//	e.printStackTrace(ExceptionInfo.out());
		//	ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
