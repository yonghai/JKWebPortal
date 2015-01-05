package jk.o1office.validator;

import jk.o1office.excetion.NullException;
import jk.o1office.excetion.NumberException;
import jk.o1office.excetion.TokenException;

public class Validator {
	private String name;
	/**
	 * 判断传的参数是否为null
	 * @param str
	 * @param name
	 * @return
	 * @throws NullException
	 */
	public String isNull(String str,String name) throws NullException{
		this.name = name;
		if(str==null){
			throw new NullException(name);
		}
		System.out.println(str);
		return str.trim();
	}
	
	/**
	 * 验证是否为合法token
	 * @param token
	 * @return
	 * @throws TokenException
	 */
	public String isToken(String token) throws TokenException{
		if(!token.equals("")){
			String[] arr = token.split("A");
			if(arr.length != 3){
				throw new TokenException();
			}
		}
		return token;
	}
	/**
	 * 判断传的参数是否为空字符串
	 * @param str
	 * @param name
	 * @return
	 */
	public String isNullStr(String str,String name)throws NullException{
		return isNullOrNullStr(str, name);
	}
	
	/**
	 * 判断传的参数是否为null或者为空字符串
	 * @param str
	 * @param name
	 * @return
	 */
	public String isNullOrNullStr(String str,String name) throws NullException{
		this.name = name;
		if(str==null || str.trim().equals("")){
			throw new NullException(name);
		}
		System.out.println(str);
		return str.trim();
	}
	
	/**
	 * 验证对否为数字
	 * @param str
	 * @return
	 * @throws NumberException
	 */
	public String isNumber(String str) throws NumberException{
		for(int i=str.length();--i>=0;){
			if(!Character.isDigit(str.charAt(i))){
				throw new NumberException();
			}
		}
		return str;
	}
	
	/**
	 * 返回没通过验证的参数名
	 * @return
	 */
	public String getName(){
		return name;
	}
	
	public static void main(String[] args){
		try {
			new Validator().isNumber("011");
		} catch (NumberException e) {
			e.printStackTrace();
		}
	}
}
