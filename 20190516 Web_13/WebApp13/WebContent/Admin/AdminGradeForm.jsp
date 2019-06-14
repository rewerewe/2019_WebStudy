<%@page import="com.test.SalgradeDAO"%>
<%@page import="com.test.SalgradeDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	SalgradeDAO dao = null;
	StringBuffer str = new StringBuffer();
	
	
	try
	{	//데이터베이스 연결
		dao = new SalgradeDAO();
		dao.connection();
		
		str.append("<table class='table table-hover'>");
	
		str.append("<tr scope='col'><th>등급번호</th><th scope='col'>최소값</th><th scope='col'>최대값</th><th colspan='2' scope='col'>등급처리</th></tr>");
		
		for(SalgradeDTO grade : dao.lists())
		{
			str.append("<tr>");
			str.append("<th>"+grade.getGrade()+"</th>");
			str.append("<td>"+grade.getLosal()+"</td>");
			str.append("<td>"+grade.getHisal()+"</td>");
			str.append("<td>");
			str.append("<a href='AdminGradeUpdateForm.jsp?grade="+grade.getGrade()+"&hisal="+grade.getHisal()+"&losal="+grade.getLosal()+ "'>");
			str.append("<button type='button' class='btn btn-outline-primary'>수정</button>");
			str.append("</a>");
			str.append("</td>");
			str.append("<td>");
			str.append("<a href='AdminGradeDelete.jsp?grade="+grade.getGrade()+"&hisal="+grade.getHisal()+"&losal="+grade.getLosal()+ "'>");
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
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<meta charset="UTF-8">
<title>AdminBuseoAddForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<div>
	<h1>등급 전체 조회</h1>
	<hr>
</div>

<div>
	<form id="form">
	<%=str %>
	</form>
</div>
<br><br>
	<div>
		<a href="AdminGradeAddForm.jsp"><button type="button" class="btn btn-primary btn-lg">등급 추가</button></a>
		<a href="../EmpMain.jsp"><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
	</div>
</body>
</html>