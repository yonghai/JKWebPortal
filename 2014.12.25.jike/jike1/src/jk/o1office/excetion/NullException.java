package jk.o1office.excetion;

public class NullException extends Exception {
	private String name;

	public NullException(String name) {
		this.name = name;
		System.out.println(name+"不能为null");
	}
	
	public String getName(){
		return name;
	}
}
