package jk.o1office.address.servlet;

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
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.AddressService;
import jk.o1office.validator.Validator;

/**
 *	删除用户的配送地址
 *	参数已验证
 *	token验证
 */
public class DeleteDeliveryAddress extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.address.servlet.DeleteDeliveryAddress");
	private AddressService addressService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
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
			String id = validator.isNull(req.getParameter("id"), "id");
			token = validator.isNull(req.getParameter("token"), "token");
			returninfo = addressService.deleteAddres(Integer.parseInt(id),token);
			MyLog.newInstance().writeLog(OperateType.UDELADDRESS, FileType.UUSERINFO, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.UDELADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"删除地址出错了\"}";
			MyLog.newInstance().writeLog(OperateType.UDELADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
