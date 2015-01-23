package jk.o1office.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.domin.CustomerAddress;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.NumberException;
import jk.o1office.excetion.TelException;
import jk.o1office.excetion.TokenException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.AddressService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

import org.apache.log4j.Logger;

public class AddDAddress extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.address.servlet.AddDeliveryAddress");
	private AddressService addressService;
	private Validator validator;

	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
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
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = resp.getWriter();
		String token = "";
		String returninfo = "";
		CustomerAddress ca = new CustomerAddress();
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			ca.setArea(0);
			ca.setCommunity(0);
			ca.setAddress(validator.isNull(req.getParameter("address"), "address"));
			ca.setContact_number(TelValidator.isMobile(validator.isNull(req.getParameter("contact_number"), "contact_number")));
			ca.setContacts(validator.isNull(req.getParameter("contacts"), "contacts"));
			ca.setCommunityName(validator.isNullOrNullStr(req.getParameter("communityName"), "communityName"));
			ca.setCountryName(validator.isNullOrNullStr(req.getParameter("countryName"), "countryName"));
			ca.setProvinceName(validator.isNullOrNullStr(req.getParameter("provinceName"), "provinceName"));
			ca.setRegionalName(validator.isNullOrNullStr(req.getParameter("regionalName"), "regionalName"));
			ca.setCreatetime(new Date());
			ca.setIs_default(0);
			ca.setCustomer_id(IDGenertor.getUserID(token));
			returninfo = addressService.saveNewAddress(ca,token);
		}catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token异常\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(NumberException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"只能为数字\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式错误\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"添加默认地址出错了\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
