package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Advertise;

public interface AdvertiseDao {

	Object getAdvers(int isshow);

	List<Advertise> getAllAdImg(int style);

	Object getAdvers1(int isshow);

	List<Advertise> getAllAdImg();

}
