package jk.o1office.service.impl;

import jk.o1office.dao.ActivityDao;
import jk.o1office.domin.Activity;
import jk.o1office.service.ActivityService;
import jk.o1office.utils.DateUtil;

public class ActivityServiceImpl implements ActivityService{
	private ActivityDao activityDao;
	public ActivityDao getActivityDao() {
		return activityDao;
	}
	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}
	
	/**
	 * 判断该用户是否已经参加了此次活动
	 * 该方法判断了用户是否存在(不合理，不应该存在此业务中)
	 * -1： 该用户不存在
	 * 0：参与了该活动
	 * 用户id：没有参与该活动
	 */
	private int isJoin(String tel,int activityid) throws Exception {
		return activityDao.isJoin(tel, activityid);
	}
	
	/**
	 * 判断当前时间是否在活动期间
	 * @param activityid
	 * @return
	 */
	private boolean isActivityTime(int activityid){
		Activity activity = getActivity(activityid);
		if(null!=activity){
			//比较活动时间
			if(DateUtil.subDate(activity.getStartTime())>0 &&
					DateUtil.subDate(activity.getEndTime())<0){
				return true;
			}
		}
		return false;
	}
	
	private Activity getActivity(int activityid) {
		return activityDao.getActivity(activityid);
	}

	public String join(String tel, int activityid, String token)
			throws Exception {
		int result = isJoin(tel, activityid);
		if(result==-1){
			return "{\"success\":false,\"emsg\":\"没有该用户\",\"token\":\""+token+"\"}";
		}else if(result==0){
			return "{\"success\":false,\"emsg\":\"已经参与了活动成功\",\"token\":\""+token+"\"}";
		}else{
			if(isActivityTime(activityid)){
				activityDao.join(result,activityid);
				return "{\"success\":false,\"emsg\":\"成功参与活动\",\"token\":\""+token+"\"}";
			}else
				return "{\"success\":false,\"emsg\":\"当前时间已经没有该活动\",\"token\":\""+token+"\"}";
		}
	}
	
}
