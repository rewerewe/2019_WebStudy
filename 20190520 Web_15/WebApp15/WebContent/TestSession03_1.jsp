<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name = (String)session.getAttribute("userName");
	String birth = (String)session.getAttribute("userBirth");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<a href=""><button type="button" class="btn01" style="width: 100px;">게시판</button></a> |
			</td>
			<td>
				<% // 로그인 정보를 가져온 상황에서 null 값이 아닐 때만 일정관리 페이지로 이동. 
				if (userId==null)
				{
				%>
				<a href=""><button type="button" class="btn02" style="width: 100px;">일정관리</button></a> |
				<%
				}
				else
				{
				%>			
				<a href="TestSession02.jsp"><button type="button" class="btn01" style="width: 100px;">일정관리</button></a> |
				<%
				}
				%>
			</td>
			
			<td>
				<%
				if(userId==null)
				{
				%>
				<a href=""><button type="button" class="btn02" style="width: 100px;">친구관리</button></a> 
				<%
				}
				else
				{
				%>
				<a href="TestSession03.jsp"><button type="button" class="btn01" style="width: 100px;">친구관리</button></a> 
				<%
				}
				%>
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td>
				<%
				if (userId == null)
				{
				%>
				<!-- form 의 id는 script 영역에서 에서 제어하기 위함   -->
				<form action="TestSession01_ok.jsp" method="post" name="myForm" >
					<table class="table">
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="text" name="userPwd" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="button" onclick="sendIt()" style="width: 100%;">로그인</button>
							</th>
						</tr>
					</table>
				</form>
				<%
				}
				else
				{
				%>
				<h2><%=userId %>님, 환영합니다.</h2>
				<h2> 이제 일정관리와 친구관리 서비를 이용하실 수 있습니다. </h2>
				<p><a href="Logout.jsp">로그아웃</a></p>
				<%
				}
				%>	
			</td>
		</tr>
	</table>
</div>

</body>
</html>