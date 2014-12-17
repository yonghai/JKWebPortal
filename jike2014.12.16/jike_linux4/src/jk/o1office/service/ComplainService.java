package jk.o1office.service;

import jk.o1office.domin.Complain;
import jk.o1office.excetion.FailException;

public interface ComplainService {

	String saveComplain(Complain complain, String token) throws Exception;

}
