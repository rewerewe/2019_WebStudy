<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이 page 는 사용자와 만날 일이 없다. 스트립트 릿만 있으면 된다. 
	// MemberInsert.jsp
	
	// 데이터 수신
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결 → insert 구문 받기 위한
	Connection conn = DBConn.getConnection();
	
	
	// 쿼리문 준비 (insert)
	String sql = String.format 
		("INSERT INTO TBL_MEMBER(SID, NAME, TEL)" 
				+ "VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// DB 액션 처리 → 작업 객체 필요
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql); 
	
	if (result < 1)
	{
		// 에러 페이지를 다시 요청해라.....
		response.sendRedirect("Err02.jsp");
		
	}
	else
	{
		// Test002.jsp 페이지를 다시 요청해라.....
		response.sendRedirect("Test002.jsp");
	}
	
// 아래 html 태그는 깨끗하게 지워주자. 이 페이지는 사용자와 만나지 않기 때문에 불필요하다.

%>

