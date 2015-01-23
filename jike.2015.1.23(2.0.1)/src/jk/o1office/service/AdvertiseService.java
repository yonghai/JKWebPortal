package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.Advertise;

public interface AdvertiseService {

	/**
	 * 返回广告信息
	 * @return
	 * @throws Exception 
	 */
	String getAdvers(int isshow,String token) throws Exception;

	/**
	 * 获取所有广告的图片路径
	 * @return
	 * @throws Exception 
	 */
	List<Advertise> getAllAdImg(int style) throws Exception;

	String getAdvers1(int isshow, String token) throws Exception;

	List<Advertise> getAllAdImg() throws Exception;

}
