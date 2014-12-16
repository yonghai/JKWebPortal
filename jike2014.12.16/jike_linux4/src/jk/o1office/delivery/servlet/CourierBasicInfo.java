package jk.o1office.delivery.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.domin.DeliveryUser;
import jk.o1office.excetion.DuserReisterException;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.UserService;
import jk.o1office.utils.FileUpload;
import jk.o1office.validator.IDCardValidator;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

/**
 * 配送端填写信息
 */
public class CourierBasicInfo extends HttpServlet {
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
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String deviceid = req.getParameter("device_id");
		String returninfo = "";
		String token = "";
		DeliveryUser duser = new DeliveryUser();
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			duser.setUsername(validator.isNull(req.getParameter("name"), "name"));
			duser.setShop_id(Integer.parseInt(validator.isNumber(req.getParameter("shopid"))));
			duser.setTelphone(TelValidator.isMobile(validator.isNull(req.getParameter("mobilenumber"), "mobilenumber")));
			duser.setIdnumber(IDCardValidator.IDCardValidate(req.getParameter("idnumber")));
			String photo = req.getParameter("photo");
			fileUpload.parse(photo,duser.getIdnumber());
			returninfo = userService.updateInfo(duser,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式错误\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		}catch(DuserReisterException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"注册超时，请重新注册\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"异常错误\"}";
		//	e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
			ExceptionInfo.pout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
