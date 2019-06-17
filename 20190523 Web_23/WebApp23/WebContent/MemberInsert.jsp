<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.Member.MemberDTO"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<%

	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	MemberDTO ob = null;
	
	for (int i=1; i<=5; i++)
	{
		ob = new MemberDTO(
				 request.getParameter("name"+i)
			   , request.getParameter("tel"+i)
			   , request.getParameter("addr"+i));
		
		// 자료구조에 모두 적재
		lists.add(ob);
	}
	
	//-- 자료구조를 파라미터로 토스. MemberList.jsp 로 넘기기 위함인가??
	request.setAttribute("lists", lists);
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
