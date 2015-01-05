package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.domin.DeviceInfo;
import jk.o1office.excetion.NullException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.service.DeviceInfoService;
import jk.o1office.validator.Validator;
/**
 * 提交设备信息
 * 用户打开软件时，将用的设备信息上传到服务端存入数据库
 */
public class SubmitDeviceInfo extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.registration.servlet.SubmitDeviceInfo");
	private DeviceInfoService deviceInfoService; 
	private Validator validator;
	public DeviceInfoService getDeviceInfoService() {
		return deviceInfoService;
	}
	public void setDeviceInfoService(DeviceInfoService deviceInfoService) {
		this.deviceInfoService = deviceInfoService;
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
		DeviceInfo deviceInfo = new DeviceInfo();
		String returninfo = "", token = "";
		deviceInfo.setCreateTime(new Date());
		try {
			token = validator.isNull(req.getParameter("token"), "token");
			deviceInfo.setDevice_id(req.getParameter("device_id"));
			deviceInfo.setDevice_type(validator.isNull(req.getParameter("device_type"), "device_type"));
			deviceInfo.setDevice_resolution(validator.isNull(req.getParameter("device_resolution"), "device_resolution"));
			deviceInfo.setDevice_screen(validator.isNull(req.getParameter("device_screen"), "device_screen"));
			deviceInfo.setDevice_os_version(validator.isNull(req.getParameter("device_os_version"), "device_os_version"));
			deviceInfo.setDevice_os(validator.isNull(req.getParameter("device_os"), "device_os"));
			deviceInfo.setDevice_hardware_vendors(validator.isNull(req.getParameter("device_hardware_vendors"), "device_hardware_vendors"));
			deviceInfo.setDevice_detail_info(validator.isNull(req.getParameter("device_detail_info"), "device_detail_info"));
			deviceInfo.setDevice_mac(validator.isNull(req.getParameter("device_mac"), "device_mac"));
			deviceInfo.setDevice_name(req.getParameter("device_name"));
//			deviceInfo.setToken(token);
			returninfo = deviceInfoService.save(deviceInfo,token);
		} catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			logger.error(e);
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"未知错误\",\"token\":\""+token+"\"}";
			logger.error(e);
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
