package jk.o1office.ht.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jk.o1office.ht.service.OrderService;
import jk.o1office.ht.utils.ExceptionInfo;
import jk.o1office.ht.validator.Validator;

public class GetOrder extends HttpServlet{
	private Logger logger = Logger.getLogger("jk.o1office.ht.common.servlet.GetOrder");
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
			int page = Integer.parseInt(validator.isNumber(req.getParameter("page")));
			int rows = Integer.parseInt(validator.isNumber(req.getParameter("rows")));
			int offset = (page-1) * rows;
			int billstatus = Integer.parseInt(validator.isNumber(req.getParameter("billstatus")));
			String name = req.getParameter("name");
			if(name==null){
				returninfo = orderService.getOrder(offset,rows,billstatus);
			}else{
				String time = req.getParameter("time");
				returninfo = orderService.getOrder(offset, rows, billstatus, name, time);
			}
		} catch (Exception e) {
			returninfo = "加载处错误了";
			logger.error(e.getMessage());
			e.printStackTrace(ExceptionInfo.htout());
			ExceptionInfo.htout().flush();
		} finally{
			printWriter.println(returninfo);
		}
	}
	
}
