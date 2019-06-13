<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uKor = request.getParameter("userKor");
	String uEng = request.getParameter("userEng");
	String uMat = request.getParameter("userMat");
	
	try 
	{
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비 (insert)
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ "VALUES (SCORESEQ.NEXTVAL, '%s' '%s' '%s' '%s')", uName, uKor, uEng, uMat);
		
		Statement stmt = conn.createStatement();
		int result =0;
		result = stmt.executeUpdate(sql);
		
		if (result < 1)
		{
			response.sendRedirect("Err02.jsp");
		} else
		{
			response.sendRedirect("ScoreList.jsp");
		}
	} catch (Exception e)
	{
		// 서버측 콘솔에서 확인
		System.out.println(e.toString());
	}
	finally
	{
		DBConn.close();
	}
%>
