<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String deptno = request.getParameter("deptno");
	String dName = request.getParameter("dName");
	String loc = request.getParameter("loc");

	DeptDAO dao = null;
	
	try
	{
		dao = new DeptDAO();
		dao.connection();
		DeptDTO dto = new DeptDTO();
		
		dto.setDeptno(deptno);
		dto.setDname(dName);
		dto.setLoc(loc);
		
		dao.modifyBuseo(dto);
		
		
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