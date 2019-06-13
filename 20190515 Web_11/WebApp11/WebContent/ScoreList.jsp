<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 담은 String 변수
	String str = "";

	// ScoreDAO 인스턴스 생성
	ScoreDAO dao = null;	// exception 잡아주려고 try~catch
	
	try
	{
		dao = new ScoreDAO();
		
		str += "<table>";
		str += "<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>"
		    +  "<th>총점</th><th>평균</th>";
				
		for (ScoreDTO dto : dao.lists())
		{
			str += "<tr>";
			str += "<td>"+ dto.getSid() + "</td>"; 
			str += "<td>"+ dto.getName() + "</td>"; 
			str += "<td>"+ dto.getKor() + "</td>"; 
			str += "<td>"+ dto.getEng() + "</td>"; 
			str += "<td>"+ dto.getMat() + "</td>"; 
			str += "</tr>";
		}
		
		str += "</table>";
	} 
	catch(Exception e)
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
<title>ScoreList.jsp</title>
<script type="text/javascript">
	
	function formCheck()
	{
		var uName = document.getElementById("userName");	
		var uKor = document.getElementById("userKor");	
		var uEng = document.getElementById("userEng");	
		var uMat = document.getElementById("userMat");	
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		} 
		else if (uKor.value = "" || isNan(uKor.value) || Number(uKor.value) < 0 || Number(uKor.value) > 100)
		{
			korMsg.stylt.display = "inline";
			return false;
		}
		else if (uEng.value = "" || isNan(uEng.value) || Number(uEng.value) < 0 || Number(uEng.value) > 100)
		{
			engMsg.stylt.display = "inline";
			return false;
		}
		else if (uMat.value = "" || isNan(uMat.value) || Number(uMat.value) < 0 || Number(uMat.value) > 100)
		{
			matMsg.stylt.display = "inline";
			return false;
		}
		
		return true;
	}
	
</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터베이스 회원 성적관리 연동 실습</h1>
	<hr>
</div>

<div>
	<p>DTO, DAO 적용 실습</p>
	<form>
	</form>
</div>

<div>
<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span class="errMsg" id="korMsg">국어 점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span class="errMsg" id="engMsg">영어 점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span class="errMsg" id="matMsg">수학 점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn">성적추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>