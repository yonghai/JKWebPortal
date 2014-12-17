package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.IDAndPrice;
import jk.o1office.ht.exception.NULLStrException;
import jk.o1office.ht.exception.NullException;
import jk.o1office.ht.exception.NumberException;
import jk.o1office.ht.service.AdvertiseService;
import jk.o1office.ht.utils.StringHandler;
import jk.o1office.ht.validator.Validator;

/**
 * 促销设置
 *
 */
public class PromotionSetUp extends HttpServlet{
	private Validator validator;
	private AdvertiseService advertiseService;
	public AdvertiseService getAdvertiseService() {
		return advertiseService;
	}
	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
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
			String type = validator.isNullStr(req.getParameter("type"), "");
			String title = validator.isNullStr(req.getParameter("title"), "");
			int isshow = Integer.parseInt(validator.isNumber(req.getParameter("place")));
			String content = validator.isNullStr(req.getParameter("content"), "");
			if(type.equals("web")){
				returninfo = advertiseService.webPromotionSetUp(title,isshow,content);
			}else if(type.equals("details")){
				IDAndPrice idAndPrice = StringHandler.getIDAndPrice(content);
				returninfo = advertiseService.DetailsPromotionSetUp(title,isshow,idAndPrice);
			}else if(type.equals("list")){
				List<IDAndPrice> idAndPrices = StringHandler.getIDAndPrices(content);
				returninfo = advertiseService.listPromotionSetUp(title,isshow,idAndPrices);
			}
		} catch (NULLStrException e) {
			e.printStackTrace();
		} catch (NullException e) {
			e.printStackTrace();
		} catch (NumberException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
