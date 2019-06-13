<%@ page contentType="text/html; charset=UTF-8"%>
<%     
	request.setCharacterEncoding("UTF-8");     
	String su1Str = request.getParameter("su1");     
	String su2Str = request.getParameter("su2");     
	String cal = request.getParameter("cal");     
	int su1 = Integer.parseInt(su1Str);     
	int su2 = Integer.parseInt(su2Str);     
	String result = "";     
	switch (cal) {     
	case "+":           
		result = "" + (su1 + su2);           
	break;     
	case "-":           
		result = "" + (su1 - su2);           
		break;     
	case "*":           
		result = "" + (su1 * su2);           
		break;     
	case "/":           
		result = "" + ((double) su1 / (double) su2);           
		break;     
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
</head>
<body>     
<div>           
<h1>데이터 송수신 실습 03</h1> 
<hr>
</div>
<div>           
<h2>사칙연산 결과</h2>
           
<span> <%=su1 %> <%=cal %> <%=su2 %> = <%=result %></span>
</div>
</body>
</html>