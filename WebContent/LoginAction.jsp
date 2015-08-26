<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");

	String pg = "";
	if ("larry".equals(name) && "123".equals(password)) {
		pg = "/success.jsp";
		request.setAttribute("msg", "登陆成功!三炮欢迎!" + name);
	} else {
		pg = "/login.jsp";
		request.setAttribute("msg", "登陆失败!用户名或密码错误!");
	}
	RequestDispatcher rd = request.getRequestDispatcher(pg);
	rd.forward(request, response);
%>
