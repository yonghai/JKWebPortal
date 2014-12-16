package jk.o1office.ht.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.ht.dao.ProductDao;
import jk.o1office.ht.domin.Product;

public class ProductDaoImpl implements ProductDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void save(Product product) {
		hibernateTemplate.save(product);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getProductList(final int offset, final int rows) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Product").
				setFirstResult(offset).
				setMaxResults(rows).list();
			}
		});
	}
	
	public int getCount() {
		int count = ((Long)hibernateTemplate.iterate("select count(*) from Product").next()).intValue();
		return count;
	}

	public void delProduct(int id) {
		Product p = new Product();
		p.setId(id);
		hibernateTemplate.delete(p);
	}
	public int getCount(String goodsname) {
		int count = ((Long)hibernateTemplate.iterate("select count(*) from Product p where p.pname like '%"+goodsname+"%'").next()).intValue();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getProductList(final int offset, final int rows, final String goodsname) {
		return hibernateTemplate.executeFind(new HibernateCallback<List<Product>>() {
			public List<Product> doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("from Product p where p.pname like '%"+goodsname+"%'").
				setFirstResult(offset).
				setMaxResults(rows).list();
			}
		});
	}

	public List<String> getProductImgs() {
		return hibernateTemplate.find("select p.pimgpath from Product p");
	}
	
	public void updateGoods(Product p) {
		Product product = (Product)hibernateTemplate.load(Product.class, p.getId());
		if(!p.getFeature().equals("")){
			product.setFeature(p.getFeature());
		}
		product.setPname(p.getPname());
		product.setPprice(p.getPprice());
		product.setPdescript(p.getPdescript());
		product.setPweight(p.getPweight());
		product.setPvalume(p.getPvalume());
		product.setPbzq(p.getPbzq());
		product.setPcategoryid(p.getPcategoryid());
		hibernateTemplate.update(product);
	}
	
	public int getGoodsCount() {
		return ((Long)hibernateTemplate.iterate("select count(*) from Product").next()).intValue();
	}
	
	public void deletePromotionGoods(int goodsid) {
		hibernateTemplate.bulkUpdate("update Product p set p.ispromotion=0 where p.id="+goodsid);
	}
	
	@Deprecated
	public boolean checkPrice(int productId, String productPrice) {
		List list = hibernateTemplate.find("from Product p where p.id="+productId+" and (p.pprice='"+productPrice+"' or p.promotionprice='"+productPrice+"')");
		if(list.size()>0)
			return true;
		return false;
	}
}
