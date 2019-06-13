<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// Redirect12_t.jsp 로부터 get 방식으로 넘겨받은 데이터 수신
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");

	if (op.equals("1"))
		op = "+";
	else if (op.equals("2"))
		op = "-";
	else if (op.equals("3"))
		op = "*";
	else if (op.equals("4"))
		op = "/";
	
	String strResult = String.format("%s %s %s = %s", num1, op, num2, str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12_t.jsp</title>
</head>
<body>
<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>
<div>
	<%=strResult %>
</div>
</body>
</html>