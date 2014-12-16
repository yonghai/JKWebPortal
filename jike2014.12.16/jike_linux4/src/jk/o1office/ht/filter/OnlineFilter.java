package jk.o1office.ht.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OnlineFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("onLineFilter doFilter...........");
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		request.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter printWriter = response.getWriter();
		HttpSession session = request.getSession();
		String url = request.getRequestURL().toString();
		System.out.println("访问的页面是："+url+"   "+session.getAttribute("usertype")+"  "+session.getAttribute("username"));
		if(null==session ||
				null==session.getAttribute("username") ||
				"".equals(session.getAttribute("username").toString())){
		//	response.sendRedirect("/jike/login.jsp");
			printWriter.println("<script>window.open('/jike/login.jsp','_top')</script>");
		}else{
			if(session.getAttribute("usertype")==null ||
					session.getAttribute("usertype").toString().equals("")){
			//	response.sendRedirect("/jike/login.jsp");
				printWriter.println("<script>window.open('/jike/login.jsp','_top')</script>");
			}else
				if(url.contains("/common/")){
					if(session.getAttribute("usertype").toString().equals("0")){
						chain.doFilter(req, resp);
					}else{
					//	response.sendRedirect("/jike/login.jsp");
						printWriter.println("<script>window.open('/jike/login.jsp','_top')</script>");
					}
				}else if(url.contains("/operate/")){
					if(session.getAttribute("usertype").toString().equals("1")){
						chain.doFilter(request, response);
					}else{
					//	response.sendRedirect("/jike/login.jsp");
						printWriter.println("<script>window.open('/jike/login.jsp','_top')</script>");
					}
				}else if(url.contains("/super/")){
					if(session.getAttribute("usertype").toString().equals("2")){
						chain.doFilter(request, response);
					}else{
					//	response.sendRedirect("/jike/login.jsp");
						printWriter.println("<script>window.open('/jike/login.jsp','_top')</script>");
					}
				}
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("onLineFiter init.......");
	}

}
