<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// DEPTInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	// 데이터 불러오기 
	String deptno = request.getParameter("deptno"); 
	String dname = request.getParameter("dName");
	String loc = request.getParameter("dLoc"); 

	DeptDAO dao = new DeptDAO(); 
	
	try
	{
		dao.connection(); 
		DeptDTO dto = new DeptDTO(); 
		dto.setDeptno(deptno); 
		dto.setDname(dname); 
		dto.setLoc(loc); 
		
		dao.add(dto); 
	
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
	
	response.sendRedirect("DEPTSelect.jsp"); 
%>