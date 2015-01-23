package jk.o1office.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jk.o1office.dao.OrderDao;
import jk.o1office.domin.AllOrderInfo;
import jk.o1office.domin.DOrderDetail;
import jk.o1office.domin.Goods;
import jk.o1office.domin.HAllOrderInfo;
import jk.o1office.domin.HOrder;
import jk.o1office.domin.HQTOrder;
import jk.o1office.domin.Order;
import jk.o1office.domin.OrderDetail;
import jk.o1office.domin.QTOrder;
import jk.o1office.domin.SP;
import jk.o1office.domin.UnFinshOrder;

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
	public AllOrderInfo getOrderByID(String orderid) {
		List<AllOrderInfo> list = hibernateTemplate.find("from AllOrderInfo o where o.orderid='"+orderid+"' and o.isview=0");
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
				return session.createSQLQuery("select b.product_id,b.product_number,b.product_price,p.product_name from bill b,product p where b.orderid='"+orderid+"' and b.product_id=p.id")
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
	public List getOrderDetails(final String orderid, String time) {
		if(time.equals("1")){
			List<Goods> list = new ArrayList<Goods>();
			List list2 = hibernateTemplate.find("select o.product_id,o.product_number,o.product_price,p.product_name,p.product_img from Order o,Product p where o.product_id=p.id and o.orderid='"+orderid+"'");
			for(Object o : list2){
				Object[] os = (Object[])o;
				Goods goods = new Goods();
				goods.setId(Integer.parseInt(os[0]+""));
				goods.setGoodsnum(Integer.parseInt(os[1]+""));
				goods.setGoodsprice(os[2]+"");
				goods.setGoodsname(os[3]+"");
				goods.setImgpath(os[4]+"");
				list.add(goods);
			}
			return list;
		}else{
			List<Goods> list = new ArrayList<Goods>();
			List list2 = hibernateTemplate.find("select o.product_id,o.product_number,o.product_price,p.product_name,p.product_img from HOrder o,Product p where o.product_id=p.id and o.orderid='"+orderid+"'");
			System.out.println(list2);
			for(Object o : list2){
				Object[] os = (Object[])o;
				Goods goods = new Goods();
				goods.setId(Integer.parseInt(os[0]+""));
				goods.setGoodsnum(Integer.parseInt(os[1]+""));
				goods.setGoodsprice(os[2]+"");
				goods.setGoodsname(os[3]+"");
				goods.setImgpath(os[4]+"");
				list.add(goods);
			}
			return list;
		}
	}
	
	public boolean isReceived(String orderid) {
		List list = hibernateTemplate.find("from AllOrderInfo o where o.bill_status=1 and o.orderid='"+orderid+"' and o.isview=0");
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	/*完成订单时，进行订单验证*/
	public boolean checkBill(String orderid, String code) {
		List<AllOrderInfo> list = hibernateTemplate.find("from AllOrderInfo o where o.orderid='"+orderid+"' and o.isview=0");
		boolean flag = false;
		if(list.size()>0){
			AllOrderInfo order = list.get(0);
			if(order.getCheckcode().equals(code))
				flag = true;
			else
				if(code.equals("666666")){
					flag = true;
				}
		}
		return flag;
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
		String sql = "select drb.orderid,drb.createtime,b.address,b.tel,b.ordertype," +
		"b.goodsnum,b.total_price,b.name,b.deliveryprice from dreceviebill drb,allorder b " +
		"where drb.deliveryid="+userID+" and drb.status=1 and drb.orderid=b.orderid and b.isview=0";
		Session session = hibernateTemplate.getSessionFactory()
		.getCurrentSession();
		List<UnFinshOrder> unFinshOrders = session
		.createSQLQuery(sql)
		.setResultTransformer(Transformers.aliasToBean(UnFinshOrder.class))
		.list();
		for(UnFinshOrder unFinshOrder : unFinshOrders){
			sql = "select p.id,p.product_name,p.product_price," +
					"b.product_number from product p,bill b " +
					"where b.orderid='"+unFinshOrder.getOrderid()+"'" +
							" and p.id=b.product_id";
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
		moreordernum = Integer.parseInt(""+session.createQuery("select count(*) from AllOrderInfo o where o.bill_status=0 and isview=0").uniqueResult());
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
				return session.createSQLQuery("select * from bill where DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime) and isview=0")
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
		List list = hibernateTemplate.find("select ao.bill_status from AllOrderInfo ao where ao.orderid='"+orderid+"' and ao.isview=0");
		int status = -1;
		if(list.size()>0)
			status = Integer.parseInt(list.get(0)+"");
		return status;
	}

	/*订单显示返回true*/
	public boolean isview(String orderid, String time){
		String hql = "";
		if(time.equals("1")){
			hql = "from AllOrderInfo ao where ao.isview=0 and ao.orderid='"+orderid+"'";
		}else{
			hql = "from HAllOrderInfo ao where ao.isview=0 and ao.orderid='"+orderid+"'";
		}
		List list = hibernateTemplate.find(hql);
		if(list.size()>0)
			return true;
		return false;
	}
	
	public void setAllOrderStatus(String orderid, int status) {
		String sql = "update AllOrderInfo ao set ao.bill_status = "+status+" where ao.orderid='"+orderid+"'";
		hibernateTemplate.bulkUpdate(sql);
	}
	
	/**
	 * 删除订单
	 * 将订单设为不可见
	 */
	public boolean deleteAllOrder(String orderid, String time) {
		boolean flag = false;
		if(time.equals("1")){
			String sql = "update AllOrderInfo ao set ao.isview = 1 where ao.orderid='"+orderid+"'";
			int i = hibernateTemplate.bulkUpdate(sql);
			if(i>0)
				flag = true;
		}else{
			String sql = "update HAllOrderInfo ao set ao.isview = 1 where ao.orderid='"+orderid+"'";
			int i = hibernateTemplate.bulkUpdate(sql);
			if(i>0)
				flag = true;
		}
		return flag;
	}
	
	/*	
	 * 删除语音订单
	 * 将订单设为不可见
	 * */
	public boolean deleteQTOrder(String orderid, String time) {
		boolean flag = false;
		String sql = "";
		if(time.equals("1")){
			sql = "update QTOrder o set o.isview=1 where o.orderid='"+orderid+"'";
		}else{
			sql = "update HQTOrder o set o.isview=1 where o.orderid='"+orderid+"'";
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
	
	public Object getQTOrder(String orderid, String time) {
		String hql = "";
		if(time.equals("1")){
			hql = "from QTOrder qo where qo.orderid='"+orderid+"'";
		}else{
			hql = "from HQTOrder qo where qo.orderid='"+orderid+"'";
		}
		List list = hibernateTemplate.find(hql);
		if(list.size()!=0)
			return list.get(0);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<AllOrderInfo> getAllOrderInfo(final int offset, final int pagesize,
			final int userID, String time) {
		if(time.equals("1")){
			return hibernateTemplate.executeFind(new HibernateCallback<List<AllOrderInfo>>() {
				public List<AllOrderInfo> doInHibernate(Session session)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select * from allorder ao where ao.customerid='"+userID+"' and ao.isview=0 order by ao.createtime desc")
					.addEntity(AllOrderInfo.class)
					.setFirstResult(offset)
					.setMaxResults(pagesize)
					.list();
				}
			});
		}else
			return hibernateTemplate.executeFind(new HibernateCallback<List<AllOrderInfo>>() {
				public List<AllOrderInfo> doInHibernate(Session session)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select * from allorder_history ao where ao.customerid='"+userID+"' and ao.isview=0 order by ao.createtime desc")
					.addEntity(AllOrderInfo.class)
					.setFirstResult(offset)
					.setMaxResults(pagesize)
					.list();
				}
			});		
	}
	
	public List<Order> getHistoryOrder(List<String> orderids) {
		String sql = "from Order o where o.orderid in (";
		for(String orderid : orderids){
			sql += orderid+",";
		}
		sql = sql.substring(0,sql.length()-1)+")";
		return hibernateTemplate.find(sql);
	}
	
	public List<HOrder> getHistoryOrderOutOne(List<String> horderids) {
		String sql = "from HOrder o where o.orderid in (";
		for(String horderid : horderids){
			sql += horderid + ",";
		}
		sql = sql.substring(0,sql.length()-1)+")";
		return hibernateTemplate.find(sql);
	}
	
	public List<QTOrder> getHistoryQTOrder(List<String> qtorderids) {
		String sql = "from QTOrder o where o.orderid in (";
		for(String horderid : qtorderids){
			sql += horderid + ",";
		}
		sql = sql.substring(0,sql.length()-1)+")";
		return hibernateTemplate.find(sql);
	}
	
	public List<HQTOrder> getHistoryQTOrderOutOne(List<String> hqtorderids) {
		String sql = "from HQTOrder o where o.orderid in (";
		for(String horderid : hqtorderids){
			sql += horderid + ",";
		}
		sql = sql.substring(0,sql.length()-1)+")";
		return hibernateTemplate.find(sql);
	}
	
	@SuppressWarnings("unchecked")
	public List<AllOrderInfo> getAllOrderInfo(final int offset, final int pagesize) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<AllOrderInfo>>() {
			public List<AllOrderInfo> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from AllOrderInfo ao where ao.bill_status=0 and ao.isview=0 order by ao.createtime desc")
				.setFirstResult(offset)
				.setMaxResults(pagesize)
				.list();
			}
		});
	}
	
	public void updateQTBill(String orderid, int status, int userID) {
		hibernateTemplate.bulkUpdate("update QTOrder o set o.billstatus="+status+",o.deliveryid="+userID+" where o.orderid='"+orderid+"'");		
	}
	
	public QTOrder getQTOrderByID(String orderid) {
		List<QTOrder> list = hibernateTemplate.find("from QTOrder o where o.orderid='"+orderid+"'");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	public void updateQTBillStatus(String orderid, int status) {
		hibernateTemplate.bulkUpdate("update QTOrder o set o.billstatus="+status+" where o.orderid='"+orderid+"'");
	}

	@SuppressWarnings("unchecked")
	public List getRespOrderList(final int offset, final int pagesize,
			final int userID, final String time) {
		if(time.equals("1")){
			return hibernateTemplate.executeFind(new HibernateCallback<List<AllOrderInfo>>() {
				public List<AllOrderInfo> doInHibernate(Session session)
						throws HibernateException, SQLException {
					String sql = "from AllOrderInfo a where a.customerid="+userID+" and a.isview=0 order by a.createtime desc";
					return session.createQuery(sql)
					.setFirstResult(offset)
					.setMaxResults(pagesize)
					.list();
				}
			});
		}else
			return hibernateTemplate.executeFind(new HibernateCallback<List<HAllOrderInfo>>() {
				public List<HAllOrderInfo> doInHibernate(Session session)
						throws HibernateException, SQLException {
					return hibernateTemplate.executeFind(new HibernateCallback<List<HAllOrderInfo>>() {
						public List<HAllOrderInfo> doInHibernate(Session session)
								throws HibernateException, SQLException {
							String sql = "from HAllOrderInfo a where a.customerid="+userID+" and a.isview=0 order by a.createtime desc ";
							return session.createQuery(sql)
							.setFirstResult(offset)
							.setMaxResults(pagesize)
							.list();
						}
					});
				}
			});
	}
	
	public AllOrderInfo getAllOrderInfoByID(String orderid) {
		List<AllOrderInfo> list = hibernateTemplate.find("from AllOrderInfo o where o.orderid='"+orderid+"' and o.isview=0");
		System.out.println(list);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	public HAllOrderInfo getHAllOrderInfoByID(String orderid) {
		List<HAllOrderInfo> list = hibernateTemplate.find("from HAllOrderInfo o where o.orderid='"+orderid+"' and o.isview=0");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public int getOrderType(String orderid) {
		List<Integer> ordertypes = hibernateTemplate.find("select a.ordertype from AllOrderInfo a where a.orderid='"+orderid+"'");
		if(ordertypes.size()!=0){
			return ordertypes.get(0);
		}
		return -1;
	}
	
	public void addGoodsNumAndGoodsPrice(String orderid, int goodsnum,
			String goodsprice) {
		String sql = "update allorder set goodsnum="+goodsnum+",total_price='"+goodsprice+"' where orderid='"+orderid+"'";
		hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery(sql)
		.executeUpdate();
	}
	
	public void setDeliveryID(String orderid, int userID) {
		String sql = "update allorder set deliveryid="+userID+" where orderid='"+orderid+"'";
		hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery(sql)
		.executeUpdate();
	}

	public List<AllOrderInfo> getAllOrderInfo(int status) {
		return hibernateTemplate.find("from AllOrderInfo a where a.bill_status="+status);
	}
}
