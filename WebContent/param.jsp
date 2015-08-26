<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.eagle.bean.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>param.jsp</title>
</head>
<body>
	<%
		pageContext.setAttribute("name","larry2");
		request.setAttribute("name","larry3");
		session.setAttribute("name","larry4");
		application.setAttribute("name","larry5");
		
		Student s= new Student();
		s.setId(1);
		s.setName("Larry");
		s.setAge(23);
		request.setAttribute("stu",s);
	%>
	<jsp:forward page="el.jsp">
		<jsp:param value="larry1" name="name"/>
		<jsp:param value="86" name="score"/>
	</jsp:forward>
</body>
</html>