<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpManageDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
		

	// MemberScoreUpdate.jsp

	// 데이터 수신

	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empno");
	String name = request.getParameter("ename");
	String job = request.getParameter("job");
	int sal = Integer.parseInt(request.getParameter("sal"));;
	int comm = Integer.parseInt(request.getParameter("comm"));;
	
	
	EmpManageDAO dao = new EmpManageDAO();
	
	try
	{			
		dao.connection();	
		EmpDTO dto = new EmpDTO();
		
		dto.setEmpno(empno);
		dto.setEname(name);
		dto.setJob(job);
		dto.setSal(sal);
		dto.setComm(comm);
		dao.modify(dto);
		
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
	
	
	response.sendRedirect("EmployManageMain.jsp");
	

%>


