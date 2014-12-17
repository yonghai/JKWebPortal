package jk.o1office.ht.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil{

	/**
	 * 返回文件
	 * @param path
	 * @return
	 */
	public static File makeFile(String path, String filename) {
		makedir(path);
		return new File(path+"/"+filename);
	}

	/**
	 * 创建文件夹
	 * @param path
	 * @return
	 */
	public static File makedir(String path) {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		return file;
	}

	/**
	 * 修改文件名
	 * @param path
	 * @param name
	 * linux and wondows
	 */
	

	
	/**
	 * 删除指定文件夹及文件夹下的文件
	 * 
	 * @param name
	 */
	public static void removeDir(File file) {
		if (file.isFile() || file.list().length == 0) {
			file.delete();
		} else {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				removeDir(files[i]);
				files[i].delete();
			}
		}
		if(file.exists())
			file.delete();
	}
	
	/**
	 * 删除多余的图片
	 * @param type
	 * @param fileNames
	 */
	public static void delete(String type,List<String> fileNames){
		String path = "";
		if(type.equals("shops")){
			path = "e:/jike/shops/";
			File file = new File(path);
			delete(file, fileNames);
		}else if(type.equals("product")){
			path = "e:/jike/product/";
			File file = new File(path);
			deleteP(file, fileNames);
		}else if(type.equals("type")){
			path = "e:/jike/type/";
			File file = new File(path);
			delete(file, fileNames);
		}
	}
	
	/**
	 * 删除多余的商品图片
	 * @param file
	 * @param fileNames
	 */
	public static void deleteP(File file, List<String> fileNames){
		File[] files = file.listFiles();
		for(File f : files){
			String filename = f.getName();
			if(filename.contains("_300")){
				filename = filename.replace("_300", "");
			}else if(filename.contains("_160")){
				filename = filename.replace("_160", "");
			}
			if(!fileNames.contains(filename)){
				f.delete();
			}
		}
	}
	/**
	 * 删除shops和type中多余的图片
	 * @param file
	 * @param fileNames
	 */
	public static void delete(File file,List<String> fileNames){
		File[] files = file.listFiles();
		for(File f : files){
			if(f.isFile()){
				if(!fileNames.contains(f.getName())){
					f.delete();
				}
			}else{
				delete(f,fileNames);
			}
		}
	}
	
	public static void main(String[] args) {
		FileUtil fu = new FileUtil();
		List<String> fileNames = new ArrayList<String>();
		fileNames.add("product_402881494843c37b014843c4c1890007_160.jpg");
		fileNames.add("product_402881494843c37b014843c4c1890007_300.jpg");
		fileNames.add("product_402881494843c37b014843c4e5d40008_160.jpg");
		fileNames.add("one_40288167484007d701484007d7640000.jpg");
		fileNames.add("one_4028815e483adace01483adae89b0001.jpg");
		fileNames.add("two_4028815e483adace01483ae0d51f0003.jpg");
		fu.delete("type", fileNames);
	}
}
