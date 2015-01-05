package jk.o1office.ad.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.validation.Validator;

import org.apache.log4j.Logger;

import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.log.MyLog;
import jk.o1office.log.OperateType;
import jk.o1office.service.AdvertiseService;

/**
 * 	客户端接口
 *	促销广告
 *	初始化软件时获取4个不同位置的广告信息
 *	促销信息包括商品列表，商品详情，web页面3类
 *	参数已验证
 */
public class Advertisement extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ad.servlet.Advertisement");
	private AdvertiseService advertiseService;
	public AdvertiseService getAdvertiseService() {
		return advertiseService;
	}
	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
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
		String token = "";
		try {
			int isshow = Integer.parseInt(req.getParameter("isshow"));
			token = req.getParameter("token");
			String deviceid = req.getParameter("device_id");
			returninfo = advertiseService.getAdvers1(isshow,token);
		} catch(NumberFormatException e){
			returninfo = "{\"success\":false,\"emsg\":\"参数错误\",\"token\":\""+token+"\",\"data\":\"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} catch (Exception e) {
			returninfo = "{\"success\":false,\"emsg\":\"加载失败\",\"token\":\""+token+"\",\"data\":\"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
