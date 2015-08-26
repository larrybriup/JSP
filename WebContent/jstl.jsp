<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*" %>
  <%@ page import="com.eagle.bean.Student" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl.jsp</title>
</head>
<body>
	<% 
		List<Student> list=
				new ArrayList<Student>();
	list.add(new Student(1,"choda1",13));
	list.add(new Student(2,"choda2",13));
	list.add(new Student(3,"choda3",23));
	list.add(new Student(4,"choda4",13));
	list.add(new Student(5,"choda5",13));
	
	request.setAttribute("stu",list);
	%>
	
	<table border="1">
		<tr>
			<td>id</td>
			<td>name</td>
			<td>age</td>
		</tr>
	<%
		Object o=request.getAttribute("stu");
		if(o!=null){
			List<Student> stus=(List<Student>)o;
			for(Student s:stus){
				long id=s.getId();
				String name=s.getName();
				int age=s.getAge();
			%>	
				<tr>
					<td><%=id %></td>
					<td><%=name %></td>
					<td><%=age %></td>
				</tr>
	<% 			
			}
		}
	%>
		
	</table>
	<hr>
	<table border="1">
		<tr>
			<td>id</td>
			<td>name</td>
			<td>age</td>
		</tr>
	<%
		Object o2=request.getAttribute("stu");
		if(o2!=null){
			List<Student> stus=(List<Student>)o2;
			for(Student s:stus){
				long id=s.getId();
				String name=s.getName();
				int age=s.getAge();
	 			
				out.println("<tr>");
				out.println("<td>"+id+"</td>");
				out.println("<td>"+name+"</td>");
				out.println("<td>"+age+"</td>");
				out.println("</tr>");
			}
		}
	%>
		
	</table>
	<hr>
	<h1>使用jstl标签库</h1>
	<table border="1">
		<tr>
			<td>id</td>
			<td>name</td>
			<td>age</td>
		</tr>
		<c:forEach items="${stu}" var="s">
		<tr>
			<td>${s.id}</td>
			<td>${s.name}</td>
			<td>${s.age}</td>
		</tr>
		</c:forEach>
	</table>
	<hr>
	<%
		Map<Long,Student> map= new HashMap<Long,Student>();
		map.put(1L,new Student(1,"chodachan1",13));
		map.put(2L,new Student(2,"chodachan2",13));
		map.put(3L,new Student(3,"chodachan3",13));
		map.put(4L,new Student(4,"chodachan4",13));
		
		request.setAttribute("map",map);
	%>
	<c:forEach items="${map}" var="entry">
		${entry.key }-->${entry.value.id}&nbsp;${entry.value.name}&nbsp;${entry.value.age}
	<br></c:forEach>
	<h1>使用out标签</h1>
	<c:out value="hello"></c:out>
	<c:out value="${5+9 }"></c:out>
	<c:out value="${stu[2].name}"></c:out>
	<hr>
	<c:set var="name" value="zhaosi" scope="request"></c:set>
	${name}
	<hr>
	<c:remove var="name"/>
	${name}
	<hr>
	<h1>if标签</h1>
	<%
		request.setAttribute("score",70);
	%>
	<c:if test="${score<200}">
		<font color="red">mini的分数小于200</font>
	</c:if>
	<hr>
	<h1>choose标签</h1>
	<c:choose>
		<c:when test="${score>=90}">优秀</c:when>
		<c:when test="${score>=80}">良好</c:when>
		<c:when test="${score>=70}">中</c:when>
		<c:when test="${score>=60}">及格</c:when>
		<c:otherwise>fuck</c:otherwise>
	</c:choose>
	
	
</body>
</html>

