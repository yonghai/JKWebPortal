package jk.o1office.ht.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.domin.CommonUser;
import jk.o1office.ht.service.UserService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.EmailValidator;
import jk.o1office.ht.validator.Validator;

import org.apache.log4j.Logger;

public class UpdateCommonUser extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.UpdateCommonUser");
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
			CommonUser cuser = new CommonUser();
			cuser.setId(Integer.parseInt(validator.isNumber(req.getParameter("id"))));
			cuser.setAddress(validator.isNullStr(req.getParameter("address"),""));
			cuser.setCreatetime(new Date());
			cuser.setEmail(EmailValidator.isEmail(req.getParameter("email")));
			cuser.setNickname(validator.isNullStr(req.getParameter("nickname"),""));
			cuser.setPassword(req.getParameter("password"));
			cuser.setQq(req.getParameter("qq"));
			String sex = req.getParameter("sex");
			if(sex.equals("男")){
				cuser.setSex(1);
			}else{
				cuser.setSex(0);
			}
			cuser.setUsername(req.getParameter("username"));
			if(userService.updateUser(cuser)){
				returninfo = "<script>alert('更新成功');location.href='/jike/common/commonuser.jsp'</script>";
			}else{
				returninfo = "<script>alert('更新失败');location.href='/jike/common/cuseredit.jsp'</script>";
			}
		} catch(Exception e){
			returninfo = "<script>alert('更新出错误了');location.href='/jike/common/cuseredit.jsp'</script>";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
