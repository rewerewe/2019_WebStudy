<%@page import="com.test.SalgradeDAO"%>
<%@page import="com.test.SalgradeDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String grade = request.getParameter("grade");
	String losal = request.getParameter("losal");
	String hisal = request.getParameter("hisal");
	
	SalgradeDAO dao = null;
	
	try
	{
		dao = new SalgradeDAO();
		dao.connection();
		
		SalgradeDTO salgrade = new SalgradeDTO();
		
		salgrade.setGrade(grade);
		salgrade.setLosal(Integer.parseInt(losal));
		salgrade.setHisal(Integer.parseInt(hisal));
		
		dao.add(salgrade);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("AdminGradeForm.jsp");
%>