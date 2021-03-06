package jk.o1office.excetion;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class CopyOfEmailValidator {
	
	public static String isEmail(String email) throws EmailException{
        String regex = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
        Pattern pattern = Pattern.compile(regex);
        Matcher mat = pattern.matcher(email);
        if(!mat.find()) {
            throw new EmailException();
        }
        return email;
    } 
	
	public static void main(String[] args) {
		try {
			CopyOfEmailValidator.isEmail("yhjikesoon@163.com");
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
}
