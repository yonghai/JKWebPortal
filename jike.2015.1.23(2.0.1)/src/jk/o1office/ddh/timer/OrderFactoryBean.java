package jk.o1office.ddh.timer;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.FactoryBean;

/**
 * 无用类
 */
public class OrderFactoryBean{

	private static long counter = 0;
	
	public synchronized String getOrderID() throws Exception {
	//	String date = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		Long date = System.currentTimeMillis();
		String sequ = new DecimalFormat("000").format(counter ++);
		System.out.println(System.currentTimeMillis());
		return date + sequ;
	}

	public void reset() {
		OrderFactoryBean.counter = 0;
	}
	
	public static void main(String[] args) throws Exception {
		OrderFactoryBean s = new OrderFactoryBean();
		System.out.println(s.getOrderID());
	}
}
