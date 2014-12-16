package jk.o1office.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jk.o1office.dao.OrderDao;
import jk.o1office.domin.DOrderDetail;
import jk.o1office.domin.Goods;
import jk.o1office.domin.HOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.OrderDetail;
import jk.o1office.domin.Product;
import jk.o1office.domin.SP;
import jk.o1office.domin.UnFinshOrder;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class OrderDaoImpl implements OrderDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
	public void save(Object o) {
		try {
		
			hibernateTemplate.save(o);
		} catch (Exception e) {
		}
	}
	
	@SuppressWarnings("unchecked")
	public Order getOrderByID(String orderid) {
		List<Order> list = hibernateTemplate.find("from Order o where o.orderid='"+orderid+"'");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<DOrderDetail> getOrderDetails(final String orderid) {
		//return hibernateTemplate.find("from OrderDetail od where od.orderid='"+orderid+"'");
		return hibernateTemplate.executeFind(new HibernateCallback<List<DOrderDetail>>() {
			public List<DOrderDetail> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createSQLQuery("select bi.product_id,bi.product_number,bi.product_price,p.product_name from bill_items bi,product p where bi.orderid='"+orderid+"' and bi.product_id=p.id")
				.setResultTransformer(Transformers.aliasToBean(DOrderDetail.class))
				.list();
			}
		});
	}
	
	/**
	 * 取消order删除order相关记录
	 * 将订单的状态改为3
	 */
	public boolean cancelOrder(String orderid,String time) {
		boolean flag = false;
		String sql = "";
		if(time.equals("1")){
			sql = "update Order o set o.bill_status=3 where o.orderid='"+orderid+"'"; 
		}else{
			sql = "update HOrder o set o.bill_status=3 where o.orderid='"+orderid+"'"; 
		}
		try{
			int c = hibernateTemplate.bulkUpdate(sql);
			flag = true;
		//	if(c>0){
		//		c = hibernateTemplate.bulkUpdate("update OrderDetail od setcd. where od.orderid='"+orderid+"'");
		//		if(c>0)
		//			flag = true;
		//		else 
		//			flag = false;
		//	}else
		//		flag = false;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 根据orderid返回order和orderinfo
	 */
	@SuppressWarnings("unchecked")
	public Object[] getOrderInfoByID(String orderid) {
		List<OrderDetail> orderDetails = null;
		List<Order> orders = hibernateTemplate.find("from Order o where o.orderid='"+orderid+"' and o.isview=0");
		if(orders.size()!=0){
			orderDetails = hibernateTemplate.find("from OrderDetail od where od.orderid='"+orderid+"'");
		}else{
			return new Object[]{};
		}
		return new Object[]{orders.get(0),orderDetails};
	}
	
	
	public void delete(Order order){
		System.out.println("orderid=="+order.getId());
	//	Order o = hibernateTemplate.load(Order.class, order.getId());
	//	System.out.println(o.getAddress());
		hibernateTemplate.delete(order);
	}
	/**
	 * 删除指定订单，不是删除输出哭中记录，
	 * 而是该记录设置为不可看
	 */
	public boolean deleteOrder(String orderid,String time) {
		boolean flag = false;
		String sql = "";
		if(time.equals("1")){
			sql = "update Order o set o.isview=1 where o.orderid='"+orderid+"'";
		}else{
			sql = "update HOrder o set o.isview=1 where o.orderid='"+orderid+"'";
		}
		try{
			int c = hibernateTemplate.bulkUpdate(sql);
			if(c>0)
				flag = true;
			else
				flag = false;
		}catch(Exception e){
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 返回历史order和ordeoinfo
	 */
	public Object[] getHistoryOrderInfo(final int offset) {
		return new Object[]{};
	}

	/**
	 * 查询一个月内的订单
	 */
	@SuppressWarnings("unchecked")
	public List<Order> getHistoryOrder(final int offset,final int pagesize,final long userid) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Order o where o.customer_id="+userid+" and o.isview=0 order by o.createtime desc")
				.setFirstResult(offset)
				.setMaxResults(pagesize).list();
			}
		});
	}
	
	/**
	 * 查询历史订单，超过一个月的时间
	 */
	@SuppressWarnings("unchecked")
	public List<HOrder> getHistoryOrder(final int offset,final int pagesize,final long userid, final int time) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<HOrder>>() {
			public List<HOrder> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(
						//and datediff(current_timestamp(),createtime)>"+30*time
						"from HOrder o where o.customer_id="+userid+" and o.isview=0 order by o.createtime desc"
						).setFirstResult(offset)
						.setMaxResults(pagesize).list();
			}
		});
	}
	
	/**
	 * 配送员获取所有的接单列表
	 */
	@SuppressWarnings("unchecked")
	public List<Order> getOrder(final int pagesize,final int offset) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(
						"from Order o where o.bill_status=0"
						).setFirstResult(offset)
						.setMaxResults(pagesize).list();
			}
		});
	}
	
	/**
	 *	配送员根据所在区域获取接单列表 
	 */
	@SuppressWarnings("unchecked")
	public List<Order> getOrder(final int pagesize, final int offset, final Integer[] addressids) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Order o where o.bill_status=0";
				System.out.println("hql="+hql);
				return session.createQuery(
						hql
						).setFirstResult(offset)
						.setMaxResults(pagesize)
						.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrder1(final int pagesize, final int offset, final Integer[] addressids) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Order o where o.bill_status=0 and o.delivery_address_id in (";
				for(int id : addressids){
					hql += id + ",";
				}
				hql = hql.substring(0,hql.length()-1);
				hql += ")";
				System.out.println("hql="+hql);
				return session.createQuery(
						hql
						).setFirstResult(offset)
						.setMaxResults(pagesize)
						.list();
			}
		});
	}

	
	public void updateBillStatus(String orderid, int status) {
		hibernateTemplate.bulkUpdate("update Order o set o.bill_status="+status+" where o.orderid='"+orderid+"'");
	}

	
	/**
	 * 根据订单id查询订单详情
	 */
	@SuppressWarnings("unchecked")
	public Object[] getOrderDetails(String orderid, String time) {
		List gs = new ArrayList();
		Object[] obj = new Object[2];
		if(time.equals("1")){
			List<Order> orders = hibernateTemplate.find("from Order o where o.orderid='"+orderid+"'");
			if(orders.size()!=0){
				Order o = orders.get(0);
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setExcludes(new String[]{"id","orderid","customer_id","delivery_address_id",
					"delivery_address_stamp","pay_status","pay_type","actual_pay_type","reserved_delivery_time",
					"actual_delivery_time","bill_status","total_price","delivery_id","createtime",
					"lastupdatetime","isview","checkcode","goodsnum"});
				obj[0] = JSONObject.fromObject(o, jsonConfig);
				List<OrderDetail> ods = hibernateTemplate.find("from OrderDetail od where od.orderid='"+orderid+"'");
				for(OrderDetail od : ods){
					Goods goods = new Goods();
					goods.setId(od.getProduct_id());
					goods.setGoodsnum(od.getProduct_number());
					goods.setGoodsprice(od.getProduct_price());
					Product p = hibernateTemplate.get(Product.class, goods.getId());
					goods.setGoodsname(p.getProduct_name());
					goods.setImgpath(p.getProduct_img());
					gs.add(goods);
				}
			}
		}else{
			List<HOrder> hordes = hibernateTemplate.find("from HOrder o where o.orderid='"+orderid+"'");
			if(hordes.size()!=0){
				HOrder o = hordes.get(0);
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setExcludes(new String[]{"id","orderid","customer_id","delivery_address_id",
					"delivery_address_stamp","pay_status","pay_type","actual_pay_type","reserved_delivery_time",
					"actual_delivery_time","bill_status","total_price","delivery_id","createtime",
					"lastupdatetime","isview","checkcode","goodsnum"});
				obj[0] = JSONObject.fromObject(o, jsonConfig);
				List<OrderDetail> ods = hibernateTemplate.find("from OrderDetail od where od.orderid='"+orderid+"'");
				for(OrderDetail od : ods){
					Goods goods = new Goods();
					goods.setId(od.getProduct_id());
					goods.setGoodsnum(od.getProduct_number());
					Product p = hibernateTemplate.get(Product.class, goods.getId());
					goods.setGoodsname(p.getProduct_name());
					goods.setGoodsprice(p.getProduct_price());
					goods.setImgpath(p.getProduct_img());
					gs.add(goods);
				}
			}
		}
		obj[1]= gs;
		return obj;
	}
	
	public boolean isReceived(String orderid) {
		List list = hibernateTemplate.find("from Order o where o.bill_status=1 and o.orderid='"+orderid+"'");
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public boolean checkBill(String orderid, String code) {
		List list = hibernateTemplate.find("from Order o where o.checkcode='"+code+"' and o.orderid='"+orderid+"'");
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public void updateBill(String orderid,int status, int userID) {
		hibernateTemplate.bulkUpdate("update Order o set o.bill_status="+status+",o.delivery_id="+userID+" where o.orderid='"+orderid+"'");
	}
	
	
	@SuppressWarnings("unchecked")
	public List<UnFinshOrder> getUnFinshOrder(final int userID) {
		//"select drb.orderid,drb.createtime,b.address,b.tel,
		//b.goodsnum,b.total_price,p.product_name,p.goods_number,
		//p.product_price from dreceviebill drb,bill b,bill_items 
		//bi,product p where drb.deliveryid="+userID+" and 
		//drb.status=1 and drb.orderid=b.orderid and 
		//b.orderid=bi.orderid and bi.product_id=p.id"
		String sql = "select drb.orderid,drb.createtime,b.address,b.tel," +
		"b.goodsnum,b.total_price,b.name,b.deliveryprice from dreceviebill drb,bill b " +
		"where drb.deliveryid="+userID+" and drb.status=1 and drb.orderid=b.orderid";
		Session session = hibernateTemplate.getSessionFactory()
		.getCurrentSession();
		List<UnFinshOrder> unFinshOrders = session
		.createSQLQuery(sql)
		.setResultTransformer(Transformers.aliasToBean(UnFinshOrder.class))
		.list();
		for(UnFinshOrder unFinshOrder : unFinshOrders){
			sql = "select p.id,p.product_name,p.product_price," +
					"bi.product_number from product p,bill_items bi " +
					"where bi.orderid='"+unFinshOrder.getOrderid()+"'" +
							" and p.id=bi.product_id";
			List<SP> sps = session.createSQLQuery(sql)
			.setResultTransformer(Transformers.aliasToBean(SP.class))
			.list();
			unFinshOrder.setGoodsinfo(sps);
		}
		return unFinshOrders;
	}
	
	/**
	 * 
	 * 查询配送员所在区域还剩多少订单未被处理
	 * 
	 */
	public int getMoreOrderNum(int userid) {
		int moreordernum = 0;
		//获取配送员所属商家的省，市，区域的id
	/*	String sql = "select s.area from shops s where s.id=" +
				"(select d.shop_id from user_delivery d where d.id="+userid+")";
		Session session = hibernateTemplate.getSessionFactory()
										.getCurrentSession();
		List list = session.createSQLQuery(sql).list();
	
		//如果地址不为空
		if(list.size()>0){
			int areaid = Integer.parseInt(list.get(0)+"");
			// and to_days(createtime)=to_days(now())
			sql = "select count(*) from bill b where b.bill_status=0 and b.delivery_address_id in (select u.id from user_customer_delivery_address u where u.area="+areaid+");";
			moreordernum = Integer.parseInt(""+session.createSQLQuery(sql).uniqueResult());
		}*/
		Session session = hibernateTemplate.getSessionFactory()
		.getCurrentSession();
		moreordernum = Integer.parseInt(""+session.createQuery("select count(*) from Order o where o.bill_status=0").uniqueResult());
		return moreordernum;
	}
	
	
	public int getMoreOrderNum1(int userid) {
		int moreordernum = 0;
		//获取配送员所属商家的省，市，区域的id
		String sql = "select s.area from shops s where s.id=" +
				"(select d.shop_id from user_delivery d where d.id="+userid+")";
		Session session = hibernateTemplate.getSessionFactory()
										.getCurrentSession();
		List list = session.createSQLQuery(sql).list();
	
		//如果地址不为空
		if(list.size()>0){
			int areaid = Integer.parseInt(list.get(0)+"");
			// and to_days(createtime)=to_days(now())
			sql = "select count(*) from bill b where b.bill_status=0 and b.delivery_address_id in (select u.id from user_customer_delivery_address u where u.area="+areaid+");";
			moreordernum = Integer.parseInt(""+session.createSQLQuery(sql).uniqueResult());
		}
		return moreordernum;
	}
	 
		public int getMoreOrderNum0(int userid) {
			int moreordernum = 0;
			//获取配送员所属商家的省，市，区域的id
			String sql = "select s.sheng,s.shi,s.area from shops s where s.id=" +
					"(select d.shop_id from user_delivery d where d.id="+userid+")";
			Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
			List list = session.createSQLQuery(sql).list();
			//获取省，市，区域id所对应的名字，组成地址
			sql = "select area_name from area where id in (";
			String address = "";
			if(list.size()>0){
				Object obj = list.get(0);
				Object[] os = (Object[])obj;
				sql += os[0]+","+os[1]+","+os[2]+")";
				List list1 = session.createSQLQuery(sql).list();
				if(list1.size()==3){
					address = list1.get(0)+""+list1.get(1)+""+list1.get(2);
				}
			}
			//如果地址不为空
			if(!address.equals("")){
				// and to_days(createtime)=to_days(now())
				sql = "select count(*) from bill where address like '"+address+"%' and bill_status=0";
				moreordernum = Integer.parseInt(""+session.createSQLQuery(sql).uniqueResult());
			}
			return moreordernum;
		}
	
	//获取订单时间超过一个月的订单
	@SuppressWarnings("unchecked")
	public List<Order> getOutOrder() {
		List<Order> list = hibernateTemplate.executeFind(new HibernateCallback<List<Order>>() {
			public List<Order> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createSQLQuery("select * from bill where DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime)")
				.addEntity(Order.class)
				.list();
			}
		});
		return list;
	}
	
	/**
	 * 获取订单的订单状态
	 * 返回-1时表示无该订单
	 */
	public int getOrderStatus(String orderid) {
		List list = hibernateTemplate.find("select o.bill_status from Order o where o.orderid='"+orderid+"'");
		int status = -1;
		if(list.size()>0)
			status = Integer.parseInt(list.get(0)+"");
		return status;
	}
	
}
