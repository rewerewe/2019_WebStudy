<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#result
	{
		display : inline-block;
		width: 250px;
		color: #F33;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// 데이터 수집 
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" + id;
		
		// Ajax객체 = XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정 (『open("메소드방식", "URL", 동기/비동기)』)
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function name()
		{
			if (ajax.readyState==4)
			{
				if (ajax.status==200)
				{
					// 업무처리
					callBack();
					
				}
			}
		}
		
		ajax.send("");
	}
	
	// 아이디 중복검사의 결과를 통보받아 사용자에 메시지 출력
	// → span → result	
	function callBack()
	{
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if (data==0)
			document.getElementById("result").innerText = "사용가능한 아이디입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
	}
	
</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>
	<p>- Test03OK.jsp</p>
	<p>- web.xml</p>
	<p>URL : test03.do</p>
	<p>자료구조 활용 → superman, batman, admin</p>
	<hr>
</div>


<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" >
			<input type="button" value="중복검사" class="control" onclick="check()">
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control" />
		</td>
	</tr>
</table>

</body>
</html>