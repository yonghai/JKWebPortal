package jk.o1office.ht.finals;

import java.util.HashMap;
import java.util.Map;

import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.utils.XMLHandler;

public class Constant {
	public static int PAGESIZE = 5;
	public static Map<String,LoginInfo> infos = new HashMap<String,LoginInfo>();
	public static Map<String,XMLHandler> xmls = new HashMap<String, XMLHandler>();
	public static String IMGURL = "http://112.126.73.24:8080/jk/";
}
