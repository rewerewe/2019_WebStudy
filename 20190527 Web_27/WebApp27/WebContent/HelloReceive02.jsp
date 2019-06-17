<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive02.jsp</title>
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloReceive02.jsp</h2>
	<hr>
</div>

<div>
	<ul>
		<li><b>FirstName : </b><%=firstName %></li>
		<li><b>lastName : </b><%=lastName %></li>
	</ul>
</div>

</body>
</html>