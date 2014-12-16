package jk.o1office.ht.service.impl;

import jk.o1office.ht.dao.LogDao;
import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.domin.URLInfo;
import jk.o1office.ht.service.LogService;
import jk.o1office.ht.utils.URLCache;

public class LogServiceImpl implements LogService{
	private LogDao logDao;
	private URLCache urlCache = URLCache.newInstance();
	public LogDao getLogDao() {
		return logDao;
	}
	public void setLogDao(LogDao logDao) {
		this.logDao = logDao;
	}
	
	public void logout(String name) throws Exception {
		LoginInfo loginInfo = urlCache.getCacheInfo(name);
		loginInfo.setAdminName(name);
		logDao.saveLog(loginInfo);
		urlCache.removeCache(name);
	}
}

