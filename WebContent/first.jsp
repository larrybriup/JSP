<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>first.jsp</title>
</head>
<body>
	<h1>声明</h1>
	<%!
		private String address;
	public int go(){
		System.out.println("in go()");
		return 7897;
	}
	%>
	<h1>脚本</h1>
	<%
		String name="tom";
		out.println("Hello word!");
		List<String> list = new ArrayList<String>();
		list.add("mimi");
		list.add("jiji");
		list.add("kitty");
		for(String s:list){
			out.println(s+"<br>");
		}
		address="koera";
	%>
	<h1>表达式</h1>
	<%="Hello" %>
	<%= 1+3 %>
	<%= name +"\n"%>
	<%= address %>
	<%= go() %>
</body>
</html>