package jk.o1office.ht.utils;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class ExceptionInfo {
	
	private static PrintWriter printWriter = null;
	private static String logname = "/jike/error/exception.log";
	private static String htlogname = "/jike/error/htexception.log"; 
	private static String plogname = "/jike/error/pexception.log";
	public static PrintWriter out(){
		try {
			if(printWriter==null)
				printWriter = new PrintWriter(new FileWriter(logname,true));
			else{
				printWriter.write(new Date()+"   \r\n");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return printWriter;
	}
	
	public static PrintWriter pout(){
		try {
			if(printWriter==null)
				printWriter = new PrintWriter(new FileWriter(plogname,true));
			else{
				printWriter.write(new Date()+"   \r\n");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return printWriter;
	}
	
	public static PrintWriter htout(){
		try {
			if(printWriter==null){
				printWriter = new PrintWriter(new FileOutputStream(htlogname,true));
			}else{
				printWriter.write(new Date()+"  \r\n");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		return printWriter;
	}
	
	public static void main(String[] args) {
		try {
			FileInputStream f = new FileInputStream("D:\\aa.txt");
		} catch (FileNotFoundException e) {
		//	logStackTrace(e);
			e.printStackTrace();
			e.printStackTrace(htout());
			htout().print("error.........");
			htout().flush();
		}
	}
	
	public static void exceptionLog(Object o){
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("c:/1.txt",true));
			bw.write(new Date()+"    "+o);
			bw.newLine();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void logStackTrace(Exception e){
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter("c:/1.txt",true));
			StackTraceElement[] stes = e.getStackTrace();
			for(StackTraceElement ste : stes){
				bw.write(ste.toString());
				bw.newLine();
			}
			bw.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
