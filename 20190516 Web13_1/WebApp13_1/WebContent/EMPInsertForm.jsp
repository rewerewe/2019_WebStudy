<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%
	StringBuffer manager = new StringBuffer();
	StringBuffer dept = new StringBuffer();		
	String deptno = "";
	
	// String getDeptno = request.getParameter("deptno");	
	
	EmpDAO empdao = new EmpDAO();
	DeptDAO deptdao = new DeptDAO();
	
	try
	{		
		empdao.connection();
		deptdao.connection();
		
		
		for (DeptDTO dto : deptdao.lists())
		{
		    dept.append("<option value='" + dto.getDeptno() + "'>" + dto.getDname() + "</option>");
			deptno = dto.getDeptno();
		}
		
		
		for (EmpDTO dto : empdao.lists())
		{
		    manager.append("<option value='" + dto.getEmpno() + "'>" + dto.getEname() + "</option>");
		}	
		
		/*
		for (EmpDTO dto : empdao.mgrSearch(getDeptno))
		{
		    manager.append("<option value='" + dto.getEmpno() + "'>" + dto.getEname() + "</option>");
		}	
		
		if (getDeptno != null)
		{
			for (EmpDTO dto : empdao.mgrSearch(getDeptno))
			{
			    manager.append("<option value='" + dto.getEmpno() + "'>" + dto.getEname() + "</option>");
			}	
		}
		*/
	
	}
	catch (Exception e)
	{	
		System.out.println(e.toString());
	}
	

	   	String sYear = request.getParameter("year");
		String sMonth = request.getParameter("month");
		String sDay = request.getParameter("day");

		Calendar cal = Calendar.getInstance();

		int nowYear = cal.get(Calendar.YEAR); 			// 2019
		int nowMonth = cal.get(Calendar.MONTH) + 1; 	// 5
		int nowDay = cal.get(Calendar.DAY_OF_MONTH); 	// 17

		int selectYear = nowYear;
		int selectMonth = nowMonth;
		int selectDay = nowDay;

		if (sYear != null || sMonth != null)
		{
			selectYear = Integer.parseInt(sYear);
			selectMonth = Integer.parseInt(sMonth);
			selectDay = Integer.parseInt(sDay);
		}

		String yOptions = "";
		String mOptions = "";
		String dOptions = "";

		for (int year = (selectYear - 100); year <= (selectYear); year++)
		{

			if (sYear == null && year == nowYear)
			{
				yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
			} 
			else if (sYear != null && Integer.parseInt(sYear) == year)
			{
				yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
			} 
			else
			{
				yOptions += "<option value='" + year + "'>" + year + "</option>";
			}
		}

		for (int month = 1; month <= 12; month++)
		{
			if (sMonth == null && month == nowMonth)
			{
				mOptions += "<option value='" + month + "'selected='selected'>" + month + "</option>";
			} 
			else if (sMonth != null && Integer.parseInt(sMonth) == month)
			{
				mOptions += "<option value='" + month + "'selected='selected'>" + month + "</option>";
			} 
			else
			{
				mOptions += "<option value='" + month + "'>" + month + "</option>";
			}
		}

		for (int day = 1; day <= 31; day++)
		{
			//상황1. 페이지 최초 요청 → sYear null, 현재 년도와 옵션값이 같을 때 
			//상황2. 페이지 최초 요청 아닐 때 
			//상황3. 나머지
			if (sDay == null && day == nowDay)
			{
				dOptions += "<option value='" + day + "'selected='selected'>" + day + "</option>";
			} 
			else if (sDay != null && Integer.parseInt(sDay) == day)
			{
				dOptions += "<option value='" + day + "'selected='selected'>" + day + "</option>";
			} 
			else
			{
				dOptions += "<option value='" + day + "'>" + day + "</option>";
			}
		}

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMPInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	
	

