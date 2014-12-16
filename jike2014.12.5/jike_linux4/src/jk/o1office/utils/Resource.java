package jk.o1office.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Resource {
	private String resourceName;
	private Properties p;
	public Resource(String resourceName) {
		this.resourceName = System.getProperty("user.dir")+"/"+resourceName;
		parse(this.resourceName);
	}

	public String getText(String name){
		return p.getProperty(name);
	}
	
	public void parse(String resourceName){
		try {
			InputStream in = new BufferedInputStream(
					new FileInputStream(resourceName));
			p = new Properties();
			p.load(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		System.out.println(System.getProperty("user.dir"));
		System.out.println(new Resource("jdbc.properties").getText("jdbc.url"));
	}
}
