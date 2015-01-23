package jk.o1office.utils;
import java.text.SimpleDateFormat;
import java.util.Date;

import jk.o1office.cache.OrderCacheUtil;

public class DateUtil {
	public static Long subDate(Date date){
		return System.currentTimeMillis()-date.getTime();
	}
	
	public static Date getEndDate(Date startDate){
		return new Date(startDate.getTime()+OrderCacheUtil.SECOND);
	}
	
	public static String getCurrentTime(String pattern){
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(new Date());
	}
	
	public static String addDate(Long time){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = new Date(System.currentTimeMillis()+time);
		return format.format(date);
	}
	
	public static void main(String[] args) {
		System.out.println(isDay(new Date()));
	}

	public static boolean isDay(Date d) {
		int h = d.getHours();
		if(h>=9 && h<=21)
			return true;
		else
			return false;
	}
	
}

