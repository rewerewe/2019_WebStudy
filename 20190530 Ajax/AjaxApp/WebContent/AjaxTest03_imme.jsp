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
		String id = document.getElementById("id").value
		
		// URL 구성 
		url = "test03.do?id" + id;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// url 넘겨주기
		ajax.open("GET", url, true)
		
		// onreadystatechange 
		ajax.onreadystatechange = function()
		{
			// readyState
			if (ajax.readystate==4)
			{
				// status
				if (ajax.status==200)
				{
					callBack();
				
				}
			}
		} 
			
		// ajax 보내기 
		ajax.send("");
		
	} // end check
	
	
	function callBack()
	{
		var data = ajax.responseText;
		
		document.getElementById("result") = data; 
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