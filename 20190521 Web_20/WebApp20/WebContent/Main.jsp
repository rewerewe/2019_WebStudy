<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="font-size: 9pt;">
<!-- 과거에는 많이 활용되었던 태그. 레이아웃을 테이블 쪼개던 HTML4에서는 많이 쓰였으나, 현재는 안쓰며 HTML5은 div를 더 선호한다.  -->
<div>
	<table style="width: 400px;" border="1">
		<tr>
			<td colspan="2">
				<jsp:include page="Top.jsp" flush="false"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width: 100px;">
				<jsp:include page="Left.jsp" flush="false"></jsp:include>
			</td>
			<td>
				메인화면
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="Bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</div>


</body>
</html>