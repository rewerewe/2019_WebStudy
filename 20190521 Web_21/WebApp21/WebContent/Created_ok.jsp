<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Created_ok.jsp
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 작게 쪼갠 뒤 장착, 결합하는 방법으로 어플리케이션을 만들어야 한다.
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set 하는 과정
	dto.setNum(maxNum+1);
	dto.setIpaddr(request.getRemoteAddr());
	//--?? getRemoteAddr() 
			
	// 직접 만든 객체가 아닌 JSP 객체를 가져다 쓰는 것.
	dao.insertData(dto);
	//--?? 
			
	DBConn.close();
	
	response.sendRedirect("List.jsp");
	
%>
