package jk.o1office.ht.listener;
import java.util.Date;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.utils.URLCache;

import org.dom4j.DocumentException;


public class SessionListener implements HttpSessionListener {
	private URLCache urlCache = URLCache.newInstance();
	public void sessionCreated(HttpSessionEvent e) {
		System.out.println("sessioncreated...");
	}
	
	public void sessionDestroyed(HttpSessionEvent e) {
		System.out.println("sessiondestroyed...");
	/*	urlCache.setAttr("logoutTime", new Date().toLocaleString(), e.getSession().getAttribute("username").toString());
		urlCache.flush(e.getSession().getAttribute("username").toString());
		try {
			LoginInfo loginInfo = urlCache.getCacheInfo(e.getSession().getAttribute("username").toString());
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}*/
		/*	List<URLInfo> urlinfos = (List<URLInfo>)urlCache.getAttr(e.getSession().getAttribute("username")+"_urlinfo");
		for(URLInfo ui : urlinfos){
			System.out.println(ui.getStarttime()+"  =  "+ui.getUrl());
		}*/
	}

}
