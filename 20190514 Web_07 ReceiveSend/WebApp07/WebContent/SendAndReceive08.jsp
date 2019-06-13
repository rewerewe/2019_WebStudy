<%@page import="java.time.Year"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
	// 선택한 년, 월 파라미터 
	String previousYearMonth = request.getParameter("");
	String afterYearMonth = request.getParameter("right");

	// 현재 년, 월, 일 가져오기
	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 선택한 년, 월로 초기화
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	/*
	if  
	{
		selectYear = 
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08</title>
<script type="text/javascript">

	function formCalendar(obj)
	{
		obj.submit();	
	}
	
</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력하는 형태의 페이지를 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   
	   ◀ 2019 년  5 월 ▶
	   
	   -------------------------
	   -------------------------	

		- 『◀』 인 『▶』 클릭시 
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		  
		- 사용자 최초 요청 주소는
		  『http://localhost:8090/WebApp07/SendAndReceive07.jsp』 로 한다.
		  
	○ SendAndReceive07.jsp 		  
		  
 -->

<div>
	<h1>데이터 송수신 실습08</h1>
	<hr>
</div>

<div>
	<form action="" method="post">
					<button type="button" id="btnLeft"  name="btnLeft" onclick="formCalendar(form)"> ◀ </button>
					<input type="textbox" id="txtYear" name="txtYear" readonly="readonly" value='<%=nowYear %>'> 년
					<input type="textbox" id="txtMonth" name="txtMonth" readonly="readonly" value='<%=nowMonth %>'> 월 
					<button type="button" id="btnRight" name="btnRight" onclick="formCalendar(form)"> ▶ </button>
	</form>
</div>
</body>
</html>