<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	DeptDAO dao = null;
	StringBuffer str = new StringBuffer();

	try { //데이터베이스 연결
		dao = new DeptDAO();
		dao.connection();
		str.append("<table class='table table-hover'><thead>");

		str.append("<tr><th scope='col'>부서번호</th><th scope='col'>부서이름</th><th scope='col'>지역</th></tr><tbody>");

		for (DeptDTO dept : dao.buseoList()) {
			str.append("<tr>");
			str.append("<td>" + dept.getDeptno() + "</td>");
			str.append("<td>" + dept.getDname() + "</td>");
			str.append("<td>" + dept.getLoc() + "</td>");
			str.append("</tr>");

		}

		str.append("</tbody></table>");

	} catch (Exception e) {
		System.out.println(e.toString());
	} finally {
		try { //데이터 베이스 연결 종료
			dao.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>AdminBuseoAddForm.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/1.css">
<script type="text/javascript">
	function formCheck()
	{
		var bName = document.getElementById("dName");
		var buseoMsg = document.getElementById("buseoMsg");

		buseoMsg.style.display = "none";

		if (bName.value == "")
		{
			buseoMsg.style.display = "inline";
			bName.focus();
			return false;
		}
		return true;
	}
</script>
<style>
	
	.errMsg{display:none; color:red; font-weight: bold;}
		
</style>
</head>
<body>

	<div>
		<h1>부서 추가 입력 페이지</h1>
		<hr>
	</div>


	<div>
	<!-- 	<p>현존하는 부서</p> -->
		<%=str%>
	</div>

	<br>
	<br>

	<div>
		<form action="AdminBuseoAdd.jsp" method="post"
			onsubmit="return formCheck()">
			<table class="table">
				<tr>
					<th scope="row">추가할 부서 이름(*)</th>
					<td><div class="form-group"><input type="text" class="txt" id="dName" name="dName"></div>
						<span class="errMsg" id="buseoMsg">부서 이름을 입력하세요.</span></td>
				</tr>
				<tr>
					<th scope="row">지역</th>
					<td><select name="loc" class="custom-select custom-select-lg mb-3">
							<option>--지역 선택--</option>
							<option value="BUSTON">BUSTON</option>
							<option value="CHICAGO">CHICAGO</option>
							<option value="DALLAS">DALLAS</option>
							<option value="NEW YORK">NEW YORK</option>
							<option value="LA">LA</option>
							<option value="TOKYO">TOKYO</option>
					</select></td>
				</tr>
			</table>
			<br> <br>
			<div style='text-align:center;'>
			<button type="submit" class="btn btn-primary btn-lg">추가하기</button>
			<button type="reset" class="btn btn-primary btn-lg">취소하기</button>
			<a href="../EmpMain.jsp"><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
			</div>
		</form>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>