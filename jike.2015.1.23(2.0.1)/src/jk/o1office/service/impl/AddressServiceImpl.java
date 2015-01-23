package jk.o1office.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jk.o1office.dao.AddressDao;
import jk.o1office.domin.CustomerAddress;
import jk.o1office.excetion.FailException;
import jk.o1office.excetion.TokenException;
import jk.o1office.service.AddressService;
import jk.o1office.utils.IDGenertor;
import jk.o1office.utils.JsonHandler;

import org.hibernate.StaleStateException;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateOptimisticLockingFailureException;

public class AddressServiceImpl implements AddressService {
	private AddressDao addressDao;
	public AddressDao getAddressDao() {
		return addressDao;
	}
	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	/**
	 * 杩斿洖鐢ㄦ埛鐨勯厤閫佸湴鍧�垪琛�
	 */
	public String getAddressList(String token) throws TokenException,Exception{
		int userid = IDGenertor.getUserID(token);
		List addresses = addressDao.getAddressLists(userid);
		if(null==addresses){
			return "{\"success\":false,\"emsg\":\"您的版本过低，请升级版本!\",\"token\":\""+token+"\"}";
		}
		boolean flag = true;
		String emsg = "没有地址";
		if(addresses.size()>0){
			emsg = "地址列表";
		}
		return JsonHandler.MapToJson(getMap(flag,emsg,token,addresses));
	}
	
	public String getAddressListIOS(String token) throws TokenException,Exception{
		int userid = IDGenertor.getUserID(token);
		List addresses = addressDao.getAddressListsIOS(userid);
		if(null==addresses){
			return "{\"success\":false,\"emsg\":\"您的版本过低，请升级版本!\",\"token\":\""+token+"\"}";
		}
		boolean flag = true;
		String emsg = "没有地址";
		if(addresses.size()>0){
			emsg = "地址列表";
		}
		return JsonHandler.MapToJson(getMap(flag,emsg,token,addresses));
	}
	
	@SuppressWarnings("unchecked")
	private Map getMap(
		boolean issucc,String emsg,String token,Object addresses){
		Map map = new HashMap();
		map.put("success", issucc);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", addresses);
		return map;
	}
	
	/**
	 * 鏂板鐢ㄦ埛閰嶉�鍦板潃
	 */
	public String save(CustomerAddress ca,String token) throws Exception{
		Serializable id = addressDao.save(ca);
		if(!id.toString().equals("0")){
			return "{\"success\":true,\"addressid\":\""+id+"\",\"emsg\":\"添加地址成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"添加地址失败\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 鏇存柊鐢ㄦ埛閰嶉�鍦板潃
	 */
	public String updateAddress(CustomerAddress ca, String token)throws StaleStateException,DataAccessException,HibernateOptimisticLockingFailureException{
		if(addressDao.updateAddress(ca)){
			return "{\"success\":true,\"emsg\":\"更新地址成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"更新地址失败\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 鍒犻櫎鐢ㄦ埛閰嶉�鍦板潃
	 */
	public String deleteAddres(int id, String token) throws Exception{
		String returninfo = "";
		if(addressDao.deleteAddress(id)){
			returninfo = "{\"success\":true,\"emsg\":\"删除地址成功\",\"token\":\""+token+"\"}";
		}else
			returninfo = "{\"success\":false,\"emsg\":\"删除地址失败\",\"token\":\""+token+"\"}";
		return returninfo;
	}
	
	/**
	 * 璁剧疆榛樿鐨勬敹璐у湴鍧�
	 */
	public String setDefaultAddress(int id, String token) throws TokenException, Exception{
		String returninfo = "";
		if(addressDao.setDefaultAddress(id,IDGenertor.getUserID(token))){
			returninfo = "{\"success\":true,\"emsg\":\"默认地址设置成功\",\"token\":\""+token+"\"}";
		}else
			returninfo = "{\"success\":false,\"emsg\":\"默认地址设置失败\",\"token\":\""+token+"\"}";
		return returninfo;
	}
	
	/**
	 * 鑾峰彇瀹㈡埛鐨勯粯璁ゅ湴鍧�
	 */
	public String getDefaultAddress(String token) throws TokenException,Exception {
		Map map = addressDao.getDefaultAddrss(IDGenertor.getUserID(token));
		boolean iscuss = true;
		String emsg = "默认地址";
		String addressnum = "2";
		if(null!=map.get("addressnum")){
		//	iscuss = false;
			addressnum = map.get("addressnum").toString();
			emsg = "没有默认地址";
		}
		return JsonHandler.MapToJson(getMap(iscuss, emsg, token, map, addressnum));
	}
	
	private Map getMap(boolean iscuss, String emsg,String token,Object o,String type){
		Map map = new HashMap();
		map.put("success", iscuss);
		map.put("emsg", emsg);
		map.put("token", token);
		map.put("data", o);
		map.put("type", type);
		return map;
	}
	
	/*新增地址*/
	public String saveNewAddress(CustomerAddress ca, String token)
			throws Exception {
		List<CustomerAddress> addresses = getAllAddressList(IDGenertor.getUserID(token));
		if(null!=addresses && addresses.size()==0){
			ca.setIs_default(1);
		}
		Serializable id = addressDao.saveNewAddress(ca);
		if(!id.toString().equals("0")){
			return "{\"success\":true,\"addressid\":\""+id+"\",\"emsg\":\"添加地址成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"添加地址失败\",\"token\":\""+token+"\"}";
	}
	
	public String updateNewAddress(CustomerAddress ca, String token)
			throws Exception {
		List<CustomerAddress> addresses = getAllAddressList(IDGenertor.getUserID(token));
		if(null!=addresses && addresses.size()==1){
			ca.setIs_default(1);
			System.out.println("updateNewAddress");
		}
		if(addressDao.updateNewAddress(ca)){
			return "{\"success\":true,\"emsg\":\"更新地址成功\",\"token\":\""+token+"\"}";
		}
		return "{\"success\":false,\"emsg\":\"更新地址失败\",\"token\":\""+token+"\"}";
	}
	
	/**
	 * 获取地址列表
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	private List<CustomerAddress> getAllAddressList(int userid) throws Exception{
		//获取新添加的地址		
		List<CustomerAddress> addresses = addressDao.getAddressList(userid);
		//获取旧添加的地址
		List<CustomerAddress> oldAddresses = addressDao.getOldAddressList(userid);
		if(null==oldAddresses)
			throw new Exception();
		addresses.addAll(oldAddresses);
		return addresses;
	}
	
	public String getMyAddressList(String token) throws Exception {
		int userid = IDGenertor.getUserID(token);
		//获取新添加的地址		
		List<CustomerAddress> addresses = addressDao.getAddressList(userid);
		//获取旧添加的地址
		List<CustomerAddress> oldAddresses = addressDao.getOldAddressList(userid);
		if(null==oldAddresses)
			throw new Exception();
		addresses.addAll(oldAddresses);
		Map map = new HashMap();
		map.put("success", true);
		map.put("emsg", "新地址列表");
		map.put("token", token);
		map.put("data", JsonHandler.ObjectToJSONArray(addresses, new String[]{
				"area","community","createtime","customer_id","shop"
		}));
		return JsonHandler.MapToJson(map);
	}
	
}


