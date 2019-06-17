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
<title>Test6_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSTL 코어(Core) forEach문을 이용한 자료구조 활용 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
			
			<!-- 컬렉션 객체 출력용 반복문 구성(사용빈도가 아주 높습니다.) -->
			<%-- 『<c:forEach var="변수" items="컬렉션"></c:forEach>』 --%>
			<!-- dto는 하나의 객체. -->
			<c:forEach var="dto" items="${lists}">
				<tr>
					<td style="text-align: center">${dto.name} </td>
					<td style="text-align: center">${dto.age} </td>
				</tr>
			</c:forEach>
		</tr>
	</table>
</div>

</body>
</html>