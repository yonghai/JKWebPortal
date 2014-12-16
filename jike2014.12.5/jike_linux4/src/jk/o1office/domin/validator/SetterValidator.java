package jk.o1office.domin.validator;

public class SetterValidator {
	public void validate(){
		System.out.println("执行了");
	}
	
	public void beforeServlet(){
		System.out.println("servlet execute ");
	}
}
