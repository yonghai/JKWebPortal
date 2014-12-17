package jk.o1office.excetion;

public class FailException extends Exception {
	public FailException() {
		System.out.println("failException");
	}
	
	@Override
	public void printStackTrace() {
		System.out.println("FailException.....");
	}
	
	@Override
	public String getMessage() {
		return "FailException="+super.getMessage();
	}
}
