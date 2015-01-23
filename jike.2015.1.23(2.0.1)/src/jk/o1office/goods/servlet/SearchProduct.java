package jk.o1office.goods.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ProductService;
import jk.o1office.validator.Validator;

/**
 *	搜索商品
 *	参数已验证
 */
public class SearchProduct extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.goods.servlet.SearchProduct");
	private ProductService productService;
	private Validator validator;
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
		String token = "";
		String returninfo = "";
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			int page = Integer.parseInt(validator.isNull(req.getParameter("page"),"page"));
			int rows = Integer.parseInt(validator.isNull(req.getParameter("pagesize"),"pagesize"));
			int offset = (page-1) * rows;
			String keyword = validator.isNull(req.getParameter("keyword"),"keyword");
		//	double longitude = Double.parseDouble(validator.isNull(req.getParameter("longitude"), "longitude")); //经度
		//	double latitude = Double.parseDouble(validator.isNull(req.getParameter("latitude"), "latitude"));    //维度
			returninfo = productService.searchProductByKeyWord(offset,rows,keyword,token);
			//搜索商品，从附近最近的商家的商品中搜索
		//	returninfo = productService.searchProductByKeyWord(offset,rows,longitude,latitude,keyword,token);
			logger.info(returninfo);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token异常\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"搜索商品出错了\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
