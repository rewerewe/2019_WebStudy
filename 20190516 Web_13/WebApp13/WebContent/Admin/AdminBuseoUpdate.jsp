<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("uName");
	String empno = request.getParameter("empNo");
	String buseo = request.getParameter("buseoName");
	
	DeptDAO dao = new DeptDAO();
	
	try
	{
		dao.connection();
		
		DeptDTO dept = new DeptDTO();
		
		dept.setEname(name);
		dept.setEmpno(empno);
		dept.setDname(buseo);
		
		dao.buseoModify(dept);
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
	response.sendRedirect("EmpMain.jsp");
%>
