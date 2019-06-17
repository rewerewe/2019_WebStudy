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
<link rel="stylesheet" type="text/css" href="MemberScore.css">
</head>
<body>
	
<div>
	<form action="goInsert" method="post">
		<table>
			<tr>
				<th>아이디 : </th>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<th>비밀번호 : </th>
				<td>
					<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>전화번호 :</th>
				<td>
					<input type="text" name="tel">
				</td>
			</tr>
			<tr>
				<th>이메일 : </th>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
		</table>
		<button type="submit">submit</button>
	</form>
</div>
</body>
</html>