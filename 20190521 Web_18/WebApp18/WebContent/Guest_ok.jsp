<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인</h2>
	<h3>이름 : <%=ob.getUserName() %></h3>
	<h3>제목 : <%=ob.getSubject() %></h3>
	<h3>내용 : <%=ob.getContent().replaceAll("\n", "<br>") %></h3>
	<h3>날짜 : <%=ob.getCreated() %></h3>
</div>
</body>
</html>