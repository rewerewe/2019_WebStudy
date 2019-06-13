<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	String mf = request.getParameter("sung");
	String city = request.getParameter("city");
	String[] subArr = request.getParameterValues("sub");
	String selectSub = "";
	
	for (int i=0; i<subArr.length; i++)
	{
		selectSub += subArr[i] + " ";	
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<h2>회원 가입</h2>
	<p>아이디: <%=id %></p>
	<p>패스워드: <%=pw %></p>
	<p>이름: <%=name %></p>
	<p>전화번호: <%=tel %></p>
	
	<p>성별: <%=mf %></p>
	<p>지역: <%=city %></p>
	<p>수강과목: <%=selectSub %></p>
</div>

</body>
</html>