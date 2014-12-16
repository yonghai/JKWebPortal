package jk.o1office.ht.supe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.o1office.ht.service.OrderService;
import jk.o1office.ht.validator.Validator;

/**
 *	订单统计
 */
public class getOrderCount extends HttpServlet{
	private OrderService orderService;
	private Validator validator;
	public Validator getValidator() {
		return validator;
	}
	public void setValidator(Validator validator) {
		this.validator = validator;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
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
		try {
			String time = validator.isNumber(validator.isNullStr(req.getParameter("time"),"time"));
			returninfo = orderService.getOrderCount(time);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			printWriter.print(returninfo);
		}
	}
}
