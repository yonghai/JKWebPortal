package jk.o1office.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import jk.o1office.excetion.TokenException;

public class IDGenertor {
	public static String newToken(String userid){
		return "id-"+userid + "@n-" + new SimpleDateFormat("yyMMddHHmmss").format(new Date())+"@u-"+UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static int getUserID(String token) throws TokenException{
		String[] arr = token.split("@");
		if(arr.length != 3){
			throw new TokenException();
		}
		String s = "";
		if(arr[0].split("-").length>1){
			s = arr[0].split("-")[1];
		}else
			throw new TokenException();
		System.out.println(s);
		return Integer.parseInt(s);
	}
	
	public static String randomCode(){
	/*	String code = (int)(Math.random()*10000)+"";
		if(code.length()!=4){
			randomCode();
		}*/
		Random random = new Random();
		return random.nextInt(9)+""+random.nextInt(9)+""+random.nextInt(9)+""+random.nextInt(9);
	}
	//订单交易验证码
	public static String getCode(){
		return new SimpleDateFormat("yyMMddHHmmss").format(new Date())+UUID.randomUUID().toString().replaceAll("[a-zA-Z]", "").replaceAll("-", "");
	}
	
	public static void main(String[] args) throws Exception {
	/*	Random random = new Random();
		System.out.println();
		for(int i=0;i<10000;i++){
			System.out.println(randomCode());
		}*/
		System.out.println(newToken("12"));
	}
}
