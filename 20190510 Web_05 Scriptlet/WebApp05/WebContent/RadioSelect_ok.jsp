<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name =request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String major= request.getParameter("major");;
	
	String[] hobbyArr = request.getParameterValues("hobby");
	String hobby = "";
	for(String item : hobbyArr)
		hobby += item + " ";
	
	String genderStr = "";
	if(gender.equals("M"))
		genderStr="남자";
	else if(gender.equals("F"))
		genderStr="여자";
	else
		genderStr="확인불가";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
	
	<div>
		<h3>수신한 데이터</h3>
		<p>이름 : <%=name %></p>
		<p>성별 : <%=gender %>(<%=genderStr %>) </p>
		<p>전공 : <%=major %></p>
		<p>취미 : <%=hobby %></p>
	</div>
</div>
</body>
</html>