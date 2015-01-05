package jk.o1office.ht.operate.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.utils.DataToExcel;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class DownLoadGoods extends HttpServlet{
	private DataToExcel dataToExcel;
	public DataToExcel getDataToExcel() {
		return dataToExcel;
	}
	public void setDataToExcel(DataToExcel dataToExcel) {
		this.dataToExcel = dataToExcel;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String xlsname = "product";
		resp.setCharacterEncoding("utf-8");
		try {
			dataToExcel.createWorkbook(xlsname);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	    InputStream inStream = new FileInputStream("e:/jike/"+xlsname+".xls");
        resp.reset();
        //resp.setContentType("bin");
        resp.setContentType("application/octet-stream");  
        resp.addHeader("Content-Disposition",
                           "attachment;   filename=" + xlsname + ".xls");
        byte[] b = new byte[100];
        int len;
        while ((len = inStream.read(b)) > 0) {
            resp.getOutputStream().write(b, 0, len);
        }
        inStream.close();
	}
}
