package jk.o1office.service;


public interface AreaService {

	String getAreaList(String token) throws Exception;

	String getCommunity(int areaid, String token) throws Exception;

	String getArea(int pid,String token);

}
