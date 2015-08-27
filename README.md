   
   
   JSP:
   	1,java server page
   	2,jsp里面可以有哪些内容:css,js,java code,表达式语言(EL),jst1标签
  	3,如何工作及其特点?
  		1)jsp其实就是一个servlet
  		2)jsp的运行需要服务器的支持
  			服务器中的jsp引擎可以帮我们去运行页面.引擎就是别人写好的java code
	  	4)jsp在运行之前要经过几个步骤:首先jsp页面要被翻译成.java文件,然后再编译成.class文
	  		件,最后再运行这个java类.
	  	5)jsp翻译成的.java文件中.其实就是写了一个servlet,在这个类中的方法里面,用io流把jsp
	  		页面中的内容一行一行的输出到浏览器.
	  		因为这是在java类中的方法里面做的事情,所以很多数据可以用变量表示,同时也可以调用
	  		其他类中的方法,
	  	6)运行jsp页面过程中,jsp引擎帮我们翻译成.java和.class文件都保存在Tomcat的work目录
	  		里面.
	  	7)通过上述可知,写好的jsp项目第一次运行可能会慢一些,需要把jsp页面翻译成.java文件,
	  		然后编译成.从.class文件,最后再运行,以后要访问的时候就快了.
	  	8)先检查是否存在,如果不存在就返回404,如果有,就检查是否有对应的.class文件,有就运
	  		行,没有就编译
	  	9)jsp页面就是直接在一个html中写java code
	  	10)servlet能做的事情jsp一定能做.
	  	
	  	4,如何写一个jsp页面以及如何写一个java code
	  		1)jsp的脚本元素,脚本里不用加分号
	  			a,表达式(expression)
	  				<%="Hello" %>
	  			   <%=1+4 %>
	  			   <%=s.getName() %>
	  			   将来翻译到java文件中的位置:
	  			   _jspService方法中
	  			   out.write();
	  			b,脚本(script)
	  				<%
	  				String name="tom";
	  				String a = new String("ef");
	  				%>
	  				将来翻译的位置的,
	  				 _jspService方法中
	  				 在一个方法中可以写什么杨的代码,在脚本中就可以写什么代码,后面是要加分号的
	  				 在脚本中声明的变量是可以在表达式中使用的.
	  				 
	  			c,声明
	  				直接翻译到java文件中的成成员变量,所以在类中写什么就可以在声明中写什么
	  				
	  				这里面的代码定义变量的时候要加;号
	  				
	  		2)jsp的指令元素
	  			jsp的指令元素是给jsp引擎看的.一些翻译的时候注意事项等.导包
	  			写法:<%@ 指令名字 属性="值"%>
	  			page指令 language="java" 目前只能写java
	  							<%@ page import="java.util.ArrayList,java.util.HashMap" %>导包,要导入的java类
	  							contentType="text/html; charset=UTF-8" 设置jsp页面保存所用的编码
	  							  <%@ page extends=""  %>设置要继承哪个类,
	  							  session="true"设置这个jsp页面是否支持session对象的使用
	  							  isThreadSafe="true"设置这个jsp页面是否是线程安全的
	  							  errorPage=""当期页面出错就会跳到另外一个页面
	  							isErrorPage="true" 表示当前页面是一个专门显示错误信息的页面,设置之后就可以拿到exception
	  			include指令 可以把另外一个页面的内容引入到这个页面(静态包含)
	  							静态包含和动态包含
	  							<%@ include file="foot.jsp" %>
	  			taglib指令
	  						   作用:引入一些特殊的标签库.
	  			
	  		3)jsp的动作元素
		  		<jsp:useBean id="s" class="com.eagle.bean.Student" scope="page"></jsp:useBean>
		  			相当与代码:
					<%
						Student s= null;
						s=
						(Student)pageContext.getAttribute("s");
						  if (s == null){
       					   s = new com.eagle.bean.Student();
       					   
					%>
				<jsp:setProperty property="name" value="三炮" name="s"/>
				相当与代码:
					<%
						Student s= null;
						s=
						(Student)pageContext.getAttribute("s");
       					   s.setName();
					%>
				<jsp:getProperty property="name" name="s"/>
					相当与代码:
					<%
						Student s= null;
						s=
						(Student)pageContext.getAttribute("s");
						 s.getName();
       					   
					%>
					<jsp:forward page="target.jsp"></jsp:forward> 跳转传参
					
						<jsp:include page=""></jsp:include>动态包含
						   特点:先翻译,用的时候再调用
					//jsp的动作元素向浏览器输出一个标签
					<jsp:element name="font">
					<jsp:attribute name="color">blue</jsp:attribute>
					<jsp:body>hh3</jsp:body>
					</jsp:element>
				相当与:
				<font color="red">heihei</font>
				<%
				out.println("<font color='yellow'>heihei2</font>");
				%>	
				
	  		
	  5,在jsp页面代码中可以直接使用的对象
	  		一共有9个内置对象可以直接使用.
	  		//四个范围对象在一定范围内可以存储数据
	  		 PageContext 				pageContext // 页面范围,只在一个页面中起作用
	  		HttpServletRequest		 request			
	  		 HttpSession					 session 
	  		  ServletContext 			application
	  		  
			Object 							page //名字叫page但不是页面范围对象,是一个Object类型的对象,表示当前页面
															 //的本身
	  		 HttpServletResponse	 response
			ServletConfig 				config 	//获取和servlet相关的信息,需要配置才可以使用
			JspWriter 						out 	//向浏览器的一个输出流
	  		 Throwable 					exception//jsp运行出错的时候抛出的异常对象
			
			这些对象在jspService方法中默认声明出来了,而表达式和脚本翻译到这个方法中,所以可以直接使用,
  	6,jsp页面中的注释:
  		1)
	  		<!-- 
		comment1:html,jsp,xml
		 -->
  		特点:用户在浏览器中右键打开源代码能看到注释,在tomcat编译成的.java文件中也能看到
  		2)
		  		 <%--
			 comment2:jsp独有的
			  --%>
		特点:两边都看不到,隐藏注释
		3)
				 <%
			 // comment3:
				 /**
				 色vsev
				 */
			  %>
			  <%!
			 // comment3:
	  			%>
			  
			 特点: 在脚本,声明里面,用java代码里的注释,在页面右键源代码里面看不到,但是在服务器生成的.java文件里
			 面可以看到
		7,jsp里面的路径
			一般情况下,jsp中的路径问题是和html的路径问题一样,但是在jsp中有一种情况除外:
					如果在jsp页面的上面写里这样一个脚本:
					<%
						String path=request.getContextPath();
						String basePath=request.getScheme()+"://"+request.getServerName()+":"+
													 request.getServerPort()+path+"/";
					%>
					在head标签中加入以子标签<base href="<%=basePath%>">
					request.getContextPath();//获得请求的路径,不用为路径问题麻烦,参照这个路径
	8,EL表达式语言
		形式${ }
		作用:從一個范围里取值或者从一个对象里取值,或者向页面中输出值.
		1)接受客户端的值.
			${param.name1}
		2)从范围中取值.
			${pageScope.name2}
			${requestScope.name3}
			${sessionScope.name4}
			${applicationScope.name5}
		3)可以不指定范围再去取值.
			${name2}
			${name3}
			${name4}
			${name5}
			会按照pageContext,request,session.application的顺序依次去找name的值,如找不到就什么都不输出
		4)取出对象中的值.
			${stu}
			${stu.id}
			${stu.name}
			${stu.age}
			${stu.word}
			${stu["word"]}
			对象中有没有这个属性对这个操作没有任何影响
			5)输出字符串
				${"hello" }
			6)运算结果或者boolean表达式
				${ 6-8}
				${ 1<9}
				${  empty "jiji"}
				${ not empty "jiji"}
				${ !empty "jiji"}
				${param.score>100 }
				${param.score>60?"good":"fuck" }
			7)数字 集何的元素
				<%
					String[] str= {"jiji","heihei"};
				List<String> list = new ArrayList<String>();
				list.add("yaya");
				list.add("mimi");
	
				Map<String,Integer> map= new Map<String,Integer>();
				map.put("a",1);
				map.put("b",2);
				map.put("c",3);
	
				request.setAttribute("str",str);
				request.setAttribute("list",list);
				request.setAttribute("map",map);
				%>
	
				${str[0] }<br>
				${list[1] }<br>
				${map["c"] }
				
				
			9,JSTL标签库
			 JSP Standard Tag Library
			 1)让web项目支持jstl
			  在myeclipse中建项目的时候会有提示,是否加入jstl标签库支持.
			 eclipse中要把包复制到lib里面
			 2)在一个页面中把jstl标签导入,就可以使用了
				  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				   prefix="c"相当与给标签库起一个别名
			3)forEach  标签
			遍历list集合:
				   <c:forEach items="${stu}" var="s">
						<tr>
							<td>${s.id}</td>
							<td>${s.name}</td>
							<td>${s.age}</td>
						</tr>
				</c:forEach>
			 items="${stu}" 要遍历的是stu,
			 遍历map集合:
			 <c:forEach items="${map}" var="entry">
				${entry.key }-->${entry.value.id}&nbsp;${entry.value.name}&nbsp;${entry.value.age}
			<br></c:forEach>
			4)使用out标签
				<c:out value="hello"></c:out>
				<c:out value="${5+9 }"></c:out>
				<c:out value="${stu[2].name}"></c:out>
		  5)set标签可以向某一个范围存放一个值
		  <c:set var="name" value="zhangsi" scope="request"></c:set>
			${name}
			<c:remove var="name"/>
			移除
			6)if标签条件判断
			<c:if test="${score<200}">
				<font color="red">mini的分数小于200</font>
			</c:if>
			7)choose标签
				<c:choose>
					<c:when test="${score>=90}">优秀</c:when>
					<c:when test="${score>=80}">良好</c:when>
					<c:when test="${score>=70}">中</c:when>
					<c:when test="${score>=60}">及格</c:when>
					<c:otherwise>fuck</c:otherwise>
				</c:choose>
	
							   
				   
				   
				   
				   
				   
				   
				   
