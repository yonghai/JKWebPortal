package jk.o1office.ht.operate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.Shops;
import jk.o1office.ht.service.ShopsService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.utils.FileUpload;
import jk.o1office.ht.validator.TelValidator;
import jk.o1office.ht.validator.Validator;
// linux and wondows
public class EditShops extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.operate.servlet.EditShops");
	private ShopsService shopsService;
	private FileUpload fileUpload;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public FileUpload getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
	}
	public ShopsService getShopsService() {
		return shopsService;
	}
	public void setShopsService(ShopsService shopsService) {
		this.shopsService = shopsService;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
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
		String returninfo = "";
		try {
			fileUpload.parse(req);
			Shops shops = new Shops();
			shops.setId(Integer.parseInt(validator.isNumber(fileUpload.getString("id"))));
			shops.setSheng(validator.isNullStr(fileUpload.getString("sheng"),""));
			shops.setShi(validator.isNullStr(fileUpload.getString("shi"),""));
			shops.setArea(validator.isNullStr(fileUpload.getString("area"),""));
			shops.setBossname(validator.isNullStr(fileUpload.getString("bossname"),""));
			shops.setBosstel(TelValidator.isMobile(fileUpload.getString("bosstel")));
			shops.setShopname(validator.isNullStr(fileUpload.getString("shopname"),""));
			shops.setShoptel(TelValidator.isMobile(fileUpload.getString("shoptel")));
			shops.setShopaddr(validator.isNullStr(fileUpload.getString("shopaddr"),""));
			shops.setCreatetime(new Date());
		//	shops.setShopimg(fileUpload.getPath().substring(fileUpload.getPath().indexOf("\\")+1));
			shops.setShopimg(fileUpload.getPath().replace("/jike/", ""));	//linux
			returninfo = shopsService.editShops(shops);
		} catch (Exception e) {
			returninfo = "编辑商家失败";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
