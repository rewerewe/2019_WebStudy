<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpMainDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	StringBuffer str = new StringBuffer();
	EmpMainDAO dao = new EmpMainDAO();
	String s = null;

	try {
		dao.connection();

		str.append("<table class='table table-hover'><thead >");
		str.append("<tr>");
		str.append(
				"<th scope='col'>사원번호</th><th scope='col'>사원이름</th><th scope='col'>부서</th><th scope='col'>사원관리</th>");
		str.append("</tr></thead ><tbody>");

		if ((request.getParameter("search") != null)) {/* 검색의 request 유무에 따른 data  쿼리문 분기 */

			s = request.getParameter("search");
			for (EmpDTO dto : dao.searchList(s)) {
				str.append("<tr>");
				str.append("<th scope='row'>" + dto.getEmpno() + "</th>");
				str.append("<td>" + dto.getEname() + "</td>");
				str.append("<td>" + dto.getDeptName() + "</td>");
				str.append("<td>");
				str.append("<a href='EmpUpdateForm.jsp?empno=" + dto.getEmpno() + "'>");
				str.append("<button type='button' class='btn btn-outline-primary'>수정</button>");
				str.append("</a>");

				str.append("<button type='button' class='btn btn-outline-danger' onclick='deleteEmp("+dto.getEmpno()+",\""+dto.getEname()+"\")'>삭제</button>");


				str.append("</td>");
				str.append("</tr>");
			}

		} else {

			for (EmpDTO dto : dao.list()) {

				/* String deptno = dto.getDeptno();
				String dname = dao.search(deptno); */

				str.append("<tr>");
				str.append("<th scope='row'>" + dto.getEmpno() + "</th>");
				str.append("<td>" + dto.getEname() + "</td>");
				str.append("<td>" + dto.getDeptName() + "</td>");
				str.append("<td>");
				str.append("<a href='EmpUpdateForm.jsp?empno=" + dto.getEmpno() + "'>");
				str.append("<button type='button' class='btn btn-outline-primary'>수정</button>");
				str.append("</a>");

				str.append("<button type='button' class='btn btn-outline-danger' onclick='deleteEmp("+dto.getEmpno()+",\""+dto.getEname()+"\")'>삭제</button>");


				str.append("</td>");
				str.append("</tr>");
			}

		}

		str.append("</tbody></table>");
	} catch (Exception e) {
		System.out.println(e.toString());
	} finally {

		try {
			dao.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/1.css">



<title>인사관리 메인페이지</title>
<script type="text/javascript">
	function deleteEmp(empno, ename)
	{
		var res = confirm("사원번호: "+empno+", 사원명: "+ename+"\n사원을 삭제하시겠습니까?");
		if(res)
			window.location.href = "EmpDelete.jsp?empno=" + empno;
	}
</script>
</head>
<body>

	<div>
	  <div class ="status_bar" >
      <div class="js-clock">
        <h1 class="js-title">
        </h1>
      </div>
      <div class="weather" style="text-align :center;">
        <h2 class="w-title"></h2>
        <h3 class="w-img"></h3>
        <h4 class="w-city"></h4>
        <h3 class="w-temp"></h4>
      </div>
    </div>
    	<hr>
		<h1>사원 관리 프로그램</h1>
		<hr>
	</div>

	<%-- <div>
		<h2>사원 목록</h2>
		<form>
			<a href="EmployManageMain.jsp"><button type="button"
					class="btn btn-outline-secondary" id="btn">사원관리</button></a> <a
				href="EmployManageInsert.jsp"><button type="button"
					class="btn btn-outline-secondary" id="btn">사원등록</button></a> <a
				href="Admin/EmpAdmin.jsp"><button type="button"
					class="btn btn-outline-secondary" id="btn">관리자</button></a> <br> <br>
			<%=str%>
		</form>
	</div>
 --%>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">사원 목록</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor02" aria-controls="navbarColor02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="EmpMain.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="EmployManager/EmployManageMain.jsp">사원관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="EmpInsertForm.jsp">사원등록</a></li>
					<li class="nav-item"><a class="nav-link" href="Admin/AdminMainForm.jsp">관리자모드</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" name="SearchForm">
					<input class="form-control mr-sm-2" type="text" id="search"
						name="search" placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0"
						onclick="document.SearchForm.submit();">Search</button>
				</form>
			</div>
		</nav>
	</div>

	<div>

		<%=str%>
	</div>
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
	  <script type="text/javascript" src="js/clock.js" charset="utf-8"></script>
  <script type="text/javascript" src="js/weather.js" charset="utf-8"></script>

	<%
		if ((request.getParameter("search") != null)) {
	%>
	<script type="text/javascript">
	
	document.getElementById("search").value="<%=s%>";
	</script>

	<%
		}
	
	%>
</body>
</html>