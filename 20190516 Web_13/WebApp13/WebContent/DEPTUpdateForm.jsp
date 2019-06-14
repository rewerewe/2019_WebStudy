<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String deptno = request.getParameter("deptno"); 
	String dname = ""; 
	String loc = ""; 
	
	DeptDAO dao = new DeptDAO(); 
	
	try
	{		
		dao.connection();
		
		DeptDTO dto = dao.search(deptno); 
		dname = dto.getDname(); 
		loc = dto.getLoc();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString()); 
	}
	finally
	{
		try
		{
			dao.close(); 
		}
		catch(Exception e)
		{
			System.out.println(e.toString()); 
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPTUpdateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/team4_v1.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
<script type="text/javascript">

	function deptSubmit()
	{

		var deptForm = document.getElementById("deptForm");
		
		var dName = document.getElementById("dName"); 
		var dnameMsg = document.getElementById("dnameMsg"); 
		
		dnameMsg.style.display = "none";
		
		if(dName.value == "") 
		{
			dnameMsg.style.display ="inline";
			dName.focus(); 
			return; 						//-- '종료' 의미
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		deptForm.submit(); 		
	}
	
	function deptReset()
	{
		var deptForm = document.getElementById("deptForm"); 
		var dName = document.getElementById("dName"); 
		var dnameMsg = document.getElementById("dnameMsg"); 
		
		dnameMsg.style.display = "none"; 
		
		// form 을 직접 지정하여 reset 액션 수행 
		deptForm.reset();
		dName.focus(); 
	}


</script>
</head>
<body>

<!-- http://localhost:8090/WebApp12/DEPTUpdateForm.jsp -->

<!-- 
<div>
	<h1>부서 수정 페이지(DEPTUpdateForm.jsp)</h1>
	<hr>
</div>


<div>
	<a href="EMPSelect.jsp"><button type="button">직원 명단 관리</button></a>
</div>
 -->

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Home |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	  <li class="nav-item">
        <a class="nav-link" href="DEPTSelect.jsp" style="font-size: 1.5rem;">부서관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="font-size: 1.5rem;">부서 정보 수정</a>
      </li>
    </ul>
  </div>
</nav>

<br>

<div>
	<!-- 부서 정보 입력 폼 구성 -->
	<form action="DEPTUpdate.jsp?deptno=<%=deptno %>" method="post" id="deptForm" >
		<table class="table" style="width: 25%; margin-left:10px;">
			<tr>
				<th>부서명(*)</th>
				<td>
					<input type="text" id="dName" name="dName" value="<%=dname%>">
				</td>
				<td>	
					<span class="errMsg" id="dnameMsg" style="display:none; font-size: small; color:red;">부서명을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>위치</th>
				<td>
					<input type="text" id="dLoc" name="dLoc" value="<%=loc%>">
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		
		<div style="margin-left:25px;">
			<a href="javascript:deptSubmit()"><button type="button" class="btn btn-secondary" style="margin:10px;">수정하기</button></a>
			<a href="javascript:deptReset()"><button type="button" class="btn btn-secondary" style="margin:10px;">취소하기</button></a>
			<a href="DEPTSelect.jsp"><button type="button" class="btn btn-secondary" style="margin:10px;">목록으로</button></a>
		</div>


	</form>
</div>

</body>
</html>