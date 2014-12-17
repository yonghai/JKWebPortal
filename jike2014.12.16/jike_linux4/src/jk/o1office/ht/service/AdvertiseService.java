package jk.o1office.ht.service;

import java.util.List;

import jk.o1office.ht.domin.IDAndPrice;

public interface AdvertiseService {

	String getAdvers(int isshow) throws Exception;

	String deletePromotionGoods(String goodsid) throws Exception;

	String webPromotionSetUp(String title, int isshow,
			String content) throws Exception;

	String DetailsPromotionSetUp(String title, int isshow,
			IDAndPrice nameAndPrice) throws Exception;

	String listPromotionSetUp(String title, int isshow,
			List<IDAndPrice> idAndPrices) throws Exception;

}
