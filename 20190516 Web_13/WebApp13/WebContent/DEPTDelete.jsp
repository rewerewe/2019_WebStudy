<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 

    // DEPTDelete.jsp
	request.setCharacterEncoding("UTF-8");

    String deptno = request.getParameter("deptno");
   
    DeptDAO dao = new DeptDAO();
    
    String strAddr = ""; 
   
    try
    {   
    	dao.connection();
    	
    	
    	
    	int checkCount = dao.refCount(deptno); 
    	
    	if(checkCount==0)
    	{
    		dao.remove(deptno); 
    		strAddr = "DEPTSelect.jsp"; 
    	}
    	else
    	{
    		strAddr = "DEPTNotice.jsp";
    	}
           
    }catch (Exception e)
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

    response.sendRedirect(strAddr);
%>