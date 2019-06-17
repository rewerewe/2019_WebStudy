<%@page import="com.test.mvc.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.test.mvc.MemberDTO"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<%
 
	MemberDTO dto = (MemberDTO)request.getAttribute("dto");

	MemberDAO dao = new MemberDAO();
	dao.add(dto);
	
	dao.close();	
%>
<jsp:forward page="/memberlist"></jsp:forward>
