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
<title>MemberInsertForm.jsp</title>
</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<hr>
</div>

<div>
	<h2>회원 정보 출력</h2>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		
		<c:forEach var="a" begin="1" end="5" step="1">
		
			${a } 번째 회원 &nbsp;&nbsp;&nbsp;&nbsp; <br>
				이름 : <input type="text" name="name${a }" style="width: 200px;"> <br>
				전화번호 : <input type="text" name="tel${a }" style="width: 168px;"> <br>
				주소 : <input type="text" name="addr${a }" style="width: 200px;"> <br>
			------------------------------------------- <br>
			<br>
		</c:forEach>

		<button type="submit" style="width: 250px;">입      력</button>
	</form>
	
<%-- 
선생님 풀이 방식 
	<form>
		<table>
			<tr>
				<th>이름</th>
				<td>
					<c:set var="i" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<input type="text" name="name${i }">
						<c:set var="i" value="${i+1 }"></c:set>
					</c:forEach>
				</td>
			</tr>
		</table>
	</form> 
--%>
</div>

</body>
</html>