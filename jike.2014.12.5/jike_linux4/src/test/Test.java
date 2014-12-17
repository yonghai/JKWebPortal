package test;

import java.math.BigDecimal;
import java.util.Timer;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlRootElement;

import jk.o1office.excetion.FailException;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.json.JSONArray;

public class Test {
	
	public static void main(String[] args) {
	//	System.out.println(t2()); 
	//	Scanner s = new Scanner(System.in);
	//	String str = s.nextLine();
	//	System.out.println(str.replaceAll("\\\\", "/"));
	/*	Timestamp ts = new Timestamp(System.currentTimeMillis());
		Date d = new Date();
		System.out.println(JSONObject.fromObject(ts).toString());
		System.out.println(JSONObject.fromObject(d).toString());*/
	//	new Test().test();
		/*
		
		Image image = new Image("d:/1.png");
		image.resize(1000);
		image.saveAs("d:/3.png");*/
	/*	File file = new File("d:/1.png");
		try {
			System.out.println(file.getCanonicalPath());
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	/*	try {
			t();
		} catch (Exception e) {
			System.out.println("Exce "+e.getMessage());
			e.printStackTrace();
		}
		String url = "http://www.baidu.com/common/index.jsp";
		System.out.println(url.contains("common"));
		System.out.println(new Object().equals("a"));*/
		//update();
		for(int i=0;i<6;i++){
			new Thread(new Runnable() {
				public void run() {
					
				}
			}).start();
		}
	}
	
	public void testa(){
		System.out.println("testA.......");
	}
	
	public static void t4(){
		String s = "[" +
				"{" +
				"\"uid\": 1," +
				"\"userName\": \"hle\"," +
				"\"password\": \"hl123456\"" +
				"}," +
				"{" +
				"\"uid\": 2," +
				"\"userName\": \"hyw\"," +
				"\"password\": \"hyw123456\"" +
				"}," +
				"{" +
				"\"uid\": 3," +
				"\"userName\": " +
				"\"zmh\",\"password\": \"zmh123456\"" +
				"}" +
				"]";
		JSONArray jsonArray = JSONArray.fromObject(s);
		System.out.println(jsonArray.toString());
	}
	
	public static void t3(){
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(Student.class);
			Marshaller marshaller = jaxbContext.createMarshaller();
			Student stu = new Student(1,"hello",new Student());
			marshaller.marshal(stu, System.out);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}
	
	public static void t() throws FailException{
		String s = null;
		if(s.equals("a")){
			System.out.println(s);
		}
		System.out.println(s);
	}
	
	
	public static boolean t1(){
		boolean flag = false;
		String s = null;
		try {
			System.out.println(s.trim());
			flag = true;
		} catch (Exception e) {
			System.out.println("异常1");
			flag = false;
			e.printStackTrace();
		} finally{
			return flag;
		}
	}
	
	public static String t2(){
		String s = "";
		try {
			if(t1()){
				s = "t";
			}else
				s = "f";
		} catch (Exception e) {
			System.out.println("异常2");
			s = "false";
			e.printStackTrace();
		} finally{
			System.out.println(s);
			return s;
		}
	} 
	
	
	public void test1(){
		String s = null;
		Timer t = new Timer();
		if(null==s){
			throw new NullPointerException();
		}
	}
	
	public void test(){
		CacheManager cm = CacheManager.create();
		Cache sessionCache = cm.getCache("sessionCache");
		Element element = new Element("checkcode", "123456");
		Element element1 = new Element("checkcode", "1234565667");
		sessionCache.put(element);
		sessionCache.put(element1);
		System.out.println(sessionCache.get("checkcode").getValue());
		Cache sessionCache1 = cm.getCache("sessionCache");
		System.out.println(sessionCache1.get("checkcode").getValue());
	}
	
	/*
	 * 假设事务已配置(service层中)
	 */
	
	/**
	 * 模拟service层的s方法
	 */
	public void s(){
		//保存成功，则update
		if(save()){
			update();
		}
	}
	/**
	 * 模拟dao层的save方法
	 * @return
	 */
	public boolean save(){
		boolean flag = false;
		try{
			//hibernate的save方法
			flag = true;
		}catch(Exception e){
			flag = false;
		} finally{
			return flag;
		}
	}
	/**
	 * 模拟dao层的update方法
	 */
	public static void update(){
		 double    f   =   34d;  
		  BigDecimal   b  =   new  BigDecimal(f);  
		  float   f1   =  b.setScale(2,  BigDecimal.ROUND_HALF_UP).floatValue();  
		  System.out.println(f1);
	}
	
	public String getVal(){
		return ("nihao");
	}
} 

@XmlRootElement
class Student{
	private int id;
	private String name;
	private Student stu;
	public Student() {
	}
	public Student(int id, String name, Student stu){
		this.id = id;
		this.name = name;
		this.stu = stu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	
}