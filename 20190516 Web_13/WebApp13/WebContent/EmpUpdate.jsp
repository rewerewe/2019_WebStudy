<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<% 
	// EMPUpdate.jsp
	request.setCharacterEncoding("UTF-8");
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	//String hiredate = request.getParameter("hiredate");
	String deptno = request.getParameter("dname");
	String mgrno = request.getParameter("mname");
	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = Integer.parseInt(request.getParameter("comm"));
		
	// EMPInsertform.jsp 의 option select로 부터 넘겨받은 값을 변수에 담음 
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day   = request.getParameter("day");
	String hiredate = year + "/" + month + "/" + day; 
	
	EmpDAO dao = new EmpDAO();
	
	try
	{
		dao.connection();
		
		EmpDTO dto = new EmpDTO();
		dto.setEmpno(empno);
		dto.setEname(ename);
		dto.setJob(job);
		dto.setMgr(mgrno);
		dto.setHiredate(hiredate);
		dto.setSal(sal);
		dto.setComm(comm);
		dto.setDeptno(deptno);
		
		dao.modify(dto);
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
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	response.sendRedirect("EMPSelect.jsp");
	
%>

