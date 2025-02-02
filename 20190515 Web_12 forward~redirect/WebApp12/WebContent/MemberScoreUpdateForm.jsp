<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%
	// 데이터 수신 (MemberScoreSelect.jsp로 부터...)
	String sid = request.getParameter("sid");
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;

	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 수신한 sid 를 통해 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
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
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

	function memberScoreSubmit()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.valus="" || isNaN(kor.value) || Number(kor.value) < 0 || Number(kor.value) > 100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		if (eng.valus="" || isNaN(eng.value) || Number(eng.value) < 0 || Number(eng.value) > 100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		if (mat.valus="" || isNaN(mat.value) || Number(mat.value) < 0 || Number(mat.value) > 100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberScoreForm.submit();
	}
	
	function memberScoreReset()
	{
		var memverScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var kor = document.getElementById("eng");
		var kor = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var korMsg = document.getElementById("engMsg");
		var korMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberScoreForm.reset()
		kor.focus();
		
	}
</script>

</head>
<body>

<!-- http://localhost:8090/WebApp12/MemberScoreUpdateForm.jsp -->

<div>
	<h1>회원 성적 관리 및 수정 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>


<br>

<div>
	<!-- 회원 성적 수정 폼 구성  -->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<!-- 1 -->
					<%=sid %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<!-- 김선아 -->
					<%=name %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore"
					value="<%=kor %>">
					
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0~100 사이의 국어 점수를 입력해야 합니다. 
					</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore"
					value="<%=eng %>">
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0~100 사이의 영어 점수를 입력해야 합니다. 
					</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore"
					value="<%=mat %>">
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0~100 사이의 수학 점수를 입력해야 합니다. 
					</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberScoreSubmit()"><button type="button" class="btn">입력하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button" class="btn">취소하기</button></a>
		<a href="MemberScoreInsert.jsp"><button type="button" class="btn">목록으로</button></a>
	</form>
</div>
</body>
</html>