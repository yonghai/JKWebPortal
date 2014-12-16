package jk.o1office.ht.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateTemplate;

import jk.o1office.advice.servlet.AddAdviceInfo;
import jk.o1office.ht.domin.AdDetail;
import jk.o1office.ht.domin.AdProduct;
import jk.o1office.ht.domin.IDAndPrice;
import jk.o1office.ht.domin.Product;
import jk.o1office.ht.dao.AdvertiseDao;
import jk.o1office.ht.domin.Advertise;

public class AdvertiseDaoImpl implements AdvertiseDao {

	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@SuppressWarnings("unchecked")
	public Object getAdvers(int isshow) {
		List<Advertise> ads = hibernateTemplate.find("from Advertise a where a.isshow="+isshow);
		String hql = "";
		Object list = null;
		if(ads.size()>0){
			Advertise advertise = ads.get(0);
			if(advertise.getType()==0){ /*list*/
				hql = "from AdDetail ad where ad.aid="+advertise.getId();
				List<AdProduct> ps = list(hql);
				if(null != ps)
					list = new Object[]{ps,"list",advertise.getTitle()};
			}else if(advertise.getType()==1){ /*detail*/
				hql = "select p.id,p.product_name,p.product_price,ad.promotionprice from product p,addetail ad where ad.aid="+advertise.getId()+" and ad.goodsid=p.id";
				List<AdProduct> aps =  hibernateTemplate.getSessionFactory()
			//	.openSession()
				.getCurrentSession()
				.createSQLQuery(hql)
				.setResultTransformer(Transformers.aliasToBean(AdProduct.class))
				.list();
				AdProduct mp = null;
				if(aps.size()>0){
					mp = (AdProduct)aps.get(0);
					list = new Object[]{mp,"details",advertise.getTitle()}; 
				}else{
					list = new Object[]{"","details",advertise.getTitle()}; 
				}
			}else{ /*web*/
				AdDetail ad = (AdDetail) hibernateTemplate.find("from AdDetail ad where ad.aid="+advertise.getId()).get(0);
				if(ad != null){
					list = new Object[]{ad,"web",advertise.getTitle()};
				}
			}
		}
		return list;
	}
	
	private List<AdProduct> list(String hql) {
		List<AdDetail> addetails = hibernateTemplate.find(hql);
		List<Product> list = null;
		List<AdProduct> adProducts = new ArrayList<AdProduct>();
		if(addetails.size()>0){
			String range = "(";
			for(AdDetail a : addetails){
				AdProduct adProduct = new AdProduct();
				adProduct.setPromotionprice(a.getPromotionprice());
				adProduct.setId(a.getGoodsid());
				adProducts.add(adProduct);
				range += a.getGoodsid()+",";
			}
			range = range.substring(0,range.length()-1);
			range += ")";
			list = hibernateTemplate.find("from Product p where p.id in " + range);
			for(Product p : list){
				for(AdProduct ap : adProducts){
					if(p.getId()==ap.getId()){
						ap.setProduct_name(p.getPname());
					}
				}
			}
		}
		return adProducts;
	}
	
	public void deletePromotionGoods(int goodsid) {
		hibernateTemplate.bulkUpdate("delete from AdDetail ad where ad.goodsid="+goodsid);
	}
	
	
	/**
	 * 设置web类型的促销
	 */
	public void webPromotionSetUp(String title, int isshow, String content) {
		Advertise advertise = getAdvertise(isshow);
		if(null!=advertise){	
			//如果该位置不是web设置
		//	if(advertise.getType()!=2)
			hibernateTemplate.bulkUpdate("update Advertise a set a.type=2,a.title='"+title+"' where a.isshow="+isshow);
		//	List<AdDetail> adDetails = hibernateTemplate.find("from AdDetail ad where ad.aid="+advertise.getId());
			List<AdDetail> adDetails = getAdDetails(advertise.getId());
			//更新商品表中的促销标示
		/*	String hql = "update Product p set p.ispromotion=0 where p.id in (";
			for(AdDetail adDetail : adDetails){
				hql += adDetail.getGoodsid()+",";
			}
			hql = hql.substring(0,hql.length()-1)+")";
			hibernateTemplate.bulkUpdate(hql);*/
			
			UpdateProductPromotionStatus(adDetails);
			//删除所有与商品对应关系的数据
			deleteAdDetails(advertise.getId());
			//添加web设置的对应关系
			AdDetail ad = new AdDetail();
			ad.setAid(advertise.getId());
			ad.setWebaddr(content);
			ad.setPromotionprice("");
			hibernateTemplate.save(ad);
		}
			
	}
	
	public void deleteAdDetails(int advertiseid){
		hibernateTemplate.bulkUpdate("delete from AdDetail ad where ad.aid="+advertiseid);
	}
	
