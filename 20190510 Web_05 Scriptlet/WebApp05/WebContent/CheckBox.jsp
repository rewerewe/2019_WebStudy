<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>CheckBox.jsp ● → CheckBox_ok.jsp</p>	
</div>

<!-- 내가 풀이한 내용
 <div>
	<form action="CheckBox_ok.jsp" method="post">
		이름 <input type="text" name="name"><br>
		
		메모 <br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형 <br>
		<label><input type="checkbox" value="아이유" name="wanna">아이유</label>
		<label><input type="checkbox" value="에일리" name="wanna">에일리</label>
		<label><input type="checkbox" value="수지" name="wanna">수지</label>
		<br>
		<label><input type="checkbox" value="강동원" name="wanna">강동원</label>
		<label><input type="checkbox" value="차은우" name="wanna">차은우</label>
		<label><input type="checkbox" value="공유" name="wanna">공유</label>
		<br>
		<input type="submit" value="전송" class="btn"
		style="width: 200px">
				
	</form>
</div>
 -->
 
<div>
 		<form action="CheckBox_ok.jsp" method="post">
		이름 <input type="text" name="name"><br>
		
		메모 <br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형 <br>
		<label><input type="checkbox" value="아이유" name="checkGroup">아이유</label>
		<label><input type="checkbox" value="에일리" name="checkGroup">에일리</label>
		<label><input type="checkbox" value="수지" name="checkGroup">수지</label>
		<br>
		<label><input type="checkbox" value="강동원" name="checkGroup">강동원</label>
		<label><input type="checkbox" value="차은우" name="checkGroup">차은우</label>
		<label><input type="checkbox" value="공유" name="checkGroup">공유</label>
		<br><br>
		<input type="submit" value="전송" class="btn"
		style="width: 200px">
				
	</form>
</div>
 
</body>
</html>