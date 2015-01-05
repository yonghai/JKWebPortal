package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.AdDetail;
import jk.o1office.ht.exception.NumberException;
import jk.o1office.ht.service.AdvertiseService;
import jk.o1office.ht.validator.Validator;

/**
 *	删除促销列表中的促销商品
 */
public class DeletePromotion extends HttpServlet{
	private Validator validator;
	private AdvertiseService advertiseService;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public AdvertiseService getAdvertiseService() {
		return advertiseService;
	}
	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
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
			String goodsid = validator.isNumber(req.getParameter("goodsid"));
			returninfo = advertiseService.deletePromotionGoods(goodsid);
		} catch (NumberException e) {
			returninfo = "删除失败";
			e.printStackTrace();
		} catch (Exception e) {
			returninfo = "删除失败";
			e.printStackTrace();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
