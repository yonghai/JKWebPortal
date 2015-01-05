package jk.o1office.ht.dao;

import java.util.List;

import jk.o1office.ht.domin.Community;

public interface CommunityDao {

	/**
	 * 保存小区 
	 * @param community
	 */
	void saveCommunity(Community community);

	/**
	 * 获取小区列表
	 * @return
	 */
	List<Community> getCommunity(int offset, int rows);

	/**
	 * 获取小区的数量
	 * @return
	 */
	int getCount();

	/**
	 * 修改小区名字
	 * @param cid
	 * @param cname
	 */
	void editCommunity(int cid, String cname);

	/**
	 * 删除小区
	 * @param cid
	 */
	void delCommunity(int cid);
	
	/**
	 * 模糊查询
	 * @param offset
	 * @param rows
	 * @param keyword
	 * @return
	 */
	List<Community> getCommunity(int offset, int rows, String keyword);
	
	/**
	 * 条件查询记录数
	 * @param keyword
	 * @return
	 */
	int getCount(String keyword);

	/**
	 * 是否存在该名称的小区
	 * @param name
	 * @return
	 */
	boolean isHasCommunity(String name);

}
