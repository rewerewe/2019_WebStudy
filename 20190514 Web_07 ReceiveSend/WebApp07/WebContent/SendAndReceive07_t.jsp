<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.Calendar" %>

<%
	
	// 이전페이지(자기 자신) 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
 
	
	// Calendar 객체 생성 
	// java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//--2019
	int nowMonth = cal.get(Calendar.MONTH)+1;		//--5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); 	//--13
	
	
	// 표시할 달력의 년, 월 구성
	// 1) → 페이지 최초 요청을 예상하여 감안한코드 → 초기화를 현재 년, 월로 초기화
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	
	// 2) → 페이지 최초 요청이 아닐경우 감안한코드 → 표시할 달력의 초기화를 수신한 년, 월로 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 년도 select option 구성 ---------------------------------------------
	// <option value="2009">2009</option>
	// <option value="2010">2010</option>
	// <option value="2011">2011</option>
	// <option value="2012">2012</option>
	// <option value="2013">2013</option>
	//					:
	// <option value="2019" selected="selected">2019</option>
	//					:
	// <option value="2026">2026</option>
	// <option value="2027">2027</option>
	// <option value="2028">2028</option>
	// <option value="2029">2029</option>
	
	String yOptions = "";
	
	for(int year=(selectYear-10); year<=(selectYear+10); year++)
	{
			// 상황1. 페이지 최초 요청 → sYear 는 null, 현재년도와 옵션값이 같을 때 
			
			// 상황2. 페이지 최초 요청 아닐 때 →
			
			// 상황3. 나머지 
			
			if (sYear==null && year== nowYear)
			{
				yOptions += "<option value='"+ year +"' selected='selected'>"+ year +"</option>";
			}		
			else if (sYear!=null && Integer.parseInt(sYear)==year)
				// 특정년도를 선택했을 때. 선택한 년도로 그대로 두기 위함. (안해주면 2019→2024→2019로 돌아옴)
			{
				yOptions += "<option value='"+ year +"' selected='selected'>"+ year +"</option>";
			}
			else
			{
				yOptions += "<option value='"+ year +"'>"+ year +"</option>";
			}
	}
	
	//-----------------------------------------------확인한 날짜로 년도 select option 구성 
	
	
	// 확인한 날짜로 달 select option 구성 ---------------------------------------------
	
	String mOptions = "";
	
	for(int month=1; month<=12; month++)
	{
		
		if (sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='"+ month +"' selected='selected'>"+ month +"</option>";
			
		}
		else if (sMonth != null && Integer.parseInt(sMonth)==month)
		{
			mOptions += "<option value="+ month +"' selected='selected'>"+ month +"</option>";
		}
		else
		{
			mOptions += "<option value='"+ month +"'>"+ month +"</option>";
		}
	}
	
	// -----------------------------------------------확인한 날짜로 달 select option 구성 
	
	//그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (feat.만년달력)
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if ((selectYear%4==0 && selectYear%100!=0) || selectYear%400==0)
	{
		months[1] = 29;
	}
	
	// 총 날수 누적변수
	int nalsu;
	
	//요일 항목 배열 구성
	String[] weekname = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재년도 ~ 입력받은 년도의 이전년도까지의 날수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재월 → 입력받은 월의 이전까지의 날수 추가
	for (int i=0; i<selectMonth-1; i++)
	{
		nalsu += months[i];
	}
	
	nalsu++; 	// +1
	
	//------------------------------ 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1]; 	//--마지막 날짜 변수
	
	
	// 달력 그리기 (문자열 조합...append + String builder???)---------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	
		// 요일 범례
	calStr += "<tr>";
	for(int i=0; i< weekname.length; i++)
	{
		if (i==0)
			calStr += "<th style='color:red;'>"+ weekname[i] +"</th>";
		else if (i==6)
			calStr += "<th style='color:blue;'>"+ weekname[i] +"</th>";
		else
			calStr += "<th>"+ weekname[i] + "</th>";
	
	}
	calStr += "</tr>";
	
	// 빈칸 공백 td 발생
	calStr += "<tr>";
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	// 날짜 td 발생
	// for(int i=1; i<=months[selectMonth-1]; i++)
	for(int i=1; i<=lastDay; i++)
	{
		week++;		//-- ??? 왜 더해주는거지
		
		// calStr += "<td>"+ i +"</td>"
		
		// selectYear==nowYear && selectMonth==nowMonth && i==nowDay 조건을 명시하는 이유.
		// 선택한 년, 월이 바뀌면 
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSat'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>"+ i +"</td>"; 
		
		// 위에 해줬는데 또 분기해주는 이유는?
		else if(week%7==0)
			calStr += "<td class='sat'>"+ i +"</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>"+ i +"</td>";
		else
			calStr += "<td>"+ i +"</td>";
		
		if (week%7==0)
		{
			calStr += "</tr><tr>";	
		}
	}
	
	// 빈칸 공백 td 발생
	for (int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if (week%7 != 0)
		calStr += "</tr>";
		
	calStr +="</table>";
	// -------------------------------------------------------------------------- 달력 그리기 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_t.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
</style>

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


<div>
	<h1>데이터 송수신 실습07</h1>
	<hr>
</div>

</body>
<div>
	<!-- form 의 action 속성 값 생략 → 데이터의 수신처를 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option>2019</option> -->
			<%=yOptions %>
		</select> 년
		
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select>월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 : 최초 페이지가 로드되면 2019년 5월 달력이 보여야 한다. -->
	달력
	<%=calStr %>
</div>


</html>