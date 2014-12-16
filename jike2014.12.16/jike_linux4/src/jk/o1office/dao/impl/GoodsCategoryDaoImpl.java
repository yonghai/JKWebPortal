package jk.o1office.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.dao.GoodsCategoryDao;
import jk.o1office.domin.GoodsCategory;

public class GoodsCategoryDaoImpl  implements GoodsCategoryDao{
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/**
	 * 获取商品分类列表
	 */
	@SuppressWarnings("unchecked")
	public List<GoodsCategory> getGoodsCategories(int pid) {
		String hql = "";
		if(pid==0){
			hql = "from GoodsCategory";
		}else{
			hql = "from GoodsCategory gc where gc.pid="+pid;
		}
		return hibernateTemplate.find(hql);
	}
}
