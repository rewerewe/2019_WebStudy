<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.DeptDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String deptno = request.getParameter("deptno");
	String dName = "";
	String loc = "";
	StringBuffer str = new StringBuffer();
	
	DeptDAO dao = null;

	try {
		dao = new DeptDAO();
		dao.connection();
		DeptDTO dto = dao.serachBuseo(deptno);
		
		dName = dto.getDname();
		loc = dto.getLoc();
		
		for(DeptDTO dept : dao.buseoList())
		{
			
			str.append("<option value='"+dept.getLoc()+"' ");
 			if(dept.getDeptno().equals(deptno))
 			{
			str.append("selected ='selected'>");
 			}
			else
			{
				str.append(">");
			}
			str.append(dept.getLoc());
			str.append("</option>");
			
		}

		
		

	} catch (Exception e) {
		System.out.print(e.toString());
	} finally {
		try {
			dao.close();
		} catch (Exception e) {
			System.out.print(e.toString());
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

<meta charset="UTF-8">
<title>AdminBuseoAddForm.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/1.css">
<style type="text/css">

	.errMsg { display : none; color : red; font-weight: bold;}

</style>
<script type="text/javascript">
	function formCheck()
	{
		var dName = document.getElementById("dName");
		var buseoMsg = document.getElementById("buseoMsg");
		
		buseoMsg.style.display = "none";

		if (dName.value == "")
		{
			buseoMsg.style.display = "inline";
			dName.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<div>
		<h1>부서 수정 페이지</h1>
		<hr>
	</div>


	<br>
	<br>

	<div>
		<form action="AdminBuseoAddUpdate.jsp?deptno=<%=deptno %>" method="post" onsubmit="return formCheck()">
			<table class="table table-hover">
				<tr>
					<th scope="row">부서번호</th>
					<td><%=deptno %></td>
				</tr>
				<tr>
					<th scope="row">수정할 부서 이름(*)</th>
					<td><div class="form-group"><input type="text" class="txt" id="dName" name="dName" value="<%=dName%>"></div>
						<span class="errMsg" id="buseoMsg">부서 이름을 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">수정할 지역</th>
					<td><select name="loc" class="custom-select custom-select-lg mb-3"">
					<%=str %>
					</select></td>
				</tr>
			</table>
			<br>
			<br>
			<button type="submit" class="btn btn-primary btn-lg">수정하기</button>
			<button type="reset" class="btn btn-primary btn-lg">취소하기</button>
			<a href="../EmpMain.jsp"><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
		</form>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>