package jk.o1office.ht.service.impl;

import java.util.List;

import jk.o1office.ht.dao.ComplainDao;
import jk.o1office.ht.domin.Complain;
import jk.o1office.ht.service.ComplainService;
import jk.o1office.ht.utils.JSONHandler;

public class ComplainServiceImpl implements ComplainService{
	private ComplainDao complainDao;
	public ComplainDao getComplainDao() {
		return complainDao;
	}
	public void setComplainDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}
	
	public String getComplain() throws Exception {
		List<Complain> complains = complainDao.getComplain();
		return JSONHandler.ArrayToJson(complains);
	}
}
