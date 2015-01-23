package jk.o1office.dao.impl;

import java.util.ArrayList;
import java.util.List;

import jk.o1office.dao.AdvertiseDao;
import jk.o1office.domin.AdDetail;
import jk.o1office.domin.AdProduct;
import jk.o1office.domin.Advertise;
import jk.o1office.domin.Product;
import net.sf.json.JSONObject;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class AdvertiseDaoImpl implements AdvertiseDao{
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
					list = new Object[]{ps,"list"};
			}else if(advertise.getType()==1){ /*detail*/
				hql = "select p.id,p.product_name,p.product_price,p.product_description,p.feature,p.product_img from product p,addetail ad where ad.aid="+advertise.getId()+" and ad.goodsid=p.id";
				List<AdProduct> aps =  hibernateTemplate.getSessionFactory()
			//	.openSession()
				.getCurrentSession()
				.createSQLQuery(hql)
				.setResultTransformer(Transformers.aliasToBean(AdProduct.class))
				.list();
				AdProduct mp = null;
				if(aps.size()>0){
					mp = (AdProduct)aps.get(0);
					list = new Object[]{mp,"details"}; 
				}else{
					list = new Object[]{"","details"}; 
				}
			}else{ /*web*/
				AdDetail ad = (AdDetail) hibernateTemplate.find("from AdDetail ad where ad.aid="+advertise.getId()).get(0);
				if(ad != null){
					list = new Object[]{ad,"web"};
				}
			}
		}
		return list;
	}
	
	/**
	 * 正价一个促销
	 * @param isshow
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Object getAdvers1(int isshow) {
		//获取指定位置的促销信息
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
				hql = "select p.id,p.product_name,p.product_price,p.product_description,p.feature,p.product_img,ad.promotionprice from product p,addetail ad where ad.aid="+advertise.getId()+" and ad.goodsid=p.id";
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
				List l = hibernateTemplate.find("from AdDetail ad where ad.aid="+advertise.getId());
				if(l.size()>0){
					AdDetail ad = (AdDetail) l.get(0);
					if(ad != null){
						list = new Object[]{ad,"web",advertise.getTitle()};
					}
				}
			}
		}
		return list;
	}
	
	private List<AdProduct> list(String hql){
		//获取促销列表的所有详情
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
			//获取促销列表中商品的详细信息
			list = hibernateTemplate.find("from Product p where p.ishas=1 and p.id in " + range);
			for(Product p : list){
				for(AdProduct ap : adProducts){
					if(p.getId()==ap.getId()){
						ap.setFeature(p.getFeature());
						ap.setProduct_description(p.getProduct_description());
						ap.setProduct_img(p.getProduct_img());
						ap.setProduct_name(p.getProduct_name());
						ap.setProduct_price(p.getProduct_price());
					}
				}
			}
		}
		return adProducts;
	}
	
	public static void main(String[] args) {
		AdProduct ap = new AdProduct();
		ap.setFeature("<font color=#44403f>配料：</font><font color=#7d7d7d>柴米油盐</font><br/><font color=#44403f>生产工艺：</font><font color=#7d7d7d>压榨</font><br/><font color=#44403f>净含量：</font><font color=#7d7d7d>5.436L</font><br/><font color=#44403f>保质期：</font><font color=#7d7d7d>18个月</font><br/><font color=#44403f>体积：</font><font color=#7d7d7d>18.2</font><br/><font color=#44403f>质量等级：</font><font color=#7d7d7d>一级</font>");
		System.out.println(JSONObject.fromObject(ap).toString());
	}
	
	@SuppressWarnings("unchecked")
	public List<Advertise> getAllAdImg(int style) {
		return hibernateTemplate.find("from Advertise a where a.isshow !=0 and a.style="+style);
	}
	
	public List<Advertise> getAllAdImg() {
		return hibernateTemplate.find("from Advertise a where a.style!=2");
	}
}
