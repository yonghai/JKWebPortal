package jk.o1office.ht.utils;

import java.io.File;
import java.io.IOException;

// linux and windows
public class ImageHandler {

	public static void resize(String originalImage, int width, float quality){
		System.out.println(originalImage);
//		originalImage = "e:/jike/" +originalImage; //windows
		System.out.println("file="+originalImage);
		originalImage = "/jike/" +originalImage; //linux	
		String newImage =  originalImage.substring(0,originalImage.lastIndexOf("."))+"_"+width+".jpg";
		try {
			ImageUtils.resize(new File(originalImage), new File(newImage),width, quality);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
}
