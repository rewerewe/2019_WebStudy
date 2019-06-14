<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 빈을 생성하는것 (=jsp에 업무지시를 내리는 것이다. "클래스설계도 대로 객체를 만들어줘" 라고 주문하는 것 -->
<jsp:setProperty property="*" name="ob"/>
<!-- su1, su2, op 모두 getParameter / Integer.parseInt / setSu1 setSu2  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
</head>
<body>

<div>
	<h1>세 번째 방법 처리 결과 </h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>