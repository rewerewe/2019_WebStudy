<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NVCSample01.jsp</title>
</head>
<body>

<div>
	<h1>NVC 관련 실습 2</h1>
	<hr>
</div>

<div>
	여기가 뷰입니다. 
	<!-- 컨트롤러로부터 수신한 결과 : 컬렉션 형태로 넘어왔다. -->
	<ul>
		<c:forEach var="i" items="${lists}">
			<li>${i }</li>
		</c:forEach>
	</ul>
</div>

</body>
</html>