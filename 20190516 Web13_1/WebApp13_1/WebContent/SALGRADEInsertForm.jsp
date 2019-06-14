<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalgradeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	
	function salgradeSubmit()
	{

		
		var salgradeForm=document.getElementById("salgradeForm");
		
		var grade = document.getElementById("grade");
		var gradeMsg = document.getElementById("gradeMsg");
		
		gradeMsg.style.display="none";
		
		if(grade.value=="")
		{
			gradeMsg.style.display="inline";
			grade.focus();
			return;
		}
		
		//form 을 직접 지정하여 submit 액션 수행 
		salgradeForm.submit();
	}
	
	function salgradeReset()
	{
		var salgradeForm = document.getElementById("salgradeForm");
		var grade = document.getElementById("grade");
		
		gradeMsg.style.display="none";
		//form 을 직접 지정하여 reset 액션 수행
		salgradeForm.reset();
		
		grade.focus();
	}

</script>

</head>
<body>



<div>
	<h1>사원 등급 관리 입력 페이지</h1>
	<hr>
</div>
<!-- <div>
	<a href="SALGRADESelect.jsp"><button type="button">사원 등급 관리</button></a>
</div> -->
<br>
<div>
	<!-- 회원 정보 입력 폼 구성 -->
	<form action="SALGRADEInsert.jsp" method="post" id="salgradeForm">
		<table class="table">
			<tr>
				<th>등급(*)</th>
				<td>
					<input type="text" id="grade" name="grade">
					<span class="errMsg" id="gradeMsg">등급을 입력하야 합니다</span>
				</td>
			</tr>
			<tr>
				<th>최저급여</th>
				<td>
					<input type="text" id="losal" name="losal">
				</td>
			</tr>
			<tr>
				<th>최고급여</th>
				<td>
					<input type="text" id="hisal" name="hisal">
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:salgradeSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:salgradeReset()"><button type="button">취소하기</button></a>
		<a href="SALGRADESelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>



</body>
</html>