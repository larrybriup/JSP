<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>
<font color="red">
	<%
	Object o=request.getAttribute("msg");
	if(o!=null){
		out.println("<h2>"+o+"</h2>");
	}
	%>
</font>
	<form action="LoginAction.jsp" method="post">
		用户名:<input type="text" name="name"/><br>
		密码:<input type="password" name="password"/><br>
		<input type="submit" value="登陆"/>
	</form>
</body>
</html>