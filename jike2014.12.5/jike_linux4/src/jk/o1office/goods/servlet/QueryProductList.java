package jk.o1office.goods.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.excetion.FailException;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ProductService;
import jk.o1office.validator.Validator;
/**
 * 	定位
 *	根据分类查询商品列表
 *	参数已验证
 */
public class QueryProductList extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.goods.servlet.QueryProductList");
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
			int category_id = Integer.parseInt(req.getParameter("category_id").trim());
			int pagesize = Integer.parseInt(req.getParameter("pagesize").trim());
			int page = Integer.parseInt(req.getParameter("page").trim());
			int offset = (page-1) * pagesize;
		//	int shopsid = Integer.parseInt(validator.isNull(req.getParameter("shopsid"), "shopsid"));
		//	double longitude = Double.parseDouble(validator.isNull(req.getParameter("longitude"), "longitude")); //经度
		//	double latitude = Double.parseDouble(validator.isNull(req.getParameter("latitude"), "latitude"));    //维度
			returninfo = productService.queryProductsByType(category_id,offset,pagesize,token);
			//定位，获取最近商家的分类的商品
		//	returninfo = productService.queryProductsByType(category_id,offset,pagesize,shopsid,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"获取商品列表出错了\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
