<%@page import="com.test.SalgradeDTO"%>
<%@page import="com.test.SalgradeDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>AdminGradeAddForm.jsp</title>
<style type="text/css">
	.errMsg{display:none; color:red; font-weight: bold;}
</style>
<script type="text/javascript">

	function gradeSubmit()
	{
		var gradeForm = document.getElementById("gradeForm");
		
		var grade = document.getElementById("grade");
		var gradeMsg = document.getElementById("gradeMsg");
		
		gradeMsg.style.display = "none";
		
		if (grade.value=="")
		{
			gradeMsg.style.display = "inline";
			grade.focus();
			return;
		}
		
		gradeForm.submit();
	}
	
	function gradeReset()
	{
		var gradeForm = document.getElementById("gradeForm");
		
		var grade = document.getElementById("grade");
		var gradeMsg = document.getElementById("gradeMsg");
		
		gradeMsg.style.display = "none";
		
		gradeForm.reset();
		grade.focus();
	}
	
	
</script>
</head>
<body>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<div>
	<h1>등급 추가</h1>
	<hr>
</div>

<div>
	<form action="AdminGradeAddUpdate.jsp" method="post" id="gradeForm">
		<table class="table">
			<tr>
				<th>등급 번호(*)</th>
				<td>
					<input type="text" class="form-control"  id="grade" name="grade">
				</td>
				<td>
					<span class="errMsg" id="gradeMsg">번호를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>최소값</th>
				<td>
					<input type="text" class="form-control" id="losal" name="losal">
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>최대값</th>
				<td>
					<input type="text" class="form-control" id="hisal" name="hisal">
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:gradeSubmit()"><button type="button"  class="btn btn-primary btn-lg">추가하기</button></a>
		<a href="javascript:gradeReset()"><button type="button"  class="btn btn-primary btn-lg">취소하기</button></a>
		<a href="../EmpMain.jsp" ><button type="button" class="btn btn-secondary btn-lg">목록으로</button></a>
	</form>
</div>



</body>
</html>