	public Advertise getAdvertise(int isshow){
		List<Advertise> advertises = hibernateTemplate.find("from Advertise a where a.isshow="+isshow);
		Advertise advertise = null;
		if(advertises.size()>0)
			advertise = advertises.get(0);
		return advertise;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdDetail> getAdDetails(int advertiseid){
		return hibernateTemplate.find("from AdDetail ad where ad.aid="+advertiseid);
	}
	
	/**
	 * 将指定商品设置诶非促销商品
	 * @param adDetails
	 */
	private void UpdateProductPromotionStatus(List<AdDetail> adDetails){
		
		String hql = "update Product p set p.ispromotion=0, p.promotionprice='' where p.id in (";
		for(AdDetail adDetail : adDetails){
			hql += adDetail.getGoodsid()+",";
		}
		hql = hql.substring(0,hql.length()-1)+")";
		System.out.println(hql);
		hibernateTemplate.bulkUpdate(hql);
	}
	/**
	 * 促销详情的设置
	 */
	public void detailsPromotionSetUp(String title, int isshow,
			IDAndPrice idAndPrice) {
		Advertise advertise = getAdvertise(isshow);
		if(null!=advertise){
			//如果当前促销位置不为促销详情，更改为详情
		//	if(advertise.getType()!=1)
			hibernateTemplate.bulkUpdate("update Advertise a set a.type=1,a.title='"+title+"' where a.isshow="+isshow);
			//如果原促销是列表
			if(advertise.getType()==0){
				//获取商品详情表中的数据
				List<AdDetail> adDetails = getAdDetails(advertise.getId());
				//修改商品促销标志
				UpdateProductPromotionStatus(adDetails);
				//删除促销性情表中对应关系
				deleteAdDetails(advertise.getId());
				//增加促销详情的对应关系
				AdDetail adDetail = new AdDetail();
				adDetail.setAid(advertise.getId());
				adDetail.setGoodsid(idAndPrice.getId());
				adDetail.setPromotionprice(idAndPrice.getPrice());
				hibernateTemplate.save(adDetail);
				hibernateTemplate.bulkUpdate("update Product p set p.ispromotion=1, p.promotionprice='"+adDetail.getPromotionprice()+"' where p.id="+idAndPrice.getId());
			}else if(advertise.getType()==1){/*如果原促销是详情*/
				//获取商品详情表中的数据
				List<AdDetail> adDetails = getAdDetails(advertise.getId());
				if(adDetails.size()>0){
					//修改商品促销标志
					UpdateProductPromotionStatus(adDetails);
				//增加促销详情的对应关系
					AdDetail adDetail = adDetails.get(0);
					adDetail.setAid(advertise.getId());
					adDetail.setGoodsid(idAndPrice.getId());
					adDetail.setPromotionprice(idAndPrice.getPrice());
					adDetail.setWebaddr("");
					hibernateTemplate.update(adDetail);
				}else{
					AdDetail adDetail = new AdDetail();
					adDetail.setAid(advertise.getId());
					adDetail.setGoodsid(idAndPrice.getId());
					adDetail.setPromotionprice(idAndPrice.getPrice());
					adDetail.setWebaddr("");
					hibernateTemplate.save(adDetail);
				}
				hibernateTemplate.bulkUpdate("update Product p set p.ispromotion=1, p.promotionprice='"+idAndPrice.getPrice()+"' where p.id="+idAndPrice.getId());
			}else if(advertise.getType()==2){
				List<AdDetail> adDetails = getAdDetails(advertise.getId());
				//增加促销详情的对应关系
				AdDetail adDetail = adDetails.get(0);
				adDetail.setAid(advertise.getId());
				adDetail.setGoodsid(idAndPrice.getId());
				adDetail.setPromotionprice(idAndPrice.getPrice());
				adDetail.setWebaddr("");
				hibernateTemplate.update(adDetail);
				hibernateTemplate.bulkUpdate("update Product p set p.ispromotion=1, p.promotionprice='"+adDetail.getPromotionprice()+"' where p.id="+idAndPrice.getId());
			}
		}
	}
	
	/**
	 * 促销列表设置
	 */
	public void listPromotionSetUp(String title, int isshow,
			List<IDAndPrice> idAndPrices) {
		//获取指定位置的促销信息
		Advertise advertise = getAdvertise(isshow);
		//如果不是促销列表，则设置为促销列表
		//if(advertise.getType()!=0)
		hibernateTemplate.bulkUpdate("update Advertise a set a.type=0,a.title='"+title+"' where a.isshow="+isshow);
		//如果当前促销位置为详情或则列表
		if(advertise.getType()==0 || advertise.getType()==1){
			//获取促销详情表中的数据
			List<AdDetail> adDetails = getAdDetails(advertise.getId());
			//修改商品促销标志
			UpdateProductPromotionStatus(adDetails);
			//删除促销性情表中对应关系
			deleteAdDetails(advertise.getId());
			//增加促销详情的对应关系
			String ids = "";
			for(IDAndPrice idAndPrice : idAndPrices){
				ids += idAndPrice.getId()+",";
				AdDetail adDetail = adDetails.get(0);
				adDetail.setAid(advertise.getId());
				adDetail.setGoodsid(idAndPrice.getId());
				adDetail.setPromotionprice(idAndPrice.getPrice());
				adDetail.setWebaddr("");
				hibernateTemplate.save(adDetail);
			}
			ids = ids.substring(0,ids.length()-1);
			UpdateProductPromotionStatus(ids,1);
		}else{
			//获取商品详情表中的数据
			List<AdDetail> adDetails = getAdDetails(advertise.getId());
			//删除促销性情表中对应关系
			deleteAdDetails(advertise.getId());
			String ids = "";
			for(IDAndPrice idAndPrice : idAndPrices){
				ids += idAndPrice.getId()+",";
				AdDetail adDetail = adDetails.get(0);
				adDetail.setAid(advertise.getId());
				adDetail.setGoodsid(idAndPrice.getId());
				adDetail.setPromotionprice(idAndPrice.getPrice());
				adDetail.setWebaddr("");
				hibernateTemplate.save(adDetail);
			}
			ids = ids.substring(0,ids.length()-1);
			UpdateProductPromotionStatus(ids,1);
		}
	}
	
	private void UpdateProductPromotionStatus(String ids,int status) {
		String hql = "update Product p set p.ispromotion="+status+" where p.id in ("+ids+")";
		hibernateTemplate.bulkUpdate(hql);
	}
	
}