</style>
<script type="text/javascript">

	function empSubmit()
	{		
		var empForm = document.getElementById("empForm");
		
		var year = document.getElementById("year");
		var month = document.getElementById("month");
		var day = document.getElementById("day");
		var hMsg = document.getElementById("hiredMsg");

		var ename = document.getElementById("ename");
		var nMsg = document.getElementById("enameMsg");
		
		var dname = document.getElementById("dname");
		var dMsg = document.getElementById("deptMsg");
		
		var job = document.getElementById("job");
		var jMsg = document.getElementById("jobMsg");

		var mname = document.getElementById("mname");
		var mMsg = document.getElementById("mnameMsg");
		
		var sel = document.getElementById("sal");
		var sMsg = document.getElementById("salMsg");
		
		var comm = document.getElementById("comm");
		var cMsg = document.getElementById("commMsg");
		
		hMsg.style.display = "none";
		nMsg.style.display = "none";
		jMsg.style.display = "none";
		dMsg.style.display = "none";
		mMsg.style.display = "none";
		sMsg.style.display = "none";
		cMsg.style.display = "none";
		
		if (year.value=="" || month.value=="" || day.value=="")
		{
			hMsg.style.display = "inline";
			return;
		}

		if (ename.value=="")
		{
			nMsg.style.display = "inline";
			ename.focus();
			return;
		}
		
		if (job.value=="")
		{
			jMsg.style.display = "inline";
			job.focus();
			return;
		}
		
		if (dname.value=="")
		{
			dMsg.style.display = "inline";
			dname.focus();
			return;
		}
		
		if (mname.value=="")
		{
			mMsg.style.display = "inline";
			mname.focus();
			return;
		}
		
		if (sal.value=="")
		{
			sMsg.style.display = "inline";
			sal.focus();
			return;
		}
		
		if (comm.value=="")
		{
			cMsg.style.display = "inline";
			comm.focus();
			return;
		}
		
	
		empForm.submit();
	}
	
	function empReset()
	{
		var empForm = document.getElementById("empForm");

		var ename = document.getElementById("ename");
		var nMsg = document.getElementById("enameMsg");
		var jMsg = document.getElementById("jobMsg");
		var dMsg = document.getElementById("deptMsg");
		var mMsg = document.getElementById("mnameMsg");
		var sMsg = document.getElementById("salMsg");
		var cMsg = document.getElementById("commMsg");
		
		nMsg.style.display = "none";
		jMsg.style.display = "none";
		dMsg.style.display = "none";
		mMsg.style.display = "none";
		sMsg.style.display = "none";
		cMsg.style.display = "none";
				
		empForm.reset();
		ename.focus();
	}
	
	/* 	
 	function deptSelect(deptno)
	{
		
		// window.location.href="EMPInsertForm.jsp?deptno=" + deptno;
		// document.querySelector("mname").options[1] = new Option("정임혜", 1);
		
	} 
	*/
	
	
</script>
</head>
<body>

<div>
	<h1>직원 명단 관리 및 입력 페이지</h1>
	<hr>
</div>

<div>
	<a href="EMPSelect.jsp"><button>직원 명단 관리</button></a>
</div>

<br>

<div>
	<!-- 직원 정보 입력 폼 구성  -->
	<form action="EMPInsert.jsp" method="post" id="empForm">
		<table class="table">
			<tr>
				<th>입사일</th>
				<td>
					<!-- <input type="text" id="datehired" name="datehired"> -->
					<select style="width:30%;" id="year" name="year" onchange="formCalendar(this.form)">
					    <!-- <option>2019</option> --> 
						<%=yOptions %>
					</select>
					<select style="width:30%;" id="month" name="month" onchange="formCalendar(this.form)">
					   <%=mOptions %>
					</select>
					<select style="width:30%;" id="day" name="day" onchange="formCalendar(this.form)">
					   <%=dOptions %>
					</select>
				</td>
				<td id="noneColor">
					<span class="errMsg" id="hiredMsg">입사일을 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="ename" name="ename">
				</td>
				<td id="noneColor" >
					<span class="errMsg" id="enameMsg">이름을 입력해주세요.</span>			
				</td>
			</tr>
			<tr>
				<th>직무</th>
				<td>
					<select id="job" name="job" style="width:100%;">
						<option value="">직무선택</option>
						<option value="ANALYST">ANALYST</option>
						<option value="CLERK">CLERK</option>
						<option value="MANAGER">MANAGER</option>
						<option value="SALESMAN">SALESMAN</option>
						<option value="PRESIDENT">PRESIDENT</option>
					</select>
				</td>
				<td id="noneColor">
					<span class="errMsg" id="jobMsg">직무를 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>부서명</th>
				<td>
					<select id="dname" name="dname" style="width:100%;">
					<!-- <select id="dname" name="dname" style="width:100%;" onchange="deptSelect(this.value)"> -->
						<option value="" selected="selected" >부서 선택</option>
						<!-- 현재 부서를 모두 보여주도록 스크립트 릿에서 for문으로 가져오기 -->
						<%= dept %>
					</select>
				</td>
				<td id="noneColor">
					<span class="errMsg" id="deptMsg">부서를 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>매니저명</th>
				<td>
					<select name="mname" id="mname" style="width:100%;">
						<option value="" selected="selected">매니저선택</option>
						<option value="0">미배정</option>
						<!-- 현재 직원을 매니저로 입력할 수 있게끔 스크립트 릿에서 for문으로 가져오기 -->
						<%= manager %>
					</select>
				</td>
				<td id="noneColor">
					<span class="errMsg" id="mnameMsg">매니저를 선택해주세요.</span>
				</td>
			</tr>			
			<tr>	
				<th>급여</th>
				<td>
					<input type="text" id="sal" name="sal">
				</td>
				<td id="noneColor">
					<span class="errMsg" id="salMsg">급여를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>수당</th>
				<td>
					<input type="text" id="comm" name="comm">
				</td>
				<td id="noneColor">
					<span class="errMsg" id="commMsg">수당을 입력해주세요.</span>
				</td>
			</tr>
			
		</table>
		<br>
		<a href="javascript:empSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:empReset()"><button type="button">취소하기</button></a>
		<a href="EMPSelect.jsp"><button type="button">목록으로</button></a>
	</form>
	
</div>

</body>
</html>