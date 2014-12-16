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
import jk.o1office.service.GoodsCategoryService;
import jk.o1office.validator.Validator;

/*	
 * 	根据定位下载分类列表
 *	参数已经验证 
 */
public class DownloadCategories extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.goods.servlet.DownloadCategories");
	private GoodsCategoryService goodsCategoryService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public GoodsCategoryService getGoodsCategoryService() {
		return goodsCategoryService;
	}
	public void setGoodsCategoryService(GoodsCategoryService goodsCategoryService) {
		this.goodsCategoryService = goodsCategoryService;
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
			String category_id = validator.isNull(req.getParameter("category_id"), "category_id");
		//	double longitude = Double.parseDouble(validator.isNull(req.getParameter("longitude"), "longitude")); //经度
		//	double latitude = Double.parseDouble(validator.isNull(req.getParameter("latitude"), "latitude"));    //维度
			returninfo = goodsCategoryService.getGoodsCategories(Integer.parseInt(category_id),token);
		//	returninfo = goodsCategoryService.getGoodsCategories(Integer.parseInt(category_id),longitude,latitude,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"获取分类列表出错\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
