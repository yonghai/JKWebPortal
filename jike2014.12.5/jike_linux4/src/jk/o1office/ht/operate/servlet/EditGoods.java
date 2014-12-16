package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.Product;
import jk.o1office.ht.service.ProductService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class EditGoods extends HttpServlet{
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
		resp.setContentType("text/html;charset=utf-8");
		String returninfo = "";
		PrintWriter printWriter = resp.getWriter();
		try {
			Product p = new Product();
			p.setId(Integer.parseInt(validator.isNumber(req.getParameter("id"))));
			p.setPcategoryid(Integer.parseInt(validator.isNumber(req.getParameter("type2"))));
			p.setFeature(req.getParameter("goodsfeature"));
			p.setPname(validator.isNullStr(req.getParameter("goodsname"),""));
			p.setPprice(validator.isNullStr(req.getParameter("goodsprice"),""));
			p.setPdescript(validator.isNullStr(req.getParameter("goodsdescript"),""));
			p.setPweight(req.getParameter("goodsweight"));
			p.setPvalume(req.getParameter("goodsvalume"));
			p.setPbzq(req.getParameter("goodsbzq"));
			returninfo = productService.updateGoods(p);
		} catch (Exception e) {
			returninfo = "编辑失败";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
