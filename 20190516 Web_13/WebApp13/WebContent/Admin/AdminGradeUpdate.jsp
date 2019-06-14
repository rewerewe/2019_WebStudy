<%@page import="com.test.SalgradeDAO"%>
<%@page import="com.test.SalgradeDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

   request.setCharacterEncoding("UTF-8");

   String grade = request.getParameter("grade");
    int hisal = Integer.parseInt(request.getParameter("hisal")); 
    int losal = Integer.parseInt(request.getParameter("losal"));
   SalgradeDAO dao = new SalgradeDAO();


   try
   {
      dao.connection();
      
      SalgradeDTO dto = new SalgradeDTO();
      
      dto.setGrade(grade);
      dto.setLosal(losal);
      dto.setHisal(hisal);
      
      dao.updateSal(dto);
      
      
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
   
   response.sendRedirect("AdminGradeForm.jsp");

%>