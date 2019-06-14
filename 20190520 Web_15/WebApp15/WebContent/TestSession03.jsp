<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (TestSession02.jsp 페이지로부터)
	
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	// TestSession01.jsp 에서 넘긴 값은 세션이 만료된 상태. getParameter로 받을 수 없다. 
	// String userName = request.getParameter("userName");
	// String userBirth = request.getParameter("userBirth");
	
	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	session.removeAttribute("userName");
	session.removeAttribute("userBirth");	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>이름, 생일, 아이디, 패스워드 출력(TestSession03.jsp)</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=userName %></h2>
	<h2>생일 : <%=userBirth %></h2>
	<h2>아이디 : <%=userId %></h2>
	<h2>패스워드 : <%=userPwd %></h2>
</div>

</body>
</html>