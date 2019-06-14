<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String deptno = request.getParameter("deptno");
	
	DeptDAO dao = null;

	
	try
	{
		dao = new DeptDAO();
		dao.connection();
		dao.removeBuseo(deptno);
		dao.buseoRemoveKid(deptno);
		
		
			
		
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
	
	response.sendRedirect("AdminBuseoSelect.jsp");
%>
