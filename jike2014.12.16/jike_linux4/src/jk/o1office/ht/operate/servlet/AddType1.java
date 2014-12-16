package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.ProductCategory;
import jk.o1office.ht.finals.Constant;
import jk.o1office.ht.service.ProductCategoryService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.utils.FileUpload;
import jk.o1office.ht.validator.Validator;

import org.apache.log4j.Logger;
import org.springframework.dao.DataIntegrityViolationException;

public class AddType1 extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet");
	private FileUpload fileUpload;
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
	public FileUpload getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
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
			String typename = validator.isNullStr(fileUpload.getString("typename"),"");
			String typedesc = validator.isNullStr(fileUpload.getString("typedescript"),"");
			String imgpath = fileUpload.getPath();
			ProductCategory pc = new ProductCategory();
		//	pc.setCategoryimg(imgpath.replace("e:\\jike\\", "")); //windows
			pc.setCategoryimg(Constant.IMGURL+imgpath.replace("/jike/", "")); //linux
			pc.setCategoryname(typename);
			pc.setDescript(typedesc);
			pc.setPid(-1);
		//	pc.setLevel(0);
			returninfo = productCategoryService.save(pc);
		//	FileUtil.reNameTo(imgpath, typename);
		} catch(DataIntegrityViolationException e){
			returninfo = "<script>alert('该分类已经存在')</script>";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} catch (Exception e) {
			returninfo = "<script>alert('添加分类失败')</script>";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
