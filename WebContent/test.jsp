<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scope.jsp</title>
</head>
<body>
	<%
		Object pageMsg=pageContext.getAttribute("msg");	
		Object requestMsg=request.getAttribute("msg");	
		Object sessionMsg=session.getAttribute("msg");	
		Object applicationMsg=application.getAttribute("msg");	
	
		out.println(pageMsg+"<br>");
		out.println(requestMsg+"<br>");
		out.println(sessionMsg+"<br>");
		out.println(applicationMsg+"<br>");
	%>

</body>
</html>