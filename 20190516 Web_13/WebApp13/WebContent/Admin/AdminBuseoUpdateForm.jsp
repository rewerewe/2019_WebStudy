<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empNo");
	String name = "";
	String buseo = "";
	
	DeptDAO dao = new DeptDAO();
	
	try
	{
		dao.connection();
		
		DeptDTO dept = dao.searchEmpno(empno);
		
		name = dept.getEname();
		buseo = dept.getDname();
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();	
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel= "stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	
	function deptSubmit()
	{
		
		var deptForm = document.getElementById("deptForm");
		
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value =="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		deptForm.submit();
	}
	
	function deptReset()
	{
		var deptForm = document.getElementById("deptForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		deptForm.reset();
		
		uName.focus();
	}
</script>
</head>
<body>

<div>
	<h1>사원수정</h1>
	<hr>
</div>

<div>
	<form action="AdminBuseoUpdate.jsp" method="post" id="deptForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="uName" name="uName" value="<%= name%>">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>사원번호</th>
				<td>
					<input type="text" id="empNo" name="empNo" value="<%= empno%>">
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>부서명</th>
				<td>
					<select id="buseoName" name="buseoName">
						<option>ACCOUNTING(10)</option>
						<option>RESEARCH(20)</option>
						<option>SALES(30)</option>
						<option>OPERATIONS(40)</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:deptSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:deptReset()"><button type="button">취소하기</button></a>
		<a href="EmpMain.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>