package jk.o1office.utils;

import java.io.File;

public class FileUtil {

	public static File makedir(String path,String filename){
		File file = new File(path);
		if(!file.exists())
			file.mkdirs();
		return new File(path+"/"+filename);
	}
	
	public static File makedir(String path){
		File file = new File(path);
		if(!file.exists())
			file.mkdirs();
		return file;
	}
}
