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
<title>Test4.jsp</title>
</head>
<body>

<div>
	<h1>JSTL 코어(Core) if문 실습</h1>
	<hr>
</div>

<div>
	<!-- form 태그에서 action 속성을 생략할 경우
	     전송하는 데이터의 수신처는 자기 자신이다. -->
	<form action="" method="post">
		정수 <input type="text" name="su"><br><br>
		<button type="submit" class="btn" style="width: 100px; font-size: 16pt;" >결과</button>
	</form>
</div>

<div>
	<h3>${param.su } </h3>
	
	<%-- <c:if test=""></c:if> : JSTL Core if문 --%>
	
	<%-- 『test=" "』 :  if문의 조건식 영역
						 조건식 지정. 파라미터로 수신한 su 에 값이 있으면 --%>
	<%-- 『param.su』 :  EL 을 이용한 폼 전송 데이터 수신하는 부분  --%>
	<c:if test="${!empty param.su}">
	
		<c:if test="${param.su % 2 == 0}">
			<h2>${param.su } : 짝수 </h2>
		</c:if>
		
		<%-- JSTL Core if는 있지만 else 는 없다. --%>
		<c:if test="${param.su % 2 != 0} ">
			<h2>${param.su } : 홀수 </h2>
		</c:if>
	
	</c:if>
	<!-- 커스텀태그 기반. 여는태그와 닫는태그가 필수적이다.   -->	
</div>
</body>
</html>