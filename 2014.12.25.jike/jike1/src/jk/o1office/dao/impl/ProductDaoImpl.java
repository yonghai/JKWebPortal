package jk.o1office.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jk.o1office.dao.ProductDao;
import jk.o1office.domin.Product;
import jk.o1office.domin.ProductCount;
import jk.o1office.domin.ProductRecord;
import jk.o1office.finals.Constant;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.sun.org.apache.commons.collections.Transformer;

public class ProductDaoImpl implements ProductDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/**
	 * 根据类别查询商品信息，支持分页查询
	 */
	@SuppressWarnings("unchecked")
	public List<Product> queryProductByType(final int categoryId, final int offset, final int pagesize) {
		List<Product> products = hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session) throws HibernateException,
					SQLException {
				//ishas 1=有货  ispromotion 1=促销 0=非促销
				Query query = session.createQuery("from Product p where p.ishas=1 and p.ispromotion=0 and p.product_category="+categoryId);
				query.setFirstResult(offset);
				query.setMaxResults(pagesize);
				return query.list();
			}
		});
		return products;
	}
	
	/**
	 * 根据关键字搜索商品
	 */
	@SuppressWarnings("unchecked")
	public List<Product> searchProductByKeyWord(final int offset, final int pagesize,final String keyword) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session)
					throws HibernateException, SQLException {
				//ishas 1=有货  ispromotion 1=促销  0=非促销
				return session.createQuery("from Product p where p.ishas=1 and p.ispromotion=0 and p.product_name like '%"+keyword+"%'")
				.setFirstResult(offset)
				.setMaxResults(pagesize).list();
			}
		});
	}
	
	/**
	 * 返回指定用户id商品记录列表
	 * 当交易完成时菜有购买记录
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProductRecord(final int userid) {
		List<Product> products = hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createSQLQuery("select * from product where id in (select productid from productrecord where userid = "+userid+")").list();
			}
		});
		return products;
	}
	
	/**
	 * 查询销量由高到低的记录商品列表
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getTopProductRecoed() {
		List<Product> products = hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createSQLQuery("select * from product where id in(select pc.productid from (select productid from productcount order by count desc limit 0,10) as pc)").list();
			}
		});
		return products;
	}
	
	/**
	 * 根据条形码搜素商品
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProductByBarCode(String barcode) {
		List<Product> products = hibernateTemplate.find("from Product p where p.ishas=1 and  p.bar_code='"+barcode+"'");
		return products;
	}
	
	/**
	 * 根据商品id查询
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProductByID(int productid) {
		return hibernateTemplate.find("from Product p where p.id ="+productid);
	}
	
	public int getCount(int categoryId) {
		return ((Long)hibernateTemplate.iterate("select count(*) from Product p where p.ishas=1 and p.ispromotion=0 and p.product_category="+categoryId).next()).intValue();
	}
	
	public int getCount(String keyword) {
		return ((Long)hibernateTemplate.iterate("select count(*) from Product p where p.ishas=1 and p.ispromotion=0 and p.product_name like '%"+keyword+"%'").next()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> getProductID(String orderid) {
		return hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select product_id from bill_items where orderid='"+orderid+"'")
		.list();
	}
	
	public void updateProductCount(int productid, int productnum) {
		int i = hibernateTemplate.bulkUpdate("update ProductCount pc set pc.count=pc.count+"+productnum+" where pc.productid="+productid);
		if(i<=0){
			ProductCount productCount = new ProductCount();
			productCount.setCount(productnum);
			productCount.setProductid(productid);
			hibernateTemplate.save(productCount);
		}
	}
	
	public int getCount(String keyword, String where) {
		return ((Long)hibernateTemplate.iterate("select count(*) from Product p where p.ishas=1 and p.product_name like '%"+keyword+"%' and p.id in ("+where+")").next()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> searchProductByKeyWord(final int offset, final int pagesize,
			final String keyword, final String where) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Product p where p.ishas=1 and p.ispromotion=0 and  p.product_name like '%"+keyword+"%' and p.id in ("+where+")")
				.setFirstResult(offset)
				.setMaxResults(pagesize)
				.list();
			}
		});
	}
	
	
	/**
	 * 根据where条件查询商品信息
	 * where是id的值
	 */
	@SuppressWarnings("unchecked")
	public List<Product> queryProductByWhere(final String where, final int offset,
			final int pagesize) {
		List<Product> products = hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Product p where p.ishas=1 and  p.id in ("+where+")");
				query.setFirstResult(offset);
				query.setMaxResults(pagesize);
				return query.list();
			}
		});
		return products;
	}
	
	
	public List<Product> getProductIDs(String[] goodsids) {
		String hql = "from Product p where p.id in (";
		for(String id : goodsids){
			hql += id+",";
		}
		hql = hql.substring(0,hql.length()-1)+")";
		List<Product> products = hibernateTemplate.find(hql);
		return products;
	}

	
	/**
	 * 检查商品的价格是否正确
	 */
	public boolean checkPrice(int productId, String productPrice) {
		List<Product> list = hibernateTemplate.find("from Product p where p.id="+productId);
		//该商品存在
		if(list.size()>0){
			Product product = list.get(0);
			if(Double.parseDouble(product.getProduct_price())==Double.parseDouble(productPrice)){
				return true;
			}
			//促销:ispromotion=1;非促销:ispromotion=0
			/*if(product.getIspromotion()==1){
				if(product.getPromotionprice().equals(productPrice))
					return true;
			}else{
				if(product.getProduct_price().equals(productPrice)){
					return true;
				}
			}*/
		}
		return false;
	}
	
	public int getCountLikeName(String keyword) {
		List list = hibernateTemplate.getSessionFactory()
				.getCurrentSession()
				.createSQLQuery("select count(*) from product p where p.ishas=1 and p.ispromotion=0 and p.product_category in (select pc.id from product_category pc where pc.category_name like '%"+keyword+"%')")
				.list();
		int count = 0;
		if(list.size()>0){
			count = Integer.parseInt(list.get(0)+"");
		}
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> searchProductLikeName(final int offset, final int pagesize,
			final String keyword) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createSQLQuery("select * from product p where p.ishas=1 and p.ispromotion=0 and p.product_category in (select pc.id from product_category pc where pc.category_name like '%"+keyword+"%')")
				.addEntity(Product.class)
				.setFirstResult(offset)
				.setMaxResults(pagesize)
				.list();
			}
		});
	}
	
	public void save(Object obj) {
		hibernateTemplate.save(obj);
	}
	
	//根据订单获取商品id和用户id
	@SuppressWarnings("unchecked")
	public List getProductIDAndUserID(String orderid) {
		List list = hibernateTemplate.getSessionFactory()
		.getCurrentSession()
		.createSQLQuery("select bi.product_id, b.customer_id from bill b,bill_items bi where b.orderid='"+orderid+"' and bi.orderid='"+orderid+"'")
		.list();
		return list;
	}
	
	//根据订单id获取商品id和商品数量
	public List getProductIDAndProductNum(String orderid) {
		List list = hibernateTemplate.getSessionFactory()
	 	.getCurrentSession()
		.createSQLQuery("select bi.product_id,bi.product_number from bill_items bi where bi.orderid='"+orderid+"'")
		.list();
		return list;
	}
	
	
	/*
	 * 	public boolean checkPrice(int productId, String productPrice) {
		List<Product> list = hibernateTemplate.find("from Product p where p.id="+productId);
		//该商品存在
		if(list.size()>0){
			Product product = list.get(0);
			//促销:ispromotion=1;非促销:ispromotion=0
			if(product.getIspromotion()==1){
				if(product.getPromotionprice().equals(productPrice))
					return true;
			}else{
				if(product.getProduct_price().equals(productPrice)){
					return true;
				}
			}
		}
		return false;
	}
	 * */
}
