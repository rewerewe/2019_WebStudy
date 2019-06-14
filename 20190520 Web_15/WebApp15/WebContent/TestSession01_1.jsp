<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

	function sendIt()
	{
		var f = document.myForm;
		// alert(f);
		
		if (!f.userName.value)
		{
			alert("이름 입력");
			f.userName.focus();
			return;
		}
		
		if (!f.userBirth.value)
		{
			alert("생일 입력");
			f.userBirth.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
</head>
<body>

<!-- 
	○ TestSession01 에서 TestSession02 로
	   이름과 생일을 입력받아 전송
	   TestSession02 에서 TestSession03 으로 
	   아이디와 패스워드를 입력받고 
	   앞에서 전달받은 이름과 생일을 함께 전송
	   TestSession03 에서 전달받은 이름, 생일, 아이디, 패스워드 출력
	   
	   01-----------------------→ 02 -----------------------→ 03
	   이름, 생일				  아이디, 패스워드             이름, 생일, 아이디, 패스워드
	   입력                       입력 →                      출력
	   
	                   - getParameter				- getAttribute
	                  
	   ※ 즉, 01 에서 02 로 넘겨줄 땐 getParameter
	      02 에서 03 으로 넘겨줄 땐 getParameter와 getAttribute 로 세션 활용
	      01 에서 03 으로 넘겨줄 수 없디 대문에 세션에 저장
	      
	   ※ session 외에 hidden 태그를 이용한 정보 전달 가능 
 -->

<div>
	<h1>이름과 생일(TestSession01.jsp)</h1>
	<hr>
</div>

<div>
	<form action="TestSession02.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" size="10">
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="text" name="userBirth" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="width: 400px; height: 40px; font: 17pt;">다음페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>