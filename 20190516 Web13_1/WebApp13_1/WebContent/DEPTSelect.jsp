<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	StringBuffer str = new StringBuffer(); 
	
	DeptDAO dao = new DeptDAO(); 
	
	try
	{
		// 데이터베이스 연결
		dao.connection(); 
		
		str.append("<table class='table'>");
		str.append("<tr>"); 
		str.append("<th class='numTh'>부서번호</th>"); 
		str.append("<th class='nameTh'>부서명</th>");
		str.append("<th>위치</th>");
		str.append("<th>부서관리</th>");
		str.append("</tr>"); 
		
		for(DeptDTO dept : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+ dept.getDeptno() +"</td>");
			str.append("<td>"+ dept.getDname() +"</td>");
			str.append("<td>"+ dept.getLoc() +"</td>");
			
			str.append("<td>");			
			str.append("<a href='DEPTUpdateForm.jsp?deptno=" + dept.getDeptno() + "'>"); 
			str.append("<button type='button' class='btn01'>");
			str.append("수정"); 
			str.append("</button>");
			str.append("</a>"); 
			
			str.append("<a href='javascript:deptDelete(" + dept.getDeptno() + ", \"" + dept.getDname() + "\")'>");
			str.append("<button type='button' class='btn01'>");
			str.append("삭제"); 
			str.append("</button>");
			str.append("</a>"); 
			
			str.append("</td>"); 
			
			str.append("</tr>"); 
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString()); 
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료 
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
<title>DEPTSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function deptDelete(deptno, dname)
	{
		var res = confirm("부서번호 : " + deptno + ", 부서명 : " + dname + "\n이 부서를 삭제하시겠습니까?");
		
		if(res)
			window.location.href="DEPTDelete.jsp?deptno=" + deptno; 				
	}

</script>

</head>
<body>


<!-- http://localhost:8090/WebApp12/DEPTSelect.jsp -->
<div>
	<h1>부서 관리 및 출력 페이지(DEPTSelect.jsp)</h1>
	<hr>
</div>

<div>
	<a href="EMPSelect.jsp"><button type="button">직원 명단 관리</button></a>
	<a href="DEPTInsertForm.jsp"><button type="button">신규 부서 등록</button></a>
	
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>



</body>
</html>