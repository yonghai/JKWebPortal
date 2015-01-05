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
import jk.o1office.log.FileType;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.AddressService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

import org.apache.log4j.Logger;
import org.hibernate.StaleStateException;
import org.springframework.orm.hibernate3.HibernateOptimisticLockingFailureException;

public class UpdateDAddress extends HttpServlet{

	private Logger logger = Logger.getLogger("jk.o1office.address.servlet.UpdateDeliveryAddress");
	private AddressService addressService;
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

	private Validator validator;
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
		PrintWriter printWriter  = resp.getWriter();
		CustomerAddress ca = new CustomerAddress();
		String token = "";
		String returninfo = "";
		try {
			String deviceid = req.getParameter("device_id");
			token = validator.isNull(req.getParameter("token"), "token");
			ca.setAddress(validator.isNull(req.getParameter("address"), "address"));
			ca.setCommunityName(validator.isNullOrNullStr(req.getParameter("communityName"), "communityName"));
			ca.setCountryName(validator.isNullOrNullStr(req.getParameter("countryName"), "countryName"));
			ca.setProvinceName(validator.isNullOrNullStr(req.getParameter("provinceName"), "provinceName"));
			ca.setRegionalName(validator.isNullOrNullStr(req.getParameter("regionalName"), "regionalName"));
			ca.setContact_number(TelValidator.isMobile(validator.isNull(req.getParameter("contact_number"), "contact_number")));
			ca.setContacts(validator.isNull(req.getParameter("contacts"), "contacts"));
			ca.setId(Integer.parseInt(validator.isNull(req.getParameter("id"), "id")));
			ca.setCustomer_id(IDGenertor.getUserID(token));
			ca.setIs_default(0);
			ca.setCreatetime(new Date());
			returninfo = addressService.updateNewAddress(ca,token);
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "success");
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"不能为null\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TokenException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"token错误\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(NumberException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+validator.getName()+"必须位数字\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(TelException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"手机号码格式出错\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(StaleStateException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+e.getMessage()+"\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(HibernateOptimisticLockingFailureException e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\""+e.getMessage()+"\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"token\":\""+token+"\",\"emsg\":\"更新地址出错了\"}";
			MyLog.newInstance().writeLog(OperateType.UUPDATEADDRESS, FileType.UUSERINFO, token, "fail");
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
