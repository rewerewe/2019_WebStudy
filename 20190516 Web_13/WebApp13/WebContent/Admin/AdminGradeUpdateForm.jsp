<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String grade = request.getParameter("grade");
	String hisal = request.getParameter("hisal");
	String losal = request.getParameter("losal");
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
<title>AdminGradeUpdateForm.jsp</title>
</head>
<body>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<div>
		<h1>등급별 급여 수정</h1>
		<hr>
	</div>

	<div>
		<form action="AdminGradeUpdate.jsp">
			<table class="table table-hover">
				<tr>
					<th>등급</th>
					<td><input type="text" name="grade" id="grade" value="<%=grade %>" readonly="readonly" class="form-control">
					</td>
				</tr>
				<tr>
					<th>최저급여</th>
					<td><input type="text" name="losal" id="losal" value="<%=losal %>" class="form-control">
					</td>
				</tr>
				<tr>
					<th>최대급여</th>
					<td><input type="text" name="hisal" id="hisal" value="<%=hisal %>" class="form-control">
					</td>
				</tr>
			</table>
		
		
		<br><br>
		
		<button type="submit" class="btn btn-primary btn-lg">수정하기</button>
		<button type="reset" class="btn btn-primary btn-lg">취소하기</button>
		<a href="../EmpMain.jsp"><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
		</form>
	</div>


</body>
</html>