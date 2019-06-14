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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
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

<!-- 
<div>
   <h1>회원 명단 관리 및 수정 페이지</h1>
   <hr>
</div>
 -->
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
        <a class="nav-link" href="SALGRADEInsertForm.jsp" style="font-size: 1.5rem;">급여 등급 추가</a>
      </li>
    </ul>
  </div>
</nav>

<br> 
 	
<div>
	<!-- 급여 등급 정보 입력 폼 구성 -->
	<form action="SALGRADEUpdate.jsp?grade=<%=grade%>" Method="post" id="memberForm">
		<table class="table" style="width: 25%; margin-left:10px;">
			<tr>
				<th>등급(*)</th>
				<td>
				<input type="text" id="grade" name="grade" value="<%=grade %>">
				</td>
				<td>
				<span class="errMsg" id="gradeMsg" style="display:none; font-size: small; color:red;">등급을 입력하세요.</span>
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
		
		<div style="margin-left:25px;">
			<a href="javascript:memberSubmit()"><button type="button" class="btn btn-secondary" style="margin:10px;">수정하기</button></a>
			<a href="javascript:memberReset()"><button type="button" class="btn btn-secondary" style="margin:10px;">취소하기</button></a>
			<a href="SALGRADESelect.jsp"><button type="button" class="btn btn-secondary" style="margin:10px;">목록으로</button></a>
		</div>
	</form>
</div>

</body>
