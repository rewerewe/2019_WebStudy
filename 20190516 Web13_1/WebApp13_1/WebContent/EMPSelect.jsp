<%@page import="com.test.EmpDAO"%>
<%@page import="com.test.EmpDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   StringBuffer str = new StringBuffer();
   
   EmpDAO dao = new EmpDAO();
   
   try
   {
      dao.connection();
      
      //직원번호 직원명 직무 매니저명(MGR)[사원번호, 사원이름] 입사일 급여 수당 부서명(DEPTNO)[부서번호 부서명]  직원관리
      
      str.append("<table class='table'>");
      str.append("<tr>");
      str.append("<th> 직원번호 </th>");
      str.append("<th> 직원명 </th>");
      str.append("<th> 직무 </th>");
      str.append("<th> 매니저명 </th>");
      str.append("<th> 입사일 </th>");
      str.append("<th> 급여 </th>");
      str.append("<th> 수당 </th>");
      str.append("<th> 부서명 </th>");
      str.append("<th> 직원관리 </th>");
      str.append("</tr>");
      
      //EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO
      
      for (EmpDTO member : dao.lists())
      {
         str.append("<tr>");
         str.append("<td>"+ member.getEmpno() +"</td>");
         str.append("<td>"+ member.getEname() +"</td>");
         str.append("<td>"+ member.getJob() +"</td>");
         
         str.append("<td>"+ member.getMgrname() +"</td>");
         //-- 매니저명 가져와야됨. msgname
         
         str.append("<td>"+ member.getHiredate() +"</td>");
         str.append("<td>"+ member.getSal() +"</td>");
         str.append("<td>"+ member.getComm() +"</td>");
         
         str.append("<td>"+ member.getDname() +"</td>");
         //-- 부서명 가져와야됨. dname 
         
         str.append("<td>");
         
         str.append("<a href='EMPUpdateForm.jsp?empno="+ member.getEmpno() +"'>");   
         str.append("<button type='button' class='btn01'>수정</button>");   
         str.append("</a>");   
         
         str.append("<a href='javascript:memberDelete(" + member.getEmpno() + ", \"" + member.getEname() + "\")'>");   
         str.append("<button type='button' class='btn01'>삭제</button>");   
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
<title>EmpSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

   function memberDelete(empno, ename)
   {
      var res = confirm("직원번호 : "+ empno +", 직원명 : "+ ename + "\n이 직원의 정보를 삭제하시겠습니까?");
            
      if (res)
         window.location.href="EMPDelete.jsp?empno="+ empno;
   }

</script>
</head>
<body>
<div>
	<h1>직원 관리 및 출력 페이지(EMPSelect.jsp)</h1>
	<hr>
</div>

<div>
   <a href="DEPTSelect.jsp"><button type="button">부서 목록 관리</button></a>
   <a href="SALGRADESelect.jsp"><button type="button">급여 등급 관리</button></a>
   <a href="EMPInsertForm.jsp"><button type="button">신규 직원 등록</button></a>
</div>

<br>

<div>
   <!-- 직원 리스트 출력 -->
   <%=str %>
</div>



</body>
</html>