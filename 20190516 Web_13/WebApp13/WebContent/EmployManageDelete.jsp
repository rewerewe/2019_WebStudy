<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String empno = request.getParameter("empno");
	
	EmpDAO dao = new EmpDAO();
	
	try
	{
		dao.connection();
		dao.empManageDelete(empno);
	}catch(Exception e)
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
	
	response.sendRedirect("EmployManageMain.jsp");
%>
