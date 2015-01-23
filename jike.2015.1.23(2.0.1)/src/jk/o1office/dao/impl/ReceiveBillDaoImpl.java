package jk.o1office.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import jk.o1office.dao.OrderDao;
import jk.o1office.dao.ReceiveBillDao;
import jk.o1office.domin.CancelBill;
import jk.o1office.domin.Order;
import jk.o1office.domin.ReceiveBill;
import jk.o1office.domin.ReceiveBillH;
import jk.o1office.domin.ReceiveBillItemH;
import jk.o1office.domin.UnFinshOrder;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class ReceiveBillDaoImpl implements ReceiveBillDao {
	private HibernateTemplate hibernateTemplate;
	private OrderDao orderDao;
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
	/**
	 * 按时间顺序排序
	 */
	@SuppressWarnings("unchecked")
	public List<ReceiveBillH> getReceiveBill(final int pagesize,final int offset, final String time, final int userID) {
		if(time.equals("1"))
			return hibernateTemplate.executeFind(new HibernateCallback<List<ReceiveBillH>>() {
				public List<ReceiveBillH> doInHibernate(Session session)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select d.orderid,d.createtime,d.status,b.total_price,b.deliveryprice,b.ordertype from dreceviebill d,allorder b where d.deliveryid="+userID+
							" and d.orderid=b.orderid order by d.createtime desc")
					.setFirstResult(offset)
					.setMaxResults(pagesize)
					.setResultTransformer(Transformers.aliasToBean(ReceiveBillH.class))
					.list();
				}
			});
		else
			return hibernateTemplate.executeFind(new HibernateCallback<List<ReceiveBillH>>() {
				public List<ReceiveBillH> doInHibernate(Session session)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select d.orderid,d.createtime,d.status,b.total_price,b.deliveryprice,b.ordertype from dreceviebill_history d,allorder_history b where d.deliveryid="+userID+
							" and d.orderid=b.orderid order by d.createtime desc")
					.setFirstResult(offset)
					.setMaxResults(pagesize)
					.setResultTransformer(Transformers.aliasToBean(ReceiveBillH.class))
					.list();
				}
			});
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getReceiveBDec(String orderid, int userID) {
		return hibernateTemplate.find("from Order o where o.orderid='"+orderid+"'");
	}
	
	public void saveSubmitBill(String orderid, int userid, int ordertype) {
		ReceiveBill receicebill = new ReceiveBill();
		receicebill.setOrderid(orderid);
		receicebill.setCreatetime(new Date());
		receicebill.setDeliveryid(userid);
		receicebill.setStatus(1);
		receicebill.setOrdertype(ordertype);
		receicebill.setReason("");
		hibernateTemplate.save(receicebill);
	}
	
	@Deprecated
	public void deleteBill(String orderid) {
	//	hibernateTemplate.bulkUpdate("delete from ReceiveBill rb where rb.orderid='"+orderid+"'");
	//	hibernateTemplate.bulkUpdate("delete from ReceiveBillItem rbi where rbi.orderid='"+orderid+"'");
	}
	
	@Deprecated
	public void moveBillToCancelBill(String orderid,String reason) {
		List<ReceiveBill> receiveBills = hibernateTemplate.find("from ReceiveBill rb where rb.orderid='"+orderid+"'");
		if(receiveBills.size()>0){
			CancelBill cancelBill = new CancelBill();
			cancelBill.setOrderid(receiveBills.get(0).getOrderid());
			cancelBill.setDeliveryid(receiveBills.get(0).getDeliveryid());
			cancelBill.setReason(reason);
			cancelBill.setCreatetime(new Date());
			hibernateTemplate.save(cancelBill);
		}
	}
	/**
	 * 配送员取消接单时更改状态及填写原因
	 */
	public void cancelReceiveBill(String orderid, String reason) {
		hibernateTemplate.bulkUpdate("update ReceiveBill rb set rb.status=0, rb.reason='"+reason+"' where rb.orderid='"+orderid+"'");
	}
	
	public void updateReceivedBillStatus(String orderid, int status) {
		hibernateTemplate.bulkUpdate("update ReceiveBill rb set rb.status="+status+" where rb.orderid='"+orderid+"'");
	}
	
	public void failtureReceiveBill(String orderid, String reason) {
		hibernateTemplate.bulkUpdate("update ReceiveBill rb set rb.status=3, rb.reason='"+reason+"' where rb.orderid='"+orderid+"'");
	}
	
	public int getTodayNum(int userid) {
		String sql = "select count(*) from dreceviebill where deliveryid="+userid+" and status=2 and to_days(createtime)=to_days(now())";
		int num = Integer.parseInt(hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery(sql).uniqueResult()+"");
		return num;
	}
	
	/*
	 * 根据用户订单的时间，不是配送员接单的时间
	 */
	public String getTodayPrice(int userid) {
		String sql = "select sum(total_price) from allorder where deliveryid="+userid+" and bill_status=2 and to_days(createtime)=to_days(now())";
		String price = hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery(sql).uniqueResult()+"";
		if(price.equals("null") || price.equals("NULL")){
			price = "0";
		}
		return price;
	}
	
	public boolean hasHandlerOrder(int userid) {
		List list = hibernateTemplate.find("from ReceiveBill rb where rb.deliveryid="+userid+" and rb.status=1");
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public boolean isCancled(String orderid, int userID) {
		List list = hibernateTemplate.find("from ReceiveBill rb where rb.deliveryid="+userID+" and rb.status=0 and rb.orderid='"+orderid+"'");
		if(list.size()>0)
			return true;
		return false;
	}
	
	public int getBillStatus(String orderid) {
		List<ReceiveBill> bills = hibernateTemplate.find("from ReceiveBill rb where rb.orderid='"+orderid+"'");
		if(bills.size()>0)
			return bills.get(0).getStatus();
		return -1;
	}

	public void updateReceiveDeliveryID(String orderid, int userid) {
		hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createQuery("update ReceiveBill rb set rb.deliveryid="+userid+" where rb.orderid='"+orderid+"'")
		.executeUpdate();
	}
}
