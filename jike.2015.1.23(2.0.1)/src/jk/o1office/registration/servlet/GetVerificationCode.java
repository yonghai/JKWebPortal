package jk.o1office.registration.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import jk.o1office.dao.UserDao;
import jk.o1office.excetion.NullException;
import jk.o1office.excetion.TelException;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.utils.Message;
import jk.o1office.utils.SDKMessage;
import jk.o1office.utils.SessionCache;
import jk.o1office.validator.TelValidator;
import jk.o1office.validator.Validator;

/**
 *	获取验证码
 *	已进行参数验证
 *	没有进行token验证
 */
public class GetVerificationCode extends HttpServlet {
	private Logger logger = Logger.getLogger("jk.o1office.registration.servlet.GetVerificationCode");
	private SDKMessage message;
	private Validator validator;
	private SessionCache session;
	private UserDao userDao;
	private UserDao duserDao;
	public UserDao getDuserDao() {
		return duserDao;
	}
	public void setDuserDao(UserDao duserDao) {
		this.duserDao = duserDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public SessionCache getSession() {
		return session;
	}
	public void setSession(SessionCache session) {
		this.session = session;
	}
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public SDKMessage getMessage() {
		return message;
	}
	public void setMessage(SDKMessage message) {
		this.message = message;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter  = response.getWriter();
	//	HttpSession s = request.getSession();
		String[] info = null;
		String returninfo = "";
		String token = "";
		try {
			/*type的值 ：0=注册 1=修改手机号码 2=忘记密码*/
			String type = validator.isNull(request.getParameter("type"),"type");
			token = validator.isNull(request.getParameter("token"), "token");
			String deviceid = request.getParameter("device_id");
			String tel = TelValidator.isMobile(validator.isNull(request.getParameter("mobilenumber"), "mobilenumber"));
			if(type.equals("0")){
				/*该用户么有注册，手机号没有绑定*/
				if(userDao.isHasUser(tel)==0){
					info = message.sendMessage(tel,token,"code");
					session.setAttr(tel, info[1]);
					returninfo = info[0];
				}else{/*手机号已绑定*/
					returninfo = "{\"success\":false,\"emsg\":\"该手机号已被绑定\",\"token\":\""+token+"\"}";
				}
			}else if(type.equals("1")){
				//如果该号码没有被注册,则发送验证码
				if(userDao.isHasUser(tel)==0){
					info = message.sendMessage(tel,token,"code");
					session.setAttr(tel, info[1]);
					returninfo = info[0];
				}else
					returninfo = "{\"success\":false,\"emsg\":\"该手机号已被绑定\",\"token\":\""+token+"\"}";
				
			}else if(type.equals("2")){
				info = message.sendMessage(tel,token,"code");
				session.setAttr(tel, info[1]);
				returninfo = info[0];
			}else if(type.equals("3")){ //配送端提交信息,若果该用户存在则不行
				if(duserDao.isHasUser(tel)==0){
					info = message.sendMessage(tel,token,"code");
					session.setAttr(tel, info[1]);
					returninfo = info[0];
				}else
					returninfo = "{\"success\":false,\"emsg\":\"该手机号已被绑定\",\"token\":\""+token+"\"}";
			}else if(type.equals("4")){ //配送端修改手机号码
				if(duserDao.isHasUser(tel)==0){
					info = message.sendMessage(tel,token,"code");
					session.setAttr(tel, info[1]);
					returninfo = info[0];
				}else
					returninfo = "{\"success\":false,\"emsg\":\"该手机号已被绑定\",\"token\":\""+token+"\"}";
			}else if(type.equals("5")){	//配送段忘记密码
				info = message.sendMessage(tel,token,"code");
				session.setAttr(tel, info[1]);
				returninfo = info[0];
			}
		}catch(IOException e){
			returninfo = "{\"success\":false,\"emsg\":\"未知错误\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}catch(TelException e){
			returninfo = "{\"success\":false,\"emsg\":\"手机号码格式错误\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}catch (NullException e) {
			returninfo = "{\"success\":false,\"emsg\":\""+validator.getName()+"不能为null\",\"token\":\""+token+"\"}";
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		}catch(Exception e){
			returninfo = "{\"success\":false,\"emsg\":\"异常错误\",\"token\":\""+token+"\"}";
		//e.printStackTrace();
			e.printStackTrace(ExceptionInfo.out());
			ExceptionInfo.out().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}

}
