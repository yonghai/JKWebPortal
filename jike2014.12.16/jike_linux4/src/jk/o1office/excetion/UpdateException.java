package jk.o1office.excetion;

import org.hibernate.StaleStateException;

public class UpdateException extends StaleStateException {
	
	private static final long serialVersionUID = 1L;
	
	public UpdateException(String msg) {
		super(msg);
	}

}
