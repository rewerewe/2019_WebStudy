<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />
<!-- 반복문 필요 (다중 선택으로 넘어온 결과값 출력) -->
<%
	
	StringBuffer strIdeal = new StringBuffer();
	
	// getIdealType() 에서 하나 뽑아오면 String 타입이 된다. 
	for (String ideal : ob.getIdealType())
	{
		strIdeal.append(ideal); 
		strIdeal.append(" ");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>이상형 결과</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=ob.getName() %></h2>
	<h2>나이 : <%=ob.getAge() %></h2>
	<h2>성별 : <%=ob.getGender() %></h2>
	<h2>이상형 : <%=strIdeal %></h2>
</div>

</body>
</html>