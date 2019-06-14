<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userId = (String)session.getAttribute("userId");
	
	if (userId==null)
		response.sendRedirect("TestSession01.jsp");
	
	// 세션 아이디
	String sid = session.getId();
	int t = session.getMaxInactiveInterval();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<div>
	<h2>세션 처리 확인</h2>
	<hr>
</div>

<div>
	<h2>여기는 일정관리 페이지</h2>
	<h3>내부적으로 처리되는 세션 아이디 : <%=sid %></h3>
	<h3>현재 세션이 유지되는 시간으로 설정된 값 : <%= t %></h3>
</div>

</body>
</html>