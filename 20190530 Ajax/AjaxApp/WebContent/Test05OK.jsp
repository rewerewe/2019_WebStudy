<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8" ?>
<list>
	<c:forEach var="item" items="${lists }">
	<item>
		<search>${item.word }</search>
	</item>
	</c:forEach>
</list>