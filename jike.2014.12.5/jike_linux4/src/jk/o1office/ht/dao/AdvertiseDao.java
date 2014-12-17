package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.IDAndPrice;

public interface AdvertiseDao {

	Object getAdvers(int isshow);

	void deletePromotionGoods(int goodsid);

	void webPromotionSetUp(String title, int isshow, String content);

	void detailsPromotionSetUp(String title, int isshow,
			IDAndPrice nameAndPrice);

	void listPromotionSetUp(String title, int isshow,
			List<IDAndPrice> idAndPrices);

}
