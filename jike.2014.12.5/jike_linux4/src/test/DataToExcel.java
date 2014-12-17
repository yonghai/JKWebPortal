package test;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class DataToExcel {
	private ResultSet rs = null;
	private Statement stmt = null;
	static String url = "jdbc:mysql://localhost:3306/jike";
	static Connection conn = null;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String[] getConlumnNames(String tablename) throws Exception{
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM "+tablename);
		ResultSetMetaData rsmd = rs.getMetaData();
		int numberOfColumns = rsmd.getColumnCount();
		String[] columns = new String[numberOfColumns];
		for(int i=1;i<=numberOfColumns;i++){
			columns[i-1] = rsmd.getColumnName(i);
			System.out.println(rsmd.getColumnName(i)+"  "+columns[i-1]);
		}
		return columns;
	}
	
	public void createWorkbook(String[] columns) throws Exception{
		 WritableWorkbook workbook = Workbook.createWorkbook(new File("c:/1.xls"));
		 WritableSheet sheet = workbook.createSheet("First Sheet", 0);
		 for(int i=0;i<columns.length;i++){
			 Label label = new Label(i, 0, columns[i]);
			 sheet.addCell(label);
		 }
		 workbook.write();
		 workbook.close(); 
	}
	
	public static void main(String[] args) throws Exception {
		DataToExcel dte = new DataToExcel();
		dte.createWorkbook(dte.getConlumnNames("bill"));
	}
}
