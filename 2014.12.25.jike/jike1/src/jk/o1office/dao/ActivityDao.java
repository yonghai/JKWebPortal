package jk.o1office.dao;

import jk.o1office.domin.Activity;

public interface ActivityDao {

	int isJoin(String tel, int activityid);

	void join(int userid, int activityid) throws Exception;

	Activity getActivity(int activityid);

}
