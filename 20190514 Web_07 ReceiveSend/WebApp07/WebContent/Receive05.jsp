<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String dan = request.getParameter("dan");
	
	int nDan = Integer.parseInt(dan);
	String result = "";
	
	for(int i=1; i<=9; i++)
	{
		result += String.format("%d * %d = %d<br>", nDan, i);
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
</head>
<body>

<div>
	단수 출력
	<%=result %>
</div>
</body>
</html>