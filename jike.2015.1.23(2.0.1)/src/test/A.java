package test;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;


public class A {

	public static void before() throws Exception{
		int a = 1;
		if(a==1)
			throw new Exception("haha");
	}
	
	public static void a(){
		try {
			before();
		} catch (Exception e) {
			System.out.println(e.getMessage()+"null");
			e.printStackTrace();
		}
	}
	
	public void after(){
		System.out.println("after...........");
	}
	
	public static void main(String[] args) {
	//	String s = "http://localhost:8888/jike/super/commonuser.jsp";
	//	System.out.println(s.contains("/super/"));
	//	String str = "http://jk-p-img.qiniudn.com/-app-imgcache-cate-71.jpg";
	//	System.out.println(Stradd(str));
		
	/*	int n=1000;
		Timer timer = new Timer();
		for(int i=0;i<=n;i=i+2){
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					System.out.println(new Date());
				}
			}, i*1000);
		}*/
		a();
	}
	
	public static String Stradd(String str){
		str = str.substring(0,str.lastIndexOf("/"))+"/android"+str.substring(str.lastIndexOf("/")+1);
		return str;
	}
}
