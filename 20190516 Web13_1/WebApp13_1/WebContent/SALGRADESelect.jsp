<%@page import="com.test.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.EmpDAO"%>
<%@page import="com.test.SalgradeDTO"%>
<%@page import="com.test.SalgradeDAO"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   StringBuffer str = new StringBuffer();
   StringBuffer sal = new StringBuffer();
   SalgradeDAO dao= new SalgradeDAO();
   
   String grade =  request.getParameter("grade");   
  
   
   if(grade!=null)
   {
	   	dao.connection();
	  	EmpDAO edao = new EmpDAO();
	  	edao.connection();	   
	   	
	   
		sal.append("<table class='table'>");
		sal.append("<tr>");
		sal.append("<th> 직원번호 </th>");
		sal.append("<th> 직원명 </th>");
		sal.append("<th> 직무 </th>");		
		sal.append("<th> 급여 </th>");
		sal.append("<th> 수당 </th>");
		sal.append("<th> 부서명 </th>");		
		sal.append("</tr>");
		
		for(EmpDTO emp : edao.salgradeList(grade))
		{
			sal.append("<tr>");
			sal.append("<td>");			
			sal.append(emp.getEmpno());
			sal.append("</td>");
			sal.append("<td>");
			sal.append(emp.getEname());
			sal.append("</td>");
			sal.append("<td>");
			sal.append(emp.getJob());
			sal.append("</td>");
			sal.append("<td>");
			sal.append(emp.getSal());
			sal.append("</td>");
			sal.append("<td>");
			sal.append(emp.getComm());
			sal.append("</td>");
			sal.append("<td>");
			sal.append(emp.getDname());
			sal.append("</td>");
			
			sal.append("</tr>");
		}
		
		
		sal.append("</table>");
	  
   }
   
   
   //등급 최저급여 최고급여  등급관리
   try
   {
      dao.connection();
      
      str.append("<table class='table' border='1'>");
      str.append("<tr>");
      str.append("<th style='width:50px'>등급</th>");
      str.append("<th style='width:100px'>최저급여</th>");
      str.append("<th style='width:150px'>최고급여</th>");
      str.append("<th style='width:150px'>등급별직원조회</th>");      
      str.append("<th style='width:200px'>등급관리</th>");
      str.append("</tr>");
      
      
      for(SalgradeDTO salgrade:dao.lists())
      {
         str.append("<tr>");
         str.append("<td>"+salgrade.getGrade()+"</td>");
         str.append("<td>"+salgrade.getLosal()+"</td>");
         str.append("<td>"+salgrade.getHisal()+"</td>");
         str.append("<td>");
         str.append("<a href='SALGRADESelect.jsp?grade=" + salgrade.getGrade() + "'>");
         str.append("<button type='button'>조회</button>");
         str.append("</a>");
         str.append("</td>");
         str.append("<td>");
         
         str.append("<a href='SALGRADEUpdateForm.jsp?grade=" + salgrade.getGrade() + "'>");
         str.append("<button type='button', class='btn01' style='width:50%'>수정</button>");
         str.append("</a>");
         
         //memberDelete(1,'김선아');
         
         //※ 따옴표의 종류 : ①"" ②'' ③\"\"
         //  일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
         //  ①과 ②를 사용하면 된다. 
         //  하지만, 따옴표가 세 번 중첩되어 사용될 경우
         //   ③ Escape 를 사용해야 한다. 
         str.append("<a href='javascript:salgradeDelete(" + salgrade.getGrade() + ",\""+ salgrade.getLosal() + "\",\""+salgrade.getHisal()+"\")'>");
         str.append("<button type='button', class='btn01' style='width:50%'>삭제</button>");
         str.append("</a>");
         
         str.append("</td>");
         
         
         str.append("</tr>");
      }
      
      str.append("</table>");
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

   function salgradeDelete(grade, losal, hisal)
   {
      var res = confirm("급여 등급 : "+ grade +", 최저 : " + losal + ", 최고 :  " + hisal  +  "\n이 급여 등급을 삭제하시겠습니까?"); 
      
      //alert(res);
      //-- confirm 창은 true(확인)또는 false(취소)를 반환
      
      if(res)
         window.location.href="SALGRADEDelete.jsp?grade=" + grade;
   
   }

</script>
</head>
<body>

<!-- http://localhost:8090  -->
<div>
   <h1> 급여 등급 관리 및 출력 페이지 </h1>
   <hr>
</div>

<div>
   <a href="EMPSelect.jsp"><button type="button">직원 명단 관리</button></a>
   <a href="SALGRADEInsertForm.jsp"><button type="button">급여 등급 추가</button></a>
   <br><br>
</div>

<div>
   <!-- 리스트 출력  -->
   <%=str %>
</div>

<br><br>
<div>
	<!-- 직원 출력 -->
	<%=sal %>
</div>
</body>
</html>