package jk.o1office.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import jk.o1office.service.DeviceService;

public class OnlineFilter implements Filter {
	private DeviceService deviceService;
	public DeviceService getDeviceService() {
		return deviceService;
	}
	public void setDeviceService(DeviceService deviceService) {
		this.deviceService = deviceService;
	}

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = resp.getWriter();
		String token = request.getParameter("token");
		String device_id = request.getParameter("device_id");
		if(null==token || token.equals("") || !deviceService.isOnline(token)){
			printWriter.println("{\"success\":false,\"emsg\":\"请先登录!\",\"token\":\"\"}");
		}else
			chain.doFilter(req, resp);
	} 

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
