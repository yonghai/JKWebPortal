package jk.o1office.service.impl;

import jk.o1office.dao.ComplainDao;
import jk.o1office.domin.Complain;
import jk.o1office.service.ComplainService;

public class ComplainServiceImpl implements ComplainService{
	private ComplainDao complainDao;
	public ComplainDao getComplainDao() {
		return complainDao;
	}
	public void setComplainDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}
	
	public String saveComplain(Complain complain, String token)throws Exception {
		if(complainDao.save(complain)){
			return "{\"success\":true,\"emsg\":\"添加成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"添加失败\",\"token\":\""+token+"\"}";
	}
}
