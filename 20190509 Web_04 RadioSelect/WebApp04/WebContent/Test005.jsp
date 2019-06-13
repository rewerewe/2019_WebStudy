<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 관련 실습</h2>

	<!-- form 태그의 action 속성은 데이터전송 및 페이지요청을 해야하는 
	     대상페이지를 등록하는 기능 수행 (생략시 데이터전송 및 요청페이지는 자기자신) -->
	
	<!-- form 태그의 method 속성에는 get 또는 post 를 등록 
	     (생략시 get 방식으로 처리) 이는 데이터전송 및 페이지요청 방식에 해당한다. -->
	
	<!-- get 방식: 엽서 (URL에 전달하는 쿼리문을 볼 수 있음) 
	     post 방식: 편지 (URL에 전달하는 쿼리문을 볼 수 없음)   -->
	
	<form action="/WebApp04/login" method="get">
		<!-- form 태그 : 클라이언트에서 입력된 데이터를 한번에 서버로 전송하기 위한 태그 -->
		<!-- 서버에 넘기게 되는 데이터는 name="" 이다. -->
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" size="10" maxlength="10">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="userPwd" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn" style="width: 90px">
					<input type="reset" value="다시입력" class="btn" style="width: 90px">
				</td>
			</tr>
		</table>	
	</form>

<!-- 

서블릿 관련 실습
HttpServlet 클래스를 활용한 서블릿 테스트
아이디 : superman, 패스워드 : 1234

method : GET

클라이언트 IP Address : 0:0:0:0:0:0:0:1

URI : /WebApp04/login

 -->
	
</div>

</body>
</html>

