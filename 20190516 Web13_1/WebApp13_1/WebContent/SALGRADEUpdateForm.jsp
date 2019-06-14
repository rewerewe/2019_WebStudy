<%@page import="com.test.SalgradeDAO"%>
<%@page import="com.test.SalgradeDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//MemberUpdateForm.jsp	

	request.setCharacterEncoding("UTF-8");
	
	String grade = request.getParameter("grade");
	
	int losal = 0;
	int hisal = 0;
	
	
	SalgradeDAO dao = new SalgradeDAO();
	
	try
	{
		dao.connection();
		
		SalgradeDTO member = dao.search(grade);
		losal = member.getLosal();
		hisal = member.getHisal();
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function memberSubmit()
	{
		// 텍스트
		// alert("호출");
		
		var memberForm = document.getElementById("memberForm");
		
		var grade = document.getElementById("grade");
		var gradeMsg = document.getElementById("gradeMsg");
		
		gradeMsg.style.display="none";
		
		if(grade.value == "")
		{
			gradeMsg.style.display ="inline";
			return;	
		}
		
		memberForm.submit();
		
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		var grade = document.getElementById("grade");
		var gradeMsg = document.getElementById("gradeMsg");
		
		gradeMsg.style.display="none";
		
		memberForm.reset();
		grade.focus(); 

		
	}


</script>

</head>
<body>
<!--  http://localhost:8090/WebApp12/MemberSelect.jsp -->


<div>
   <h1>회원 명단 관리 및 수정 페이지</h1>
   <hr>
</div>

<div>
<a href="SALGRADESelect.jsp"><button type="button">급여 등급 관리</button></a>
</div>
<br>
<div>
	<form action="SALGRADEUpdate.jsp?grade=<%=grade%>" Method="post" id="memberForm">
		<table class="table">
			<tr>
				<th>등급</th>
				<td>
				<input type="text" id="grade" name="grade" value="<%=grade %>">
				</td>
				<td>
				<span class="errMsg" id="gradeMsg">등급을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>최저급여</th>
				<td>
				<input type="text" id="losal" name="losal" value="<%=losal%>">
				</td>			
			</tr>
			<tr>
				<th>최고급여</th>
				<td>
				<input type="text" id="hisal" name="hisal" value="<%=hisal %>">
				</td>			
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="SALGRADESelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
