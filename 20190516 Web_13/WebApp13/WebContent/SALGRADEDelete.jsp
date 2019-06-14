<%@page import="com.test.SalgradeDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
   request.setCharacterEncoding("UTF-8");
   
   // SalgradeDelete.jsp
   
   String grade = request.getParameter("grade");
   
   SalgradeDAO dao = new SalgradeDAO();
   
   try
   {
      dao.connection();
      
      dao.remove(grade);
   
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
      catch (Exception e)
      {
         System.out.println(e.toString());
      }
   }
   
   response.sendRedirect("SALGRADESelect.jsp");

%>