<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPTInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">
 
	function deptSubmit()
	{
		// 테스트
		//alert("정상 호출~!!!");
		
		var deptForm = document.getElementById("deptForm");
		
		var dName = document.getElementById("dName"); 
		var dnameMsg = document.getElementById("dnameMsg"); 
		
		dnameMsg.style.display = "none";
		
		if(dName.value == "") 
		{
			dnameMsg.style.display ="inline";
			dName.focus(); 
			return; 						//-- '종료' 의미
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		deptForm.submit(); 		
	}
	
	function deptReset()
	{
		var deptForm = document.getElementById("deptForm"); 
		var dName = document.getElementById("dName"); 
		var dnameMsg = document.getElementById("dnameMsg"); 
		
		dnameMsg.style.display = "none"; 
		
		// form 을 직접 지정하여 reset 액션 수행 
		deptForm.reset();
		dName.focus(); 
	}


</script>
</head>
<body>

<!-- http://localhost:8090/WebApp12/DeptInsertForm.jsp -->
<div>
	<h1>신규 부서 등록 페이지</h1>
	<hr>
</div>


<div>
	<a href="EMPSelect.jsp"><button type="button">직원 명단 관리</button></a>
</div>

<br>

<div>
	<!-- 부서 정보 입력 폼 구성 -->
	<form action="DEPTInsert.jsp" method="post" id="deptForm" >
		<table class="table">
			<tr>
				<th>부서명</th>
				<td>
					<input type="text" id="dName" name="dName" >
				</td>
				<td>	
					<span class="errMsg" id="dnameMsg">부서명을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>위치</th>
				<td>
					<input type="text" id="dLoc" name="dLoc">
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:deptSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:deptReset()"><button type="button">취소하기</button></a>
		<a href="DEPTSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>