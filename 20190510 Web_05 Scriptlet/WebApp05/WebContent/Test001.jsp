<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="1kb" autoFlush="false" %>  --%>
<!-- page의 버퍼를 1kb로 설정하고 다 차면 flush 해주는 autoFlush를 꺼둠 -> 에러발생함 -->

<%-- <%@ page buffer="10kb" autoFlush="false" %>  --%>
<!-- autoFlush를 꺼둬도 10kb안에 표현 가능하면 에러 안남 -->

<%@ page buffer="1kb" autoFlush="true" %> 
<!-- 
기본은 8kb, true임
JSP의 page directive 속성에 관한건
https://www.tutorialspoint.com/jsp/page_directive.htm
를 참고
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>
<div>
	<h2>반복문 구성</h2>
	<%for(int i=1; i<=1000; i++)
	{%>1234<%}%>
</div>
</body>
</html>