package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jk.o1office.domin.DeliveryUser;
import jk.o1office.excetion.DuserReisterException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.UserService;
import jk.o1office.utils.FileUpload;
import jk.o1office.validator.Validator;


/**
 * 上传证件
 */
public class CourierUploadDoc extends HttpServlet {
	private UserService userService;
	private Validator validator;
	private FileUpload fileUpload;
	public FileUpload getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
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
		resp.setContentType("text/html;charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter printWriter = resp.getWriter();
		String token = "", returninfo = "";
		try {
			String device_id = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			String photo = validator.isNull(req.getParameter("photo"), "photo");
			String idnumber = validator.isNull(req.getParameter("idnumber"), "idnumber");
			fileUpload.parse(photo,idnumber);
			DeliveryUser duser = new DeliveryUser();
			duser.setIdnumber(idnumber);
			returninfo = userService.save(duser, null, token);
		} catch(DuserReisterException e){
			returninfo = "{\"success\":false,\"emsg\":\"注册超时，请重新注册\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"上传证件失败\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
