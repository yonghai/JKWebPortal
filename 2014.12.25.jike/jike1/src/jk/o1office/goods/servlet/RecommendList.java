package jk.o1office.goods.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.ProductService;
import jk.o1office.validator.Validator;

import org.apache.log4j.Logger;

/**
 *	商品记录
 *	销量最高或购买记录
 *	如果有购买记录则显示购买记录列表，否则显示销量
 *	如果有购买记录，显示所有商家的购买记录（没有涉及定位）
 *	参数已验证
 */
public class RecommendList extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.goods.servlet.RecommendList");
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
		//	double longitude = Double.parseDouble(validator.isNull(req.getParameter("longitude"), "longitude")); //经度
		//	double latitude = Double.parseDouble(validator.isNull(req.getParameter("latitude"), "latitude"));    //维度
			returninfo = productService.productRecord(token);
			//当显示销量时，显示附近最近商家的销量纪录
		//	returninfo = productService.productRecord(longitude,latitude,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token错误\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"商品记录出错\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
