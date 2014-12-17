package jk.o1office.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.ht.dao.CommunityDao;
import jk.o1office.ht.domin.Community;
import jk.o1office.ht.utils.JSONHandler;

public class CommunityService implements
		jk.o1office.ht.service.CommunityService {
	private CommunityDao communityDao;
	public CommunityDao getCommunityDao() {
		return communityDao;
	}
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	public String addCommunity(Community community) throws Exception {
		if(communityDao.isHasCommunity(community.getName()))
			return "已经存在该小区";
		else{
			communityDao.saveCommunity(community);
			return "保存成功";
		}
	}
	
	public String getCommunity(int offset, int rows) {
		List<Community> community = communityDao.getCommunity(offset, rows);
		int total = communityDao.getCount();
		Map map = new HashMap();
		map.put("total", total);
		map.put("rows", community);
		return JSONHandler.MapToJson(map);
	}
	
	public String editCommunity(int cid, String cname) throws Exception {
		if(communityDao.isHasCommunity(cname))
			return "该小区已经存在";
		else{
			communityDao.editCommunity(cid,cname);
			return "编辑成功";
		}
	}
	
	public String delCommunity(int cid) throws Exception {
		communityDao.delCommunity(cid);
		return "删除成功";
	}
	
	public String getCommunity(int offset, int rows, String keyword) {
		List<Community> community = communityDao.getCommunity(offset, rows, keyword);
		int total = communityDao.getCount(keyword);
		Map map = new HashMap();
		map.put("total", total);
		map.put("rows", community);
		return JSONHandler.MapToJson(map);
	}

}
