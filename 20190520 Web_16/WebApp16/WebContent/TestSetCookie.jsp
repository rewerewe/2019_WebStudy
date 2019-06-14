<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성
	Cookie c = new Cookie("cookie_test", "studyCookie");
	
	// 쿠키 설정
	c.setMaxAge(3600);
	
	// 쿠키 추가 : 쿠키 입장에서는 반응하는 것이어서 response 가 된다.
	// 눈에 보이지 않지만, 서버쪽에서 심어놓은 것이다. → 유해 사이트에는 알림창을 뜨는 이유가 이것. 
	response.addCookie(c);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div>
	<a href="TestGetCookie.jsp"><button type="button"> 쿠키 정보 확인(get) </button></a>
	<a href="TestRemoveCookie.jsp"><button type="button"> 쿠키 정보 삭제 </button></a>
</div>

</body>
</html>