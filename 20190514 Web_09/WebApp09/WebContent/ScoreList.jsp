<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	// DB 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT"
			+ ", (KOR+ENG+MAT) AS TOT"
			+ ", ((KOR+ENG+MAT)/3) AS AVG" 
			+ "FROM TBL_SCORE ORDER BY SID ASC"; 
	
	// 쿼리문 실행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr><th>번호</th><th>이름</th>";
	str += "<th>국어점수</th><th>영어점수</th><th>수학점수</th>";
	str += "<th>총점</th><th>평균</th></tr>";
	
	while (rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("KOR") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("ENG") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("MAT") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("TOT") + "</td>";
		str += "<td class='txtNum'>" + String.format("%.1f", rs.getString("AVG") ) + "</td>";
		str += "</tr>";
	}
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css"> 
<style type="text/css">
	input { width: 200px; }
	button { width: 200px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color: red; display: none; } 
	th { background-color: gray; color: white; }
	#numTitle { width: 50px; }
	#nameTitle { width: 150px; }
	#telTitle { width: 160px; }
</style>
<script type="text/javascript">

	function formCheck()
	{
		var uName = document.ElementById("userName");
		var uKor = document.ElementById("userKor");
		var uEng = document.ElementById("userEng");
		var uMat = document.ElementById("userMat");

		var nameMsg = document.ElementById("nameMsg");
		var korMsg = document.ElementById("korMsg");
		var engMsg = document.ElementById("engMsg");
		var matMsg = document.ElementById("matMsg");
		
		nameMsg.style.display="none";
		
		if (uName.value == "")
		{
			nameMsg.style.display="inline";
			uName.focus();
			return false;
		}
		
		if (uKor.value == "" || isNan(uKor.value) || Number(uKor.value) < 0 || Number(uKor.value) > 100 )
		{
			kor
		}
			
		return true;
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리 - Score Select for DB</h1>
	<hr>
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
					<button type="button" id="btnAdd" class="btn">성적추가</button>
				</td>
			</tr>
		</table>
	</form>
	
	<div class='div01'>
		<%=str %>
	</div>
</div>
</body>
</html>