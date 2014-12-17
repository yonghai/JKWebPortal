package jk.o1office.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

public class XmlHandler {
	private Document document = null;
	public XmlHandler(String name) {
		File file = new File(name);
		SAXReader reader = new SAXReader();
		try {
			document = reader.read(file);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	
	public List<String> getKeys(){
		List<Node> nodes = document.selectNodes("//key");
		List<String> keys = new ArrayList<String>();
		for(Node node : nodes){
			keys.add(node.getText());
		}
		return keys;
	}
	
	public static void main(String[] args) {
		new XmlHandler(System.getProperty("user.dir")+"/defaultkeys.xml").getKeys();
	}
}
