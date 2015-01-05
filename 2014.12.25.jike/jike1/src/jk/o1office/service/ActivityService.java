package jk.o1office.service;

public interface ActivityService {

//	int isJoin(String tel,int activityid) throws Exception;

	String join(String tel, int activityid, String token) throws Exception;

}
