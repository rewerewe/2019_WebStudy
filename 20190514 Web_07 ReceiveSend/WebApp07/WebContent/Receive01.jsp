<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Send01.html 로 부터의 데이터 수신 (→ 스크립트 릿 영역 )
	
	// 한글 수신을 위한 인코딩 방식 지정
	//-- 웹은 UTF-8을 기본 인코딩 방식으로 삼고 있음.
	//   그러므로 기본 설정을 UTF-8 로 구성하는 것이 좋음.
	//   (이 처리는 데이터 처리보다 먼저 수행해야 
	//    한글이 깨지지 않는 상태로 수신할 수 있음.)
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
/* 	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
 */	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
</head>
<body>

<%-- <div>
	<h1>수신된 데이터</h1>
	<p> 
		<%=name %>님, 회원가입이 완료되었습니다. 
	 	회원님께서 등록하신 전화번호는 <%=tel %> 입니다.
	 </p>
</div> --%>

<div>
	<h2>가입 확인</h2>
	<span style="color: blue;"><%=userName %></span> 님
	회원 가입이 완료되었습니다.<br>
	<span style="color: red;">회원님께서 등록하신 전화번호는 <%=userTel %> 입니다. </span>
	
</div>

</body>
</html>