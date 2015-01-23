package jk.o1office.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qiniu.api.config.Token;

public class GetUploadToken extends HttpServlet{

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
		String token = req.getParameter("token");
		String deviceid = req.getParameter("device_id");
		String uptoken = "",returninfo = "";
		try {
			uptoken = Token.getUpToken();
			returninfo = "{\"success\":true,\"emsg\":\"uptoken\",\"uptoken\":\""+uptoken+"\",\"token\":\""+token+"\"}";
		} catch (Exception e) {
			 returninfo = "{\"success\":true,\"emsg\":\"异常错误\",\"uptoken\":\""+uptoken+"\",\"token\":\""+token+"\"}";
			e.printStackTrace();
		} finally{
			printWriter.println(returninfo);
		}
	}
}
