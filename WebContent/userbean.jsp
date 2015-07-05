<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>
	<jsp:useBean id="s" class="com.eagle.bean.Student" scope="page"></jsp:useBean>
	<jsp:setProperty property="name" value="三炮" name="s"/>
	<jsp:getProperty property="name" name="s"/>
	
	<jsp:forward page="target.jsp">
		<jsp:param value="tom" name="name"/>
	</jsp:forward>
</body>
</html>