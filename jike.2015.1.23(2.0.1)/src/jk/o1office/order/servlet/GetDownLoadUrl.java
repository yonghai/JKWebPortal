package jk.o1office.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.utils.ExceptionInfo;

import com.qiniu.api.config.Token;

/*获取私有空间的下载地址*/
public class GetDownLoadUrl extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String token = req.getParameter("token");
		String deviceid = req.getParameter("device_id");
		String accessurl = "",returninfo = "";
		try {
			String name = req.getParameter("name");
			accessurl = Token.getDownLoadToken(name);
			returninfo = "{\"success\":true,\"emsg\":\"文件地址\",\"accessurl\":\""+accessurl+"\",\"token\":\""+token+"\"}";
		} catch (Exception e) {
			returninfo = "{\"success\":true,\"emsg\":\"异常错误\",\"accessurl\":\""+accessurl+"\",\"token\":\""+token+"\"}";
			e.printStackTrace();
			e.printStackTrace(ExceptionInfo.pout());
		} finally{
			printWriter.println(returninfo);
		}
	}
}
