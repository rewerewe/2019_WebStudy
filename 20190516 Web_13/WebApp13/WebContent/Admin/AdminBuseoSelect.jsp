<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	DeptDAO dao = null;
	StringBuffer str = new StringBuffer();
	
	
	try
	{	//데이터베이스 연결
		dao = new DeptDAO();
		dao.connection();
		str.append("<table class='table table-hover'>");
	
		str.append("<tr><th scope='col'>부서번호</th><th scope='col'>부서이름</th><th scope='col'>지역</th><th colspan='2' scope='col'>부서 수정/삭제 </th></tr>");
		
		for(DeptDTO dept : dao.buseoList())
		{
			str.append("<tr>");
			str.append("<th scope='row'>"+dept.getDeptno()+"</td>");
			str.append("<td>"+dept.getDname()+"</td>");
			str.append("<td>"+dept.getLoc()+"</td>");
			str.append("<td>");
			str.append("<a href='AdminBuseoAddUpdateForm.jsp?deptno="+dept.getDeptno()+ "'>");
			str.append("<button type='button' class='btn btn-outline-primary'>수정</button>");
			str.append("</a>");
			str.append("<a href='javascript:buseoDelete("+dept.getDeptno()+")'>");
			str.append("<button type='button' class='btn btn-outline-danger'>삭제</button>");
			str.append("</a>");
			str.append("</td>");
			str.append("</tr>");
			
		}
		
		str.append("</table>");
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{	//데이터 베이스 연결 종료
			dao.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>AdminBuseoAddForm.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/1.css">

<script type="text/javascript">

	function formCheck()
	{
		var bName = document.getElementById("dName");
		var buseoMsg = document.getElementById("buseoMsg");
		
		buseoMsg.style.display = "none";
		
		if(bName.value =="")
		{
			buseoMsg.style.display = "inline";
			bName.focus();
			return;
		}
	}
	
	function buseoDelete(deptno)
	{
		var res = confirm("정말 삭제하시겠습니까? 삭제하시게 되면 당신 부서의 부하들이 자부심을 가지고 열심히 일하는 부서가 사라집니다.");
		
		if(res)
		{
			window.location.href = "AdminBuseoDelete.jsp?deptno="+ deptno;
		}
		
	}
	
</script>
</head>
<body>

<div>
	<h1>부서 관리 페이지</h1>
	<hr>
</div>

<div>
	<form id="form">
	<%=str %>
	</form>
</div>
<br><br>
	<div style='text-align:center;'>
		<a href="AdminBuseoAddForm.jsp"><button type="button" class="btn btn-primary btn-lg">부서 추가하기</button></a>
		<a href="../EmpMain.jsp"><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
