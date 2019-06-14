<%@page import="com.test.SalgradeDTO"%>
<%@page import="com.test.SalgradeDAO"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%

   request.setCharacterEncoding("UTF-8");
   
   String grade = request.getParameter("grade");
   int losal = Integer.parseInt(request.getParameter("losal"));
   int hisal = Integer.parseInt(request.getParameter("hisal"));
   
   SalgradeDAO dao = new SalgradeDAO();
   
   String strArr = "";   
   
   try
   {
      //데이터베이스 연결
      dao.connection();      
      
      int check = dao.grSearch(grade);
      
      if(check>0)
      {
         strArr = "SALGRADEInsertForm.jsp?check=1";
      }
      else
      {
         SalgradeDTO search = new SalgradeDTO();
         search = dao.search(grade);
         
         int gethisal = search.getHisal();
         int getlosal = search.getLosal();
         
         System.out.println(gethisal);
         System.out.println(getlosal);
         
         if ((gethisal == hisal) && (getlosal == losal))
         {
            strArr = "SALGRADEInsertForm.jsp?check=1";
         }
         else
         {
            SalgradeDTO salgrade = new SalgradeDTO(); 
            salgrade.setGrade(grade);
            salgrade.setLosal(losal);
            salgrade.setHisal(hisal);
            
            dao.add(salgrade);
            
            strArr = "SALGRADESelect.jsp";
            
         }
         
               
      }
      
      
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
   
   response.sendRedirect(strArr);
   
   
%>
