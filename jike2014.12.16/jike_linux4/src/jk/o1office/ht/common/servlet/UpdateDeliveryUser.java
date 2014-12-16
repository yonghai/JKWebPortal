package jk.o1office.ht.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.domin.CommonUser;
import jk.o1office.ht.domin.DeliveryUser;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.TelValidator;
import jk.o1office.ht.validator.Validator;

public class UpdateDeliveryUser extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.UpdateDeliveryUser");
	private UserService userService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		String returninfo = "";
		try{
			DeliveryUser duser = new DeliveryUser();
			duser.setId(Integer.parseInt(validator.isNumber(req.getParameter("id"))));
			duser.setCreatetime(new Date());
			duser.setNickname(validator.isNullStr(req.getParameter("nickname"),""));
			duser.setPassword(validator.isNullStr(req.getParameter("password"),""));
			duser.setUsername(validator.isNullStr(req.getParameter("username"),""));
			duser.setShopid(Integer.parseInt(validator.isNumber(req.getParameter("shopid"))));
			duser.setTelphone(TelValidator.isMobile(req.getParameter("telphone")));
			if(userService.updateUser(duser)){
				returninfo = "<script>alert('更新成功');location.href='/jike/common/deliveryuser.jsp'</script>";
			}else{
				returninfo = "<script>alert('更新失败');location.href='/jike/common/duseredit.jsp'</script>";
			}
		} catch(Exception e){
			returninfo = "<script>alert('更新出错误了');location.href='/jike/common/duseredit.jsp'</script>";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
