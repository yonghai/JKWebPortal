package jk.o1office.ht.utils;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.List;

import jk.o1office.ht.domin.IDAndPrice;

public class StringHandler {
	/*<font color=#44403f>配料：<font color=#7d7d7d>柴米油盐<br/>
	 *<font color=#44403f>生产工艺：<font color=#7d7d7d>压榨<br/>
	 *<font color=#44403f>净含量：<font color=#7d7d7d>5.436L<br/>
	 *<font color=#44403f>保质期：<font color=#7d7d7d>18个月<br/>
	 *<font color=#44403f>体积：<font color=#7d7d7d>18.2<br/>
	 *<font color=#44403>质量等级：<font color=#7d7d7d>一级
	 **/
	/*<font color=#44403f>name1:<font color=#7d7d7d>val1<br/>
	 *<font color=#44403f>name2:<font color=#7d7d7d>undefined<br/>
	 *<font color=#44403f>name3:<font color=#7d7d7d>undefined<br/>
	 */
	public static String StringFormat(String str){
		StringBuffer sb = new StringBuffer();
		if(!str.equals("")){
			String[] str1 = str.split(" ");
			for(String s : str1){
				sb.append("<font color=#44403f>");
				sb.append(s.split("=")[0]+":");
				sb.append("<font color=#7d7d7d>");
				sb.append(s.split("=")[1]);
				sb.append("<br/>");
			}
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
	
	}

	public static IDAndPrice getIDAndPrice(String content) {
		IDAndPrice idAndPrice = new IDAndPrice();
		idAndPrice.setId(Integer.parseInt(content.split(" ")[0].replace("id=", "")));
		idAndPrice.setPrice(content.split(" ")[1].replace("price=", ""));
		return idAndPrice;
	}

	public static List<IDAndPrice> getIDAndPrices(String content) {
		String[] s = content.split(",");
		List<IDAndPrice> idAndPrices = new ArrayList<IDAndPrice>();
		for(String str : s){
			idAndPrices.add(getIDAndPrice(str));
		}
		return idAndPrices;
	}
}
