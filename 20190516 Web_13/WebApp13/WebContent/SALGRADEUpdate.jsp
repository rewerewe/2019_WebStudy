<%@page import="com.test.SalgradeDTO"%>
<%@page import="com.test.SalgradeDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	
	request.setCharacterEncoding("UTF-8");

	String grade = request.getParameter("grade");
	int losal = Integer.parseInt(request.getParameter("losal")); 
	int hisal = Integer.parseInt(request.getParameter("hisal"));

	SalgradeDAO dao = new SalgradeDAO();
	
	try
	{
		dao.connection();
		
		SalgradeDTO member = new SalgradeDTO(); 
		member.setGrade(grade);		
		member.setLosal(losal);
		member.setHisal(hisal);
		
		dao.modify(member);
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
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
	}

	response.sendRedirect("SALGRADESelect.jsp");
	
%>
