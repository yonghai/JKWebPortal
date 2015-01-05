package jk.o1office.ht.operate.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.Product;
import jk.o1office.ht.finals.Constant;
import jk.o1office.ht.service.ProductService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.utils.FileUpload;
import jk.o1office.ht.utils.StringHandler;
import jk.o1office.ht.validator.Validator;
//linix and windows
public class AddGoods extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.AddGoods");
	private FileUpload fileUpload;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	private ProductService productService;
	public FileUpload getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
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
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "";
		try {
			fileUpload.parse(req);
			Product product = new Product();
			String t1 = validator.isNullStr(fileUpload.getString("type1"),"");
			String t2 = validator.isNullStr(fileUpload.getString("type2"),"");
			product.setBarcode("");
			product.setCreatetime(new Date());
			product.setPbrand("");
			product.setPcategoryid(Integer.parseInt(validator.isNumber(fileUpload.getString("type2"))));
			product.setPdescript(validator.isNullStr(fileUpload.getString("goodsdescript"),""));
		//	product.setPimgpath(fileUpload.getPath().replace("e:\\jike\\", ""));/* windows*/
			product.setPimgpath(Constant.IMGURL+fileUpload.getPath().replace("/jike/", "")); //linux
			product.setPname(validator.isNullStr(fileUpload.getString("goodsname"),""));
			product.setPprice(validator.isNullStr(fileUpload.getString("goodsprice"),""));
			product.setPversion(1);
			product.setPbzq(fileUpload.getString("goodsbzq"));
			product.setPweight(fileUpload.getString("goodsweight"));
			product.setPvalume(fileUpload.getString("goodsvalume"));
			product.setFeature(StringHandler.StringFormat(fileUpload.getString("goodsfeature")));
			productService.addP(product);
			returninfo = "<script>alert('添加成功')</script>";
		} catch (Exception e) {
			returninfo = "<script>alert('添加失败')</script>";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
