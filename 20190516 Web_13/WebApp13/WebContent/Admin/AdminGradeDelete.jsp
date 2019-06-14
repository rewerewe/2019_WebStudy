<%@page import="com.test.SalgradeDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String grade = request.getParameter("grade");

	SalgradeDAO dao = null;
	
	try
	{
		dao = new SalgradeDAO();
		dao.connection();
		
		dao.removeSal(grade);
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("AdminGradeForm.jsp");

%>