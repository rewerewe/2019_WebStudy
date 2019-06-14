<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%		
	// 첫 진입했을때 EMPSelect.jsp 에서 empno 를 불러오게 된다.
	// 값 수정으로 인한 페이지 재진입에서는 empno가 아닌 empnoChanged로 불러오기 때문에
	// empno 는 null 인 상태
	String empno = request.getParameter("empno");	
	StringBuffer manager = new StringBuffer();
	StringBuffer dept = new StringBuffer();	
	EmpDAO empdao = new EmpDAO();
	DeptDAO deptdao = new DeptDAO();
	empdao.connection();
	deptdao.connection();	
	
	String ename="";
	String job="";
	String deptno="";
	String mgr="";
	int sal = 0;
	int comm = 0;
	String sYear = "";
	String sMonth = "";
	String sDay = "";
	
	
	// 수정하기 첫 진입이라면 데이터베이스에서 초기설정값 불러오기
	if(empno!=null) 
	{				
		EmpDTO dto1 = empdao.search(empno);
		
		ename = dto1.getEname();
		job = dto1.getJob();
		deptno = dto1.getDeptno();
		mgr = dto1.getMgr();
		sal = dto1.getSal();
		comm = dto1.getComm();
		StringTokenizer st = new StringTokenizer(dto1.getHiredate(),"-");
		sYear = st.nextToken();
		sMonth = st.nextToken();
		sDay = st.nextToken();
	}
	else // 값변경으로 인한 페이지 재진입이라면 request 에서 값 불러오기
	{
		empno = request.getParameter("empnoChanged");				
		ename = request.getParameter("ename");
		job = request.getParameter("job");
		deptno = request.getParameter("dno");
		sal = Integer.parseInt(request.getParameter("sal"));
		comm = Integer.parseInt(request.getParameter("comm"));
		mgr = request.getParameter("mname");
		sYear = request.getParameter("year");
		sMonth = request.getParameter("month");
		sDay = request.getParameter("day");
	}
	
	

 	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR); 			// 2019


	int selectYear = Integer.parseInt(sYear);
	int selectMonth = Integer.parseInt(sMonth);
	int selectDay = Integer.parseInt(sDay);	

	String jA = "";
	String jC = "";
	String jM = "";
	String jS = "";
	String jP = "";
	
	// 값 변경으로 인한 재진입일때 selected 설정을 위한 switch
	if(job!=null)
	{
		switch(job)
		{
			default : break;
			case "ANALYST" : jA = "selected='selected'"; break;
			case "CLERK" : jC = "selected='selected'"; break;
			case "MANAGER" : jM = "selected='selected'"; break;
			case "SALESMAN" : jS = "selected='selected'"; break;
			case "PRESIDENT" : jP = "selected='selected'"; break;
		}
	}	
	
		
	try
	{				
		for (DeptDTO dto : deptdao.lists())
		{    			
			if(deptno.equals(dto.getDeptno()))
			{	
				dept.append("<option value='" + dto.getDeptno() + "' selected='selected'>" + dto.getDname() + "</option>");
			}
			else
			{
				dept.append("<option value='" + dto.getDeptno() + "'>" + dto.getDname() + "</option>");	
			}		    		
		}		
		
		
		for (EmpDTO dto : empdao.mngLists(deptno))
		{	
			
			if(mgr.equals(dto.getEmpno()))
			{					
				manager.append("<option value='" + dto.getEmpno() + "' selected='selected'>" + dto.getEname() + "</option>");
			}
			else if(empno.equals(dto.getEmpno()))
			{
				
			}			
			else
			{					
				manager.append("<option value='" + dto.getEmpno() + "'>" + dto.getEname() + "</option>");
			} 
		} 	
	
	}
	catch (Exception e)
	{	
		System.out.println(e.toString());
	}	
	
   	

	String yOptions = "";
	String mOptions = "";
	String dOptions = "";

	for (int year = (nowYear - 100); year <= (nowYear); year++)
	{
		if (sYear != null && Integer.parseInt(sYear) == year)
		{
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		} 
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
      
    if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
        months[1] = 29;

	for (int month = 1; month <= 12; month++)
	{		
		if (sMonth != null && Integer.parseInt(sMonth) == month)
		{
			mOptions += "<option value='" + month + "'selected='selected'>" + month + "</option>";
		} 
		else
		{
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		}
	}
	
    
	
	
	for (int day = 1; day <= months[selectMonth-1]; day++)
	{			
		if (sDay != null && Integer.parseInt(sDay) == day)
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
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
		
		if (mname.value=="-1")
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
	
	
	function change(empno)
	{
	   var ename = document.getElementById("ename").value;
	   var job = document.getElementById("job").value;
	   var dno = document.getElementById("dname").value;
	   var sal = document.getElementById("sal").value;
	   var comm = document.getElementById("comm").value;
	   
	   var year = document.getElementById("year").value;
	   var month = document.getElementById("month").value;
	   var day = document.getElementById("day").value;
	   var mname = document.getElementById("mname").value;
	   
	   
	   
	   if(dname=="")
	   {
	      return;
	   }
	   
	   var addr = "EMPUpdateForm.jsp?empnoChanged=" + empno + "&";
	   
	   if(year != "")
	   {
	      addr += "year=" + year + "&";
	   }
	   
	   if(month != "")
	   {
	      addr += "month=" + month + "&";
	   }
	   
	   if(day!="")
	   {
	      addr += "day=" + day + "&";
	   }
	   
	   if(mname != "")
	   {
		   addr += "mname=" + mname + "&";
	   }
	   
	   if(ename != "")
	   {
	      addr += "ename=" + ename + "&";
	   }
	   
	   if(job != "")
	   {
	      addr += "job=" + job + "&";
	   }
	   
	   if(dno != "")
	   {
	      addr += "dno=" + dno + "&";
	   }
	   
	   if(sal != "")
	   {
	      addr += "sal=" + sal + "&";
	   }
	   
	   if(comm != "")
	   {
	      addr += "comm=" + comm + "&";
	   }
	   
	   if(mname != "")
	   {
	      addr += "mname=" + mname + "&";
	   }
	   
	   //alert(addr);
	   window.location.href=addr;
	}
	
	
</script>
</head>
<body>
<!-- 
<div>
	<h1>직원 명단 관리 및 입력 페이지</h1>
	<hr>
</div>
 -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Home |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" style="font-size: 1.5rem;">직원 정보 수정</a>
      </li>
    </ul>
  </div> 
  
</nav>

<br> 

<div>
	<!-- 직원 정보 입력 폼 구성  -->
	<form action="EMPUpdate.jsp?empno=<%=empno %>" method="post" id="empForm">
		<table class="table" style="width: 40%; margin-left:10px;">
			<tr>
				<th>입사일(*)</th>
				<td>
					<select style="width:30%;" id="year" name="year" class="custom-select" onchange="change(<%=empno%>)">
						<%=yOptions %>
					</select>
					<select style="width:30%;" id="month" name="month" class="custom-select" onchange="change(<%=empno%>)">
					   <%=mOptions %>
					</select>
					<select style="width:30%;" id="day" name="day" class="custom-select">
					   <%=dOptions %>
					</select>
				</td>
				<td>
					<span class="errMsg" id="hiredMsg" style="display:none; font-size:small; color:red;">입사일을 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="ename" name="ename" value="<%=ename %>" class="input-group-prepend">
				</td>
				<td>
					<span class="errMsg" id="enameMsg" style="display:none; font-size:small; color:red;">이름을 입력해주세요.</span>			
				</td>
			</tr>
			<tr>
				<th>직무(*)</th>
				<td>
					<select id="job" name="job" style="width:100%;" class="custom-select">
						<option value="" >직무선택</option>
						<option value="ANALYST" <%=jA %> >ANALYST</option>
						<option value="CLERK" <%=jC %>>CLERK</option>
						<option value="MANAGER" <%=jM %>>MANAGER</option>
						<option value="SALESMAN" <%=jS %>>SALESMAN</option>
						<option value="PRESIDENT" <%=jP %>>PRESIDENT</option>
					</select>
				</td>
				<td>
					<span class="errMsg" id="jobMsg" style="display:none; font-size:small; color:red;">직무를 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>부서명(*)</th>
				<td>
					<select id="dname" name="dname" style="width:100%;"  class="custom-select" onchange="change(<%=empno%>)">					
						<option value="-1" >부서 선택</option>
						<!-- 현재 부서를 모두 보여주도록 스크립트 릿에서 for문으로 가져오기 -->
						<%= dept %>
					</select>
				</td>
				<td>
					<span class="errMsg" id="deptMsg" style="display:none; font-size:small; color:red;">부서를 선택해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>매니저명(*)</th>
				<td>
					<select name="mname" id="mname" style="width:100%;" class="custom-select">
						<option value="-1">매니저선택</option>
						<option value="0">미배정</option>
						<!-- 현재 직원을 매니저로 입력할 수 있게끔 스크립트 릿에서 for문으로 가져오기 -->
						<%= manager %>
					</select>
				</td>
				<td>
					<span class="errMsg" id="mnameMsg" style="display:none; font-size:small; color:red;">매니저를 선택해주세요.</span>
				</td>
			</tr>			
			<tr>	
				<th>급여(*)</th>
				<td>
					<input type="text" id="sal" name="sal" value="<%=sal %>" class="input-group-prepend">
				</td>
				<td>
					<span class="errMsg" id="salMsg" style="display:none; font-size:small; color:red;">급여를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>수당(*)</th>
				<td>
					<input type="text" id="comm" name="comm" value="<%=comm %>" class="input-group-prepend">
				</td>
				<td>
					<span class="errMsg" id="commMsg" style="display:none; font-size:small; color:red;">수당을 입력해주세요.</span>
				</td>
			</tr>
			
		</table>
		<br>
		
		<div style="margin-left:25px;">
			<a href="javascript:empSubmit()"><button type="button" class="btn btn-secondary" style="margin:10px;">수정하기</button></a>
			<a href="EMPSelect.jsp"><button type="button" class="btn btn-secondary" style="margin:10px;">목록으로</button></a>
		</div>
	</form>
	
</div>

</body>
</html>