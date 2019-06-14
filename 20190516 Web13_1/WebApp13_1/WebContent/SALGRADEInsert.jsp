<%@page import="com.test.SalgradeDTO"%>
<%@page import="com.test.SalgradeDAO"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String grade = request.getParameter("grade");
	int losal = Integer.parseInt(request.getParameter("losal"));
	int hisal = Integer.parseInt(request.getParameter("hisal"));
	
	SalgradeDAO dao = new SalgradeDAO();
	
	
	try
	{
		//데이터베이스 연결
		dao.connection();

		
		SalgradeDTO salgrade = new SalgradeDTO(); 
		
		
		salgrade.setGrade(grade);
		salgrade.setLosal(losal);
		salgrade.setHisal(hisal);
		
		//insert 쿼리문을 수행하는 dao 의 메소드 add() 메소드 호출 
		dao.add(salgrade);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close(); // 데이터베이스 연결 종료 
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("SALGRADESelect.jsp");
	
	
%>

