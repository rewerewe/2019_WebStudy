<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String check = request.getParameter("check");
	String err = "";
	if(check != null)
	{
		err = "onload='errCheck()'";
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalgradeInsertForm.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
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
	
	
		

	function errCheck()
	{
		alert("이미 존재하는 등급입니다. 다시 등록해주세요.");
	}
	
	
	
	
	

</script>

</head>
<body <%=err %>>

<!-- 메뉴 바 구성 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Home |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	  <li class="nav-item">
        <a class="nav-link" href="SALGRADESelect.jsp" style="font-size: 1.5rem;">급여 등급 관리</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" style="font-size: 1.5rem;">급여 등급 추가</a>
      </li>
    </ul>
  </div>
</nav>

<br>

<div>
	<!-- 회원 정보 입력 폼 구성 -->
	<form action="SALGRADEInsert.jsp" method="post" id="salgradeForm">
		<table class="table" style="width: 40%; margin-left:10px;">
			<tr>
				<th>등급(*)</th>
				<td>
					<input type="text" id="grade" name="grade" style="align:left;">
					<span class="errMsg" id="gradeMsg"  style="display:none; font-size:small; color:red;">등급을 입력해야 합니다</span>
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
		<div style="margin-left:25px;">
			<a href="javascript:salgradeSubmit()"><button type="button" class="btn btn-secondary" style="margin:10px;">입력하기</button></a>
			<a href="javascript:salgradeReset()"><button type="button" class="btn btn-secondary" style="margin:10px;">취소하기</button></a>
			<a href="SALGRADESelect.jsp"><button type="button" class="btn btn-secondary" style="margin:10px;">목록으로</button></a>
		</div>
	</form>
</div>



</body>
</html>