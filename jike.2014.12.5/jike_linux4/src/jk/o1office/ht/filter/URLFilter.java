package jk.o1office.ht.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jk.o1office.ht.domin.URLInfo;
import jk.o1office.ht.utils.URLCache;

/**
 *
 */
public class URLFilter implements Filter {
	private URLCache urlCache = null;
	private HttpSession session = null;
	private List<URLInfo> urlinfos = null;
	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		session = request.getSession(true);
		if(session.isNew()){
			response.sendRedirect("/jike/login.jsp");
		}else{
		/*	String name = session.getAttribute("username").toString();
			URLInfo urlinfo = new URLInfo();
			urlinfo.setContent(request.getRequestURL().toString());
			urlinfo.setTime(new Date().toLocaleString());
			urlCache.setAttr("urlinfo", urlinfo, name);
			urlCache.flush(name);*/
			chain.doFilter(req, resp);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		urlCache = URLCache.newInstance();
		System.out.println("URLFilter init ....");
	}

}
