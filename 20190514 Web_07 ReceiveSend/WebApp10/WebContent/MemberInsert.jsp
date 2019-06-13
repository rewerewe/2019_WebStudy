<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 처리 페이지 
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try {
	
		dao = new MemberDAO();
		
		MemberDTO dto = new MemberDTO();
		
		dto.setName(userName);
		dto.setTel(userTel);
		
		
		int result = dao.add(dto);
		
	}
	
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		response.sendRedirect("MemberList.jsp");
	}
%>
