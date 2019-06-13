<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	// 선언부 Declaration
%>
<%
	// 스크립트 릿 	Scriptlet
	
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			// 2019
	int nowMonth = cal.get(Calendar.MONTH)+1;		// 5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	// 13

	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지 최초 요청이 아닐 경우
	// → 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 년도 select option 구성 -------------------------------------
	//<option value="2009">2009</option>
	//<option value="2010">2010</option>
	//<option value="2011">2011</option>
	//					:					
	//<option value="2019">2019</option>
	//					:
	//<option value="2027">2027</option>
	//<option value="2028">2028</option>
	//<option value="2029">2029</option>
	
	String yOptions = "";
	
	for (int year =(selectYear-10); year<=(selectYear+10); year++ )
	{
		// 상황1. 페이지 최초 요청 → sYear는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if(sYear==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else if(sYear!=null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";			
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}

	String mOptions = "";
	
	for (int month =1; month<=12; month++ )
	{
		// 상황1. 페이지 최초 요청 → sMonth는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if(sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else if(sYear!=null && Integer.parseInt(sMonth)==month)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";			
		}
		else
		{
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		}
	}
	// ------------------------------------- 확인한 날짜로 년도 select option 구성 
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (만년달력)
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
		months[1] = 29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 현재년도 - 입력받은년도의 이전년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 이전월까지의의 날 수 추가
	for(int i=0; i<selectMonth-1; i++)
	{
		nalsu += months[i];
	}
	nalsu++; // +1
	
	// 그려야할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	
	int week = nalsu%7;
	int lastDay = months[selectMonth-1];
	
	// 달력 그리기 ---------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for(int i=0; i<weekName.length ; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekName[i].substring(0,1) + "</th>";
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekName[i].substring(0,1) + "</th>";
		else
			calStr += "<th style='color:black;'>" + weekName[i].substring(0,1) + "</th>";
	}
	
	calStr += "<tr>";
	
	// 빈칸 공백 td 발생
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay ;i++)
	{
		week++;
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
		{
			calStr += "<td class='nowSat'>"+i+"</td>";
		}
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay &&week%7==1)
		{
			calStr += "<td class='nowSun'>"+i+"</td>";
		}
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
		{
			calStr += "<td class='now'>"+i+"</td>";
		}
		else if(week%7==0)
		{
			calStr += "<td class='sat'>"+i+"</td>";
		}
		else if(week%7==1)
		{
			calStr += "<td class='sun'>"+i+"</td>";
		}
		else
		{
			calStr += "<td>"+i+"</td>";
		}
		
		if(week%7==0)
		{
			calStr += "<tr></tr>";
		}
	}
	
	// 빈칸 공백 td 발생
	for(int i=1; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}

	
	calStr += "</tr>";	
	calStr += "</table>";	
	// --------------------------------------------------------------- 달력 그리기 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<style>
	td{text-align: right;}
	td.nowSat{background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun{background-color: aqua; font-weight: bold; color: red;}
	td.now{background-color: aqua; font-weight: bold; color: black;}
	td.sat{font-weight: bold; color: blue;}
	td.sun{font-weight: bold; color: red;}
</style>
<script>
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
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1월 부터 12월 까지로 구성한다.
	   
	   [ 2019 ▼ ]년 [  5 ▼ ]월
	   
	   -------------------------
	   -------------------------
	   
	   - 년도 select box나 월 select box의 내용 변화 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     『http://localhost:8090/WebApp07/SendAndReceive07.jsp』로 한다.
 -->
	
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<br>

<div>
	<!-- form의 action 속성 값 생략 → 데이터의 수신처는 자기 자신 -->
	<form action="" method="get" id="form">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=yOptions %>
		</select>년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select>월
	</form>
</div>

<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	달력
	<%=calStr %>
</div>


</body>
</html>