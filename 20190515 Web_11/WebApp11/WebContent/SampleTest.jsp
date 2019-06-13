<%@page import="com.test.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	ScoreDAO dao = new ScoreDAO();
	
	StringBuffer resultBuffer = new StringBuffer();
	
	resultBuffer.append("<table><tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>");
	
	for(ScoreDTO dto:dao.lists())
	{
		resultBuffer.append("<tr>");
		resultBuffer.append("<td>"+String.valueOf(dto.getSid())+"</td>");
		resultBuffer.append("<td>"+dto.getName()+"</td>");
		resultBuffer.append("<td>"+String.valueOf(dto.getKor())+"</td>");
		resultBuffer.append("<td>"+String.valueOf(dto.getEng())+"</td>");
		resultBuffer.append("<td>"+String.valueOf(dto.getMat())+"</td>");
		resultBuffer.append("<td>"+String.valueOf(dto.getTot())+"</td>");
		resultBuffer.append("<td>"+String.format("%.1f",dto.getAvg())+"</td>");
		resultBuffer.append("</tr>");
	}
	resultBuffer.append("</table>");
	
	String result = resultBuffer.toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
	.errMsg
	{
		color:red;
		font-size: small;
		display: none;
	}
</style>
</head>
<body>
<div>
	<h1>큰 주제</h1>
	<hr>
</div>

<div>
	<p>작은주제</p>
	<form action="">
		이름(*)<input type="text" id="name" name="name"><span class="errMsg" id="errName">이름을 입력하세요</span><br>
		국어점수<input type="text" id="kor" name="kor"><span class="errMsg" id="errKor">0~100을 입력해주세요</span><br>
		영어점수<input type="text" id="eng" name="eng"><span class="errMsg" id="errEng">0~100을 입력해주세요</span><br>
		수학점수<input type="text" id="mat" name="mat"><span class="errMsg" id="errMat">0~100을 입력해주세요</span><br>
		<button type="submit">성적 입력</button>
	</form>
	<%=result %>
</div>
</body>
</html>