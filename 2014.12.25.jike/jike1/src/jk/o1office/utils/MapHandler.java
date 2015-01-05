package jk.o1office.utils;

import java.util.HashMap;
import java.util.Map;

public class MapHandler {
	
	public static Map getMap(Object[] name,Object[] value){
		/*if(name.length!=value.length){
			throw new Exception();
		}*/
		Map map = new HashMap();
		for(int i=0;i<name.length;i++){
			map.put(name[i], value[i]);
		}
		return map;
	}
}
