<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String url ="http://localhost:8090/WebApp21/Article.jsp?pageNum=1&num=814";
		
	URL obj = new URL(url); // 호출할 url
	HttpURLConnection con = (HttpURLConnection)obj.openConnection();
	
	con.setRequestMethod("GET");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>