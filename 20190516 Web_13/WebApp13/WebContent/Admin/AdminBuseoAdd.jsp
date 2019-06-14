
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	
	DeptDAO dao = null;
	String dName = request.getParameter("dName");
	String loc = request.getParameter("loc");
	try
	{
		
		dao = new DeptDAO();
		
		dao.connection();
		
		DeptDTO dto = new DeptDTO();
		
		dto.setDname(dName);
		dto.setLoc(loc);
		
		dao.buseoAdd(dto);
		
		
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
