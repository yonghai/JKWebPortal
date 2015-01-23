package jk.o1office.ht.utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class ExcelToDB {
	
	public static void readExcel(String file){
		try {
			Workbook workBook = Workbook.getWorkbook(new File(file));
			Sheet[] sheets = workBook.getSheets();
			for(Sheet sheet : sheets){
				int clos = sheet.getColumns();
				int rows = sheet.getRows();
				for(int row=1;row<rows;row++){
					for(int clo=0;clo<clos;clo++){
						String content = sheet.getCell(clo, row).getContents();
						System.out.println(content+" ");
					}
				}
			}
			
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Map<String, String> xml2Map(String xmlname){
		Map<String,String> map = new HashMap<String,String>();
		SAXReader reader = new SAXReader();
		try {
			Document doc = reader.read(new File(xmlname));
			List list = doc.selectNodes("//field");
			for(Iterator iter = list.iterator(); iter.hasNext();){
				Element ele = (Element)iter.next();
				map.put(ele.attributeValue("name"), ele.getText());
				System.out.println(ele.getText()+"  "+ele.attributeValue("name"));
			}
			System.out.println(list);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public static void main(String[] args) {
		readExcel("e:/通讯录.xls");
		System.out.println();
	//	xml2Map(System.getProperty("user.dir")+"/src/excel2db.xml");
	}
}
