<%@ page contentType="text/html; charset=UTF-8"%>
<%
		String resultStr=(String)request.getAttribute("resultStr");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>
<div>
	<h2>연산결과 <%= resultStr %></h2>
</div>

</body>
</html>