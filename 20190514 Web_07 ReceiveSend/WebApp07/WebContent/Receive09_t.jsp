<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String gugudanStr = request.getParameter("gugudan");

	int gugudan	= Integer.parseInt(gugudanStr);
	String result = "";
	
	for (int i=1; i<=9; i++)
	{
		result += String.format("%d * %d = %d<br>", gugudan, i, (gugudan*i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<p>수신 데이터 : <%=gugudan %><br>
	<%=result %>
</div>

</body>
</html>