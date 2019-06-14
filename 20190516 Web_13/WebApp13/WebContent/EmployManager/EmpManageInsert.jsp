<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpManageDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

	//EmpManageInsert.jsp

	request.setCharacterEncoding("UTF-8");

	
	String job = request.getParameter("job");
	String empno = request.getParameter("Empno");
	
	
	int sal = 0;
	int comm = 0;
	
	
	EmpManageDAO dao = new EmpManageDAO();
	
	try
	{
		sal = Integer.parseInt(request.getParameter("sal"));
		comm = Integer.parseInt(request.getParameter("comm"));
	
				
		//데이터베이스 연결
		dao.connection();
		
		
		// MemberDTO 객체 생성 및 속성 구성
		EmpDTO dto = new EmpDTO();
				
		dto.setSal(sal);
		dto.setComm(comm);
		dto.setJob(job);
		dto.setEmpno(empno);
						
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
	
	
	// 췍!
	// 클라이언트가 MemberSelect.jsp 를 다시 요청할 수 있도록 처리.
	response.sendRedirect("EmployManageMain.jsp");
	

%>


