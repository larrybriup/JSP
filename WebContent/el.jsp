<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>el.jsp</title>
</head>
<body>
	<h1>EL表达式</h1>
	request: <%=request.getParameter("name")%>,
	pageContext: <%=pageContext.getAttribute("name")%>,
	request: <%=request.getAttribute("name")%>,
	session: <%=session.getAttribute("name")%>,
	application: <%=application.getAttribute("name")%>
	<hr />
	<br>
	param: ${param.name},
	pageScope: ${pageScope.name},
	requestScope: ${requestScope.name},
	sessionScope: ${sessionScope.name},
	applicationScope: ${applicationScope.name}
	<hr />
	<br>
	${param.name}
	${name}
	<hr />
	<br>
	<h1>Student</h1>
	${stu},
	${stu.id},
	${stu.name},
	${stu.age},
	${stu.word},
	${stu["word"]}
	<br>
	<h1>字符串</h1>
	${"hello" }
	<br>
	<h1>运算结果或者boolean表达式</h1>
	${6-8},
	${1<9},
	${empty "jiji"},
	${not empty "jiji"},
	${!empty "jiji"},
	${param.score>100},
	${param.score>60?"good":"failure"}
	<h1>数字 集何的元素</h1>
	<%
		String[] str= {"jiji","heihei"};
	List<String> list = new ArrayList<String>();
	list.add("yaya");
	list.add("mimi");
	
	Map<String,Integer> map= new HashMap<String,Integer>();
	map.put("a",1);
	map.put("b",2);
	map.put("c",3);
	
	request.setAttribute("str",str);
	request.setAttribute("list",list);
	request.setAttribute("map",map);
	%>
	
	${str[0]}<br>
	${list[1]}<br>
	${map["c"]}
</body>
</html>


