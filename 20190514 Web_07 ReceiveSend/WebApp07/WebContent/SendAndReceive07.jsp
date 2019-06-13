<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();

	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력하는 형태의 페이지를 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재년도 기준 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1월부터 12월까지로 구성한다.
	   
	   [  2019 ▼ ]년 [ 5 ▼ ]월
	   
	   -------------------------
	   -------------------------	

		- 년도 select box 나 월 select box 의 내용 변화시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		  
		- 사용자 최초 요청 주소는
		  『http://localhost:8090/WebApp07/SendAndReceive07.jsp』 로 한다.
		  
	○ SendAndReceive07.jsp 		  
		  
 -->

</body>

<div>
	<h1>데이터 송수신 실습07</h1>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 값 생략 → 데이터의 수신처를 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year">
			<option>2019</option>
		</select> 년
		
		<select id="month" name="month">
			<option>5</option>
		</select>월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 : 최초 페이지가 로드되면 2019년 5월 달력이 보여야 한다. -->
	달력
</div>

</html>