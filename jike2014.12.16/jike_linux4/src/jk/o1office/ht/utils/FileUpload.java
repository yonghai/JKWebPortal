package jk.o1office.ht.utils;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

public class FileUpload {
	private Logger logger = Logger.getLogger("jk.o1office.ht.utils.FileUpload");
	private HttpServletRequest req;
	private String type;
	private File file = null;
	private String dir;
	public FileUpload(String type,String dir) {
		this.type = type;
		this.dir = dir;
	}
	
	public void parse(HttpServletRequest req){
		this.req = req;
		//判断提交过来的表单是否为文件上传菜单
		boolean isMuiltipart = ServletFileUpload.isMultipartContent(req);
		if(isMuiltipart){
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			factory.setRepository(FileUtil.makedir(req.getRealPath("/")+"temp"));
			// 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
			factory.setSizeThreshold(1024 * 1024);
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("utf-8");
			Iterator items;
			try {
				items = upload.parseRequest(req).iterator();
				while(items.hasNext()){
					FileItem item = (FileItem)items.next();
					if(!item.isFormField()){
						//取出上传文件的文件名
						String name = item.getName();
						logger.info("name="+name);
						logger.error("name="+name);
				//		String filename = name.substring(name.lastIndexOf("\\")+1,name.length());	//windows
						String filename = name.substring(name.lastIndexOf("/")+1,name.length()); //linux
						logger.info("filename"+filename);
						logger.error("filename="+filename);
						String hzm = filename.substring(filename.lastIndexOf("."));
						String path = ""; /*图片的路径*/
						if(type.equals("one")){
							path = dir;
						//	filename = getString("typename")+ ".jpg";
							filename = "one_"+UUIDGenerator.generate()+".jpg";
						}else if(type.equals("two")){
							path = dir + "/" + getString("pid");
						//	filename = getString("typename") + ".jpg";
							filename = "two_"+UUIDGenerator.generate()+".jpg";
						}else if(type.equals("product")){
							path = dir;
						//	filename = getString("goodsname") + ".jpg";
							filename = "product_"+UUIDGenerator.generate()+".jpg";
						}else if(type.equals("shops")){
							path = dir;
						//	filename = getString("shopname")+".jpg";
							filename = "shops_"+UUIDGenerator.generate()+".jpg";
						}
						file = FileUtil.makeFile(path, filename);
						item.write(file);
					}else{
						String fieldname = item.getFieldName();
						String value = item.getString();
						req.setAttribute(fieldname, value);
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace(ExceptionInfo.htout());
			} catch (Exception e) {
				e.printStackTrace(ExceptionInfo.htout());
			}
		}
	}
	
	public String getString(String name){
		String s = req.getAttribute(name).toString();
		try {
			s = new String(s.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace(ExceptionInfo.htout());
		}
		return s;
	}

	public String getPath() {
		return file.getAbsolutePath();
	}
}
