<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	request.setAttribute("message", "반갑습니다.");
	// 값을 넣어줄 때는 request의 set - Attribute 를 쓴다. 
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다." 를 value로 
	
	// ※ 리다이렉트 (→ 사용자에게 다시 페이지를 요청하라고 알려주는 것)
	// response.sendRedirect("Receive10.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습10</h1>
	<hr>
</div>

<div>
	<p>리다이렉트</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
</div>

</body>
</html>