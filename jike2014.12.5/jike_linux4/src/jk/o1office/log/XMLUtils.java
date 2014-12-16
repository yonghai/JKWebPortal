package jk.o1office.log;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import jk.o1office.utils.DateUtil;
import net.sf.json.JSONObject;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 *	记录日志的工具类
 */
public class XMLUtils {
	private static String FILEPATH = "c://";
	
	private static Document createOrUpdateXML(String filename) throws Exception{
		if(!isHas(filename)){	/*如果操作日志不存在，则创建日志文件*/
			Document document = DocumentHelper.createDocument();
			document.addElement(filename);
			write(document, filename);
		}
		return getDocument(filename);
	}
	
	public static void write(Document document, String filename) throws IOException{
		//输出全部原始数据，在编译器中显示  
        OutputFormat format = OutputFormat.createPrettyPrint();  
        format.setEncoding("UTF-8");//根据需要设置编码  
		  // 输出全部原始数据，并用它生成新的我们需要的XML文件  
        XMLWriter writer2 = new XMLWriter(new FileWriter(new File(  
        		FILEPATH+DateUtil.getCurrentTime()+"_"+filename+".xml")), format);  
        writer2.write(document); //输出到文件  
        writer2.close(); 
	}
	
	//判断今天的日志文件是否存在
	private static boolean isHas(String filename){
		File file = new File(FILEPATH+DateUtil.getCurrentTime()+"_"+filename+".xml");
		if(file.exists())
			return true;
		return false;
	}
	
	/**
	 * 添加一个日志操作
	 * @param operateType 操作类型 
	 * @param fileType 文件类型
	 * @param token 用户Token
	 * @param status(success | fail) 操作状态
	 * 
	 */
	public static void addOperate(OperateType operateType, FileType fileType, String token, String status){
		try {
			Document xmlDoc = createOrUpdateXML(fileType.getFilename());
			Element root = xmlDoc.getRootElement();
			Element operate = root.addElement("operate");
			Element operatename = operate.addElement("operateName");
			operatename.setText(operateType+"");
			Element operateid = operate.addElement("operateToken");
			operateid.setText(token);
			Element operatetime = operate.addElement("operateTime");
			operatetime.setText(DateUtil.getCurrentTime());
			Element operatestatus = operate.addElement("operateStatus");
			operatestatus.setText(status);
			write(xmlDoc, fileType.getFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static Document getDocument(String filename) throws DocumentException{
	    SAXReader sax = new SAXReader();  
        Document xmlDoc = sax.read(new File(FILEPATH+DateUtil.getCurrentTime()+"_"+filename+".xml"));  
        return xmlDoc;
	}
	
	public static void main(String[] args) {
	/*	try {
			addOperate(OperateType.DLOGIN,FileType.DUSERINFO,"1234567890", "success");
			addOperate(OperateType.DRECEIVEORDER,FileType.DUSERORDER,"1234567890", "success");
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		System.out.println(JSONObject.fromObject("{\"success\":false}").getBoolean("success"));
	}
}
