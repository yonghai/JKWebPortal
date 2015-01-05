package jk.o1office.ht.utils;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 *	将指定数据表中数据导出Excel
 */
public class DataToExcel {
	static String url = "jdbc:mysql://112.126.73.24:3306/jike";
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
	}
	
	public Object[] getConlumnNames(String tablename){
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		Object[] obj = new Object[2];
		String[] columns = null;
		try {
			conn =  DriverManager.getConnection(url); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM "+tablename);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			columns = new String[numberOfColumns];
			for(int i=1;i<=numberOfColumns;i++){
				columns[i-1] = rsmd.getColumnName(i);
			//	System.out.println(rsmd.getColumnName(i)+"  "+columns[i-1]);
				obj[0] = columns;
			}
			List list1 = new ArrayList();
			while(rs.next()){
				List list2 = new ArrayList();
				for(int i=1;i<numberOfColumns;i++){
					list2.add(rs.getObject(i));
				}
				list1.add(list2);
			}
			obj[1] = list1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rs,stmt,conn);
		}
		return obj;
	}
	
	private void close(ResultSet rs,Statement stmt,Connection conn){
		try {
			if(rs!=null){
				rs.close();
				rs = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if(conn!=null){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void createWorkbook(String tablename) throws IOException, RowsExceededException, WriteException{
		 WritableWorkbook workbook = Workbook.createWorkbook(new File("e:/jike/"+tablename+".xls"));
		 WritableSheet sheet = workbook.createSheet("sheet1", 0);
		 Object[] obj =  getConlumnNames(tablename);
		 Object o1 = obj[0];
		 Object o2 = obj[1];
		 String[] columns = null;
		 List list = null;
		 if(o1 instanceof String[]){
			 columns = (String[])o1;
		 }
		 if(o2 instanceof List){
			 list = (List)o2;
		 }
		 for(int i=0;i<columns.length;i++){
			 Label label = new Label(i, 0, columns[i]);
			 sheet.addCell(label);
		 }
		 for(int i=0;i<list.size();i++){
			 List list2 = (List)list.get(i);
			 for(int j=0;j<list2.size();j++){
				 Label label = new Label(j, i+1, list2.get(j)+"");
				 sheet.addCell(label);
			 }
		 }
		 workbook.write();
		 workbook.close(); 
	}
	
	public static void main(String[] args) throws Exception {
		new DataToExcel().createWorkbook("product");
	}
}
