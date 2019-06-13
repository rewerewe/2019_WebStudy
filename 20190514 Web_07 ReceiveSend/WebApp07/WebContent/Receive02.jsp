<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	int kor = Integer.parseInt(userKor);
	int eng = Integer.parseInt(userEng);
	int mat = Integer.parseInt(userMat);
	
	int tot = 0;
	double avg = 0.0;
	
	tot = kor + eng + mat;
	avg = tot/3;
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
</head>
<body>

<div>
	<h1>회원 성적처리 결과</h1>
	<p></p>
	<span><%=userName %> 님, 성적처리가 완료되었습니다. <br> 
	      회원님의 점수는 국어: <%=userKor %> 점, 영어: <%=userEng %> 점, 수학: <%=userMat %> 점 입니다.<br>
		  총점은 <%=tot %> 점, 평균은 <%=avg %> 점 입니다. <br>
	</span>
</div>


</body>
</html>