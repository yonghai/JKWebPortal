package jk.o1office.cache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//未接订单的缓存类
public class OrderCache implements Serializable{
	private String orderid;
	private List<Integer> shopsIds = new ArrayList<Integer>();
	private Date endtime;
	/*private boolean isSend = true;			//是否发送短信
	public boolean isSend() {
		return isSend;
	}
	public void setSend(boolean isSend) {
		this.isSend = isSend;
	}*/
	public OrderCache(List<Integer> shopsIds,Date endtime) {
		this.shopsIds = shopsIds;
		this.endtime = endtime;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public List<Integer> getShopsIds() {
		return shopsIds;
	}
	public void setShopsIds(List<Integer> shopsIds) {
		this.shopsIds = shopsIds;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	@Override
	public String toString() {
		return endtime+"   "+shopsIds+"  ";
	}
}
