package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import jk.o1office.ht.dao.OrderDao;
import jk.o1office.ht.domin.MyOrderDetails;
import jk.o1office.ht.domin.Order;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class OrderDaoImpl implements OrderDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public int count(int billstatus) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createQuery("select count(*) from Order o where o.billstatus="+billstatus)
				.uniqueResult()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrder(final int offset, final int rows, final int billstatus) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Order o where o.billstatus="+billstatus)
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	
	public void delOrder(int id, int status) {
		Session session = hibernateTemplate
		.getSessionFactory()
		.getCurrentSession();
		session.createSQLQuery("delete from bill_items  where orderid = (select orderid from bill where id="+id+")").executeUpdate();
		Order o = new Order();
		o.setId(id);
		hibernateTemplate.delete(o);
	}
	
	public int count(int billstatus, String name) {
		int count = ((Long)hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createQuery("select count(*) from Order o where o.billstatus="+billstatus+" and o.orderid like '%"+name+"%'")
				.uniqueResult()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrder(final int offset, final int rows, final int billstatus,
			final String name) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Order o where o.billstatus="+billstatus+" and o.orderid like '%"+name+"%'")
				.setFirstResult(offset)
				.setMaxResults(rows).list();
			}
		});
	}
	/*
	public List<OrderDetails> getDetails(String orderid) {
		return hibernateTemplate.find("from OrderDetails od where od.orderid='"+orderid+"'");
	}*/
	
	@SuppressWarnings("unchecked")
	public List<MyOrderDetails> getDetails(String orderid) throws Exception{
		return hibernateTemplate
		.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select b.orderid,bi.product_id,bi.product_price,bi.product_number,p.product_name from bill b,bill_items bi,product p where b.orderid=bi.orderid and bi.product_id=p.id and b.orderid='"+orderid+"'").
		setResultTransformer(Transformers.aliasToBean(MyOrderDetails.class))
		.list();
	}
	
	//date(regdate)   =   curdate(); 
	public List getOrderCount(String time) {
		List list = null;
		String sql = null;
		if(time.equals("30")){
			sql = "select o.billstatus,count(*) from Order o group by o.billstatus";
			list = hibernateTemplate.find(sql);
		}else{
			sql = "select bill_status,count(*) from bill where date(createtime)=curdate() group by bill_status";
			list = hibernateTemplate.getSessionFactory()
			.getCurrentSession()
			.createSQLQuery(sql)
			.list();
		}
		return list;
	}
}
	
