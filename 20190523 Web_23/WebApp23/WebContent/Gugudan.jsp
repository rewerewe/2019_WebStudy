<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	
<div>
   <h1>JSTL 코어(Core) 를 이용한 구구단 실습 예제</h1>
   <hr>
</div>

<div>
   <form action="" method="post">
      원하는 단 입력 : <input type="text" name="dan" style="width:100px;"><br><br>
      <button type="submit" class="btn" name="bt"
      style="width: 120px; font-size: 13pt;">결과 확인</button> 
   </form>
</div>
<br>
<div>
   <c:if test="${!empty param.dan }">
   <ul>
      <c:forEach var="a" begin="1" end="9" step="1">
      <li>${param.dan } * ${a } = ${param.dan * a }</li>   
      </c:forEach>
   </ul>
   </c:if>
</div>

</body>
</html>