<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.eagle.bean.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>el.jsp</title>
</head>
<body>
	<%
		pageContext.setAttribute("name2","choda2");
		request.setAttribute("name3","choda3");
		session.setAttribute("name4","choda4");
		application.setAttribute("name5","choda5");
		
		Student s= new Student();
		s.setId(1);
		s.setName("mimi");
		s.setAge(23);
		request.setAttribute("stu",s);
	%>
	<jsp:forward page="el.jsp">
		<jsp:param value="choda1" name="name1"/>
		<jsp:param value="86" name="score"/>
	</jsp:forward>
</body>
</html>