<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 일종의 작업지시서. JSP에게 초안 작성해주려는 것.  -->
<% 
	// 스크립트 릿(scriptlet) 영역
	String name = "최보라";
	name += "는 홍길동이 아니다.";
	
	int result;
	result = 10 + 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>


</body>
</html>