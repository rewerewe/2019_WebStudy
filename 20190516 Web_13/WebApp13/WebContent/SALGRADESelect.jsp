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
	   	
	  	sal.append("<div class='container'>");
		sal.append("<table class='table table-hover'>");
		sal.append("<thead class='thead-dark'>");
		sal.append("<tr>");
		sal.append("<th>직원번호</th>");
		sal.append("<th>직원명</th>");
		sal.append("<th>직무</th>");		
		sal.append("<th>급여</th>");
		sal.append("<th>수당</th>");
		sal.append("<th>부서명</th>");		
		sal.append("</tr>");
		sal.append("</thead>");
		
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
		str.append("</div>"); 
   }
   
   
   //등급 최저급여 최고급여  등급관리
   try
   {
      dao.connection();
      
      str.append("<br>");
      str.append("<div class='container'>");
      str.append("<table class='table table-hover'>");
      str.append("<thead class='thead-dark'>");
      str.append("<tr>");
      str.append("<th style='width:50px'>등급</th>");
      str.append("<th style='width:100px'>최저급여</th>");
      str.append("<th style='width:150px'>최고급여</th>");
      str.append("<th style='width:150px'>등급별직원조회</th>");      
      str.append("<th style='width:200px'>등급관리</th>");
      str.append("</tr>");
      str.append("</thead>");
      
      for(SalgradeDTO salgrade:dao.lists())
      {
         str.append("<tr>");
         str.append("<td>"+salgrade.getGrade()+"</td>");
         str.append("<td>"+salgrade.getLosal()+"</td>");
         str.append("<td>"+salgrade.getHisal()+"</td>");
         str.append("<td>");
         str.append("<a href='SALGRADESelect.jsp?grade=" + salgrade.getGrade() + "'>");
         str.append("<button type='button'class='btn btn-outline-success'>조회</button>");
         str.append("</a>");
         str.append("</td>");
         str.append("<td>");
         
         str.append("<a href='SALGRADEUpdateForm.jsp?grade=" + salgrade.getGrade() + "'>");
         str.append("<button type='button' class='btn btn-outline-primary' id='btnUpdate'>수정</button>");
         str.append("</a>");
         
         //memberDelete(1,'김선아');
         
         //※ 따옴표의 종류 : ①"" ②'' ③\"\"
         //  일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
         //  ①과 ②를 사용하면 된다. 
         //  하지만, 따옴표가 세 번 중첩되어 사용될 경우
         //   ③ Escape 를 사용해야 한다. 
         str.append("<a href='javascript:salgradeDelete(" + salgrade.getGrade() + ",\""+ salgrade.getLosal() + "\",\""+salgrade.getHisal()+"\")'>");
         str.append("<button type='button' class='btn btn-outline-danger' id='btnDelete'>삭제</button>");
         str.append("</a>");
         
         str.append("</td>");
         
         
         str.append("</tr>");
      }
      
      str.append("</table>");
      str.append("</div>");
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
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
<!-- 
<div>
   <h1> 급여 등급 관리 및 출력 페이지 </h1>
   <hr>
</div>
 -->
 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Home |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	  <li class="nav-item active">
        <a class="nav-link" style="font-size: 1.5rem;">급여 등급 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="SALGRADEInsertForm.jsp" style="font-size: 1.5rem;">급여 등급 추가</a>
      </li>
    </ul>
  </div>
</nav> 
 
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