package jk.o1office.log;

public class MyLog {
	private static MyLog log = new MyLog();
	
	private MyLog(){
	}
	
	public static MyLog newInstance(){
		return log;
	}
	
	public void writeLog(OperateType operateType, FileType fileType, String token, String status){
		XMLUtils.addOperate(operateType, fileType, token, status);
	}
}
