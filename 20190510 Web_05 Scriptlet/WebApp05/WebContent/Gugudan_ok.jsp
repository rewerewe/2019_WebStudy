<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 내가 풀이한 내용 
<%
	// 스크립트 릿 영역
	
	String dan = request.getParameter("dan");
	int result = 1;
	String str = "";
	
	try
	{
		int dansu = Integer.parseInt(dan);	
		
		for (int i=1; i < 10; i++)
		{
			result = dansu * i;
						
			str += (dan + " * " + i + " = " + result) + "<br>";
			
		}
	}
	catch (Exception e)
	{
		getServletContext().log("오류 : " + e.toString());
	}

%> 
--%>

<%
	// 데이터 수신
	String str = request.getParameter("dan");

	int n = Integer.parseInt(str);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/html" href="css/main/css">
</head>
<body>

<div>
	<h1>구구단 출력</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<%-- 내가 풀이한 내용 

 <div>
	<h2>수신 데이터</h2>
	<h3>구구단 <%=dan %> 단</h3>
	<h3><%=str %></h3>
</div> 

--%>


<%--
 <%  // 표현식 안에 표현식을 쓰려한다. 가능할까? 
	for(int i=0; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%=(n*i) %><br>
  <%}%> 
 --%>
  
<!-- html 주석문: jsp 눈에 보인다. 옮겨 적는다. -->
<%-- jsp 주석문: jsp 눈에 안보인다. 옮겨 적지 못한다. --%>  
  
  
	<% 
	
		for (int i=1; i<=9; i++)
		{
			out.print(n + " * " + i + " = " + (n*i) + "<br>");
		}
	
	%>
</body>
</html>