<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
</head>
<body>
<div>
	<h1>include directive 실습</h1>
	<hr>
</div>

<%@ include file="Test003.jsp" %>
<!-- 외부의 페이지를 끌어 올 수 있다. -->

<br><br>
<div>
<%=str %><br>
<%=name %><br>
</div>
</body>
</html>