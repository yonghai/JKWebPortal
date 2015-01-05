package jk.o1office.ht.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import jk.o1office.ht.domin.LoginInfo;
import jk.o1office.ht.domin.URLInfo;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class XMLHandler {
	private Element loginInfo = null;
	private Document document = null;
	private Element url = null;
	private String xmlname = "";					/*创建xml的文件名*/
	private String rootname = "/jike/admin/";		/*xml的存在文件文职*/
	private String latename = ".xml";				/*文件的后缀名*/
	public XMLHandler(String name) {
		this.xmlname = rootname+name+latename;
		createDocument(xmlname);
	}
	
	public String getRootPath(){
		return rootname;
	}
	
	public String getLateName(){
		return latename;
	}
	
	public void createDocument(String name) {
		document = DocumentHelper.createDocument();
		loginInfo = document.addElement("loginInfo");
		try {
			write(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("xmlname="+xmlname);
	}

	public boolean exists(String name){
		File file = new File(name);
		if(file.exists())
			return true;
		return false;
	}
	
	public void remove(String name){
		System.out.println("remove="+name);
		if(exists(name)){
			//new File(name).delete();
			System.out.println(name);
			String newname = name.substring(0,name.lastIndexOf("/"))
			+ "/log/"
			+ new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
			+ name.substring(name.lastIndexOf("/")+1);
			System.out.println("newname="+newname);
			new File(name).renameTo(new File(newname));
		}
	}
	
	public void setAttr(String name, Object value) {
		if(name.equals("urlinfo")){
			url = loginInfo.addElement("url");
			URLInfo urlinfo = (URLInfo)value;
			url.addElement("time").setText(urlinfo.getTime());
			url.addElement("content").setText(urlinfo.getContent());
		}else{
			loginInfo.addElement(name).setText(value.toString());
		}
	}

	public void write(String name) throws Exception {
		XMLWriter writer = new XMLWriter(new FileWriter(name));
		writer.write(document);
		writer.close();
	}

	public void write(Document document, String xmlname) throws IOException {
		XMLWriter writer = new XMLWriter(new FileWriter(xmlname));
		writer.write(document);
		writer.close();
		/*
		 * OutputFormat format = OutputFormat.createPrettyPrint(); writer = new
		 * XMLWriter(System.out, format); writer.write(document); format =
		 * OutputFormat.createCompactFormat(); writer = new
		 * XMLWriter(System.out, format); writer.write(document);
		 */
	}

	public void parse(String name) throws DocumentException {
		File file = new File(name);
		SAXReader reader = new SAXReader();
		document = reader.read(file);
	}

	public LoginInfo findLinks() throws DocumentException {
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setLoginTime(document.selectSingleNode("//loginTime").getText());
		loginInfo.setLoginIP(document.selectSingleNode("//loginIP").getText());
		loginInfo.setLogoutTime(document.selectSingleNode("//logoutTime").getText());
		List list = document.selectNodes("//url");
		List<URLInfo> urlinfos = new ArrayList<URLInfo>();
		for (Iterator iter = list.iterator(); iter.hasNext();){
			Element ele = (Element) iter.next();
			URLInfo urlinfo = new URLInfo();
			for(Iterator it = ele.nodeIterator();it.hasNext();){
				Node node = (Node)it.next();
				if(node.getName().equals("content")){
					urlinfo.setContent(node.getText());
				}else{
					urlinfo.setTime(node.getText());
					System.out.println(node.getText());
				}
			}
			System.out.println(urlinfo);
			urlinfos.add(urlinfo);
			loginInfo.getUrlsinfo().add(urlinfo);
		}
		return loginInfo;
	}

	public LoginInfo getLoginInfo(String name) throws DocumentException {
		parse(name);
		return findLinks();
	}

	public static void main(String[] args) throws Exception {
	/*	XMLHandler xml = new XMLHandler("admin");
		xml.setAttr("loginTime", new Date().toLocaleString());
		xml.setAttr("loginIP", "192.168.0.1");
		URLInfo urlinfo = new URLInfo();
		urlinfo.setTime(new Date().toLocaleString());
		urlinfo.setContent("http://www.baidu.com");
		xml.setAttr("urlinfo", urlinfo);
		URLInfo urlinfo2 = new URLInfo();
		urlinfo2.setTime(new Date().toLocaleString());
		urlinfo2.setContent("http://www.baidu.com");
		xml.setAttr("urlinfo", urlinfo2);
		URLInfo urlinfo3 = new URLInfo();
		urlinfo3.setTime(new Date().toLocaleString());
		urlinfo3.setContent("http://www.baidu.com");
		xml.setAttr("urlinfo", urlinfo3);
		xml.setAttr("logoutTime", new Date().toLocaleString());
		xml.write(xml.getRootPath()+"admin"+xml.getLateName());
		xml.parse(xml.getRootPath()+"admin"+xml.getLateName());
		xml.findLinks();*/
		String name = "e:/jike/admin/common2.xml";
		//e:/jike/admin/opearte1.xml
		System.out.println(name.substring(0,name.lastIndexOf("/")));
		System.out.println(new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss").format(new Date())+name.substring(name.lastIndexOf("/")+1));
	}
}
