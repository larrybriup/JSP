<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.ArrayList,java.util.HashMap" %>
  <%@ page isErrorPage="true" %>
  <%@ page taglib="s" %>
  <%@ page extends="java.util.HashMap"  %>
  <%@ page autoFlush="true"   %>
  <%@ page session="true"%>
  <%@ page isThreadSafe="true" %>
  <%@ page errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scope.jsp</title>
</head>
<body>
	<%
		pageContext.setAttribute("msg","page1");	
		request.setAttribute("msg","request");	
		session.setAttribute("msg","session");	
		application.setAttribute("msg","application");	
	
		RequestDispatcher rd=request.getRequestDispatcher("test.jsp");
		rd.forward(request,response);
	%>
	<%=exception.getMessage() %>
	<!-- 
	 -->
	
</body>
</html>