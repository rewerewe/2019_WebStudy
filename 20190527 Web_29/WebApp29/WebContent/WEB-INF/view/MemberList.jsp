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
<title>MemberList.jsp</title>
</head>
<body>
	
<div>
	<h1>멤버 리스트 출력</h1>
	<h2>MemberList.jsp</h2>
	<hr>
</div>

<div>
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>EMAIL</th>
		</tr>
		<c:forEach var="i" items="${lists }">
		<tr>
			<td>${i.id }</td> 
			<td>${i.pw }</td> 
			<td>${i.name }</td>
			<td>${i.tel }</td> 
			<td>${i.email }</td>
		</tr>
		</c:forEach>
	</table>
</div>

<div>
	<form>
		<button type="button" onclick="javascript:location.href='<%=cp%>/insertform'" >회원가입 FORM </button>
	</form>
</div>
</body>
</html>