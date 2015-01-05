package jk.o1office.utils;

import java.util.List;

import jk.o1office.ht.domin.Product;

public class StringUtils {
	public static boolean isEq(String s1,String s2){
		if(s1.equals(s2))
			return true;
		return false;
	}
	
	public static void main(String[] args) {
		System.out.println((int)(Math.random()*1000000));
	}
	
	public static String[] StringToArray(String str){
		String[] arr = str.split(" ");
		return arr;
	}
	
	public static List<Product> gsToPs(String goodsinfo){
		return null;
	} 
}
