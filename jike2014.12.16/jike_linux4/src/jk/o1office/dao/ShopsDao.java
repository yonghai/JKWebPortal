package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Shops;

public interface ShopsDao {

	List<Shops> getShops(int areaid);

	List<Shops> getShops();

	List<Integer> getPCID(int id);

	List<Integer> getPID(int shopsid);

	List<Integer> getPCID(int shopsid, int categoryId);

	int getAreaID(int shopsid);

	List<Integer> getShopsIDs(int areaid);

}
