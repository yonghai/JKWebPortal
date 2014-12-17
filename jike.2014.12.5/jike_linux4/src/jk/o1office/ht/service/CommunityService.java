package jk.o1office.ht.service;

import jk.o1office.ht.domin.Community;

public interface CommunityService {
	
	/**
	 * 添加 community
	 * @param community
	 * @return
	 */
	String addCommunity(Community community) throws Exception;

	/**
	 * 获取community列表，返回json格式的community数据
	 * @return
	 */
	String getCommunity(int offset, int rows) throws Exception;
	
	/**
	 * 编辑小区
	 * @param cid
	 * @param cname
	 * @return
	 */
	String editCommunity(int cid, String cname) throws Exception;

	/**
	 *	删除指定的小区 
	 * @param cid
	 * @return
	 */
	String delCommunity(int cid) throws Exception;

	/**
	 * 按照关键字查询小区
	 * @param offset
	 * @param rows
	 * @param keyword
	 * @return
	 */
	String getCommunity(int offset, int rows, String keyword);

}
