<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Hap.jsp ● → Hap_ok.jsp</p>		
</div>

<div>
	<!-- action 속성 지정 시 『Hap_ok.jsp』로 지정해도 되고 
	     『/WebApp05/Hap_ok.jsp』 형태로 지정해도 된다. -->
	<form action="Hap_ok.jsp" method="post">
		정수1 : <input type="text" name="su1" class="txt"><br>
		정수2 : <input type="text" name="su2" class="txt"><br>
		<br>
		<input type="submit" value="결과 확인" class="btn">
		<!-- 
			값을 줄테니 Hap_ok.jsp 페이지를 내게 주련? 이 의미가 더 중요함.
			URL 이 아래와 같이 변경된 것 확인.
			http://localhost:8090/WebApp05/Hap.jsp → http://localhost:8090/WebApp05/Hap_ok.jsp	
		  -->
	</form>
</div>

</body>
</html>