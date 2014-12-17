package jk.o1office.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.ReceiveBillDao;
import jk.o1office.domin.ReceiveBillH;
import jk.o1office.domin.ReceiveBillItemH;
import jk.o1office.excetion.TokenException;
import jk.o1office.service.ReceiveBillService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

public class ReceiveBillServiceImpl implements ReceiveBillService {
	private ReceiveBillDao receiveBillDao;
	public ReceiveBillDao getReceiveBillDao() {
		return receiveBillDao;
	}
	public void setReceiveBillDao(ReceiveBillDao receiveBillDao) {
		this.receiveBillDao = receiveBillDao;
	}
	
	/**
	 * 	
	 */
	public String getReceiceBill(int pagesize, int offset, String time, String token)throws Exception {
		List<ReceiveBillH> receivebills = receiveBillDao.getReceiveBill(pagesize,offset,time,IDGenertor.getUserID(token));
		return JsonHandler.MapToJson(getMap(true,"接单列表",token,receivebills));
	}
	
	private Map getMap(boolean iscuss,String emsg,String token,Object data){
		Map map = new HashMap();
		map.put("success", iscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", data);
		return map;
	}
	
	
	public String getReceBillDec(String orderid, String token) throws TokenException,Exception{
		List<ReceiveBillItemH> receivebillitems = receiveBillDao.getReceiveBDec(orderid, IDGenertor.getUserID(token));
		return JsonHandler.MapToJson(getMap(true, "订单详情", token, receivebillitems));
	}
}
