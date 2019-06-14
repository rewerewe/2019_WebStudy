<%@page import="com.test.EmpDAO"%>
<%@page import="com.test.EmpDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%! int flag=1; %>
<%	
	
    StringBuffer str = new StringBuffer();
	String es = "";
	String ns = "";
	String js = "";
	String ms = "";
	String ds = "";
	String tv = "";
	
	

    request.setCharacterEncoding("UTF-8");
   
	String sort = request.getParameter("sort");
	String val = request.getParameter("val");
	String sorting = request.getParameter("sorting");
   
	EmpDAO dao = new EmpDAO();
	
	int count = 0;
	try
	{
	   dao.connection();
	   
	   count = dao.count();
	   
	   //직원번호 직원명 직무 매니저명(MGR)[사원번호, 사원이름] 입사일 급여 수당 부서명(DEPTNO)[부서번호 부서명]  직원관리
	   str.append("<div class='container'>");
	   str.append("<table class='table table-hover'>");
	   str.append("<thead class='thead-dark'>");
	   str.append("<tr>");      
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"EMPNO\")' style=\"color: white;\">직원번호</a>");
	   str.append("</th>");   
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"ENAME\")' style=\"color: white;\">직원명</a>");        
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"JOB\")' style=\"color: white;\">직무</a>");  
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"MGRNAME\")' style=\"color: white;\">매니저명</a>");  
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"HIREDATE\")' style=\"color: white;\">입사일</a>");  
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"SAL\")' style=\"color: white;\">급여</a>");  
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"COMM\")' style=\"color: white;\">수당</a>");  
	   str.append("</th>");  
	   str.append("<th>");
	   str.append("<a href='javascript:sortAll(\"DNAME\")' style=\"color: white;\">부서명</a>");  
	   str.append("</th>"); 	   
	   str.append("</a>");
	   
	   str.append("<th> 직원관리 </th>");
	   
	   str.append("</tr>");
	   str.append("</thead>");
	   //EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO
	   
	   if (sort!=null && val!=null)
	   {    	  
	 	  switch(sort)
	 	  {
		 	  case "ENAME"  : ns = "selected='selected'"; break;
		 	  case "EMPNO"  : es = "selected='selected'"; break;
		 	  case "JOB"    : js = "selected='selected'"; break;
		 	  case "MGRNAME": ms = "selected='selected'"; break;
		 	  case "DNAME"  : ds = "selected='selected'"; break;
	 	  }
	 	  
	 	  tv = "value='"+val+"'";
	 			  
	 	  for (EmpDTO member : dao.searchList(sort, val))
	 	  {    		  
	 		  str.append("<tr>");
	           str.append("<td>"+ member.getEmpno() +"</td>");
	           str.append("<td>"+ member.getEname() +"</td>");
	           str.append("<td>"+ member.getJob() +"</td>");
	           
	           str.append("<td>"+ member.getMgrname() +"</td>");             
	           
	           str.append("<td>"+ member.getHiredate() +"</td>");
	           str.append("<td>"+ member.getSal() +"</td>");
	           str.append("<td>"+ member.getComm() +"</td>");
	           str.append("<td>"+ member.getDname() +"</td>");            
	           
	           str.append("<td>");
	           
	           str.append("<a href='EMPUpdateForm.jsp?empno="+ member.getEmpno() +"'>");   
	           str.append("<button type='button' class='btn btn-outline-primary' id='btnUpdate'>수정</button>");   
	           str.append("</a>");   
	           
	           str.append("<a href='javascript:memberDelete(" + member.getEmpno() + ", \"" + member.getEname() + "\")'>");   
	           str.append("<button type='button' class='btn btn-outline-danger' id='btnDelete'>삭제</button>");   
	           str.append("</a>");   
	           
	           str.append("</td>");
	           str.append("</tr>");
	 	  }
	   }
	   else if(sorting!=null)
	   {       	   
	 	  for(EmpDTO member : dao.sortList(sorting, flag))
	 	  {
	 		  
	 		  str.append("<tr>");
	           str.append("<td>"+ member.getEmpno() +"</td>");
	           str.append("<td>"+ member.getEname() +"</td>");
	           str.append("<td>"+ member.getJob() +"</td>");
	           
	           str.append("<td>"+ member.getMgrname() +"</td>");             
	           
	           str.append("<td>"+ member.getHiredate() +"</td>");
	           str.append("<td>"+ member.getSal() +"</td>");
	           str.append("<td>"+ member.getComm() +"</td>");
	           
	           str.append("<td>"+ member.getDname() +"</td>");            
	           
	           str.append("<td>");
	           
	           str.append("<a href='EMPUpdateForm.jsp?empno="+ member.getEmpno() +"'>");   
	           str.append("<button type='button' class='btn btn-outline-primary'id='btnUpdate'>수정</button>");   
	           str.append("</a>");   
	           
	           str.append("<a href='javascript:memberDelete(" + member.getEmpno() + ", \"" + member.getEname() + "\")'>");   
	           str.append("<button type='button' class='btn btn-outline-danger'id='btnDelete'>삭제</button>");   
	           str.append("</a>");   
	           
	           str.append("</td>");
	           str.append("</tr>");
	           
	 	  }
	 	  
	 	  flag++;
	   }
	   else
	   {    	  
	 	  for (EmpDTO member : dao.lists())
	       {
	          str.append("<tr>");
	          str.append("<td>"+ member.getEmpno() +"</td>");
	          str.append("<td>"+ member.getEname() +"</td>");
	          str.append("<td>"+ member.getJob() +"</td>");
	          
	          str.append("<td>"+ member.getMgrname() +"</td>");             
	          
	          str.append("<td>"+ member.getHiredate() +"</td>");
	          str.append("<td>"+ member.getSal() +"</td>");
	          str.append("<td>"+ member.getComm() +"</td>");
	          
	          str.append("<td>"+ member.getDname() +"</td>");           
	          
	          str.append("<td>");
	          
	          str.append("<a href='EMPUpdateForm.jsp?empno="+ member.getEmpno() +"'>");   
	          str.append("<button type='button' class='btn btn-outline-primary'id='btnUpdate'>수정</button>");   
	          str.append("</a>");   
	          
	          str.append("<a href='javascript:memberDelete(" + member.getEmpno() + ", \"" + member.getEname() + "\")'>");   
	          str.append("<button type='button' class='btn btn-outline-danger'id='btnDelete'>삭제</button>");   
	          str.append("</a>");   
	          
	          str.append("</td>");
	          str.append("</tr>");
	       }
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
<title>EmpSelect.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
<script type="text/javascript">

	function memberDelete(empno, ename)
	{
	   var res = confirm("직원번호 : "+ empno +", 직원명 : "+ ename + "\n이 직원의 정보를 삭제하시겠습니까?");
	         
	   if (res)
	      window.location.href="EMPDelete.jsp?empno="+ empno;
	}
   
	function goSearch()
	{
		
		var sort = document.getElementById("search").value;
		var val = document.getElementById("searchVal").value;		
		
		if (sort!=""&& sort!=null && val!="")
		{				
			window.location.href="EMPSelect.jsp?sort="+ sort + "&val=" + val;
		}			
	}
	
	function sortAll(sort)
	{
		window.location.href="EMPSelect.jsp?sorting="+sort;
	}

</script>
</head>
<body>

<!-- 메뉴바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

  <!-- 홈페이지 이름 -->
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Team 4 |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- 주요 메뉴 구성 -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li  class="nav-item active">
        <a class="nav-link" href="DEPTSelect.jsp"  style="font-size: 1.5rem;">부서관리</a>
      </li>
      <li  class="nav-item active">
        <a class="nav-link" href="SALGRADESelect.jsp" style="font-size: 1.5rem;">급여관리</a>
      </li>
      <li  class="nav-item active">
        <a class="nav-link" href="EMPInsertForm.jsp" style="font-size: 1.5rem;">신규 직원 등록</a>
      </li>
    </ul>
    
    <!-- 검색 영역 -->
    <div class="form-inline my-2 my-lg-0">
	<select name="search" id="search" style="margin-right: 10px; height: 2.15em;" class="custom-select">
		<option value="">검색</option>
		<option value="EMPNO" <%=es %>>직원번호</option>
		<option value="ENAME" <%=ns %>>직원명</option>
		<option value="JOB" <%=js %>>직무</option>
		<option value="MGRNAME" <%=ms %>>매니저명</option>
		<option value="DNAME" <%=ds %>>부서명</option>
	</select>  
	<input type="text" id="searchVal" onkeypress="if( event.keyCode==13 ){goSearch();}" <%=tv %> class="form-control mr-sm-2" >
	<a href="EMPSelect.jsp"><button type="button" class="btn btn-outline-success my-2 my-sm-0" >검색초기화</button></a>
  </div>
  </div>
</nav>

<div>
   
   <!-- 총 직원 수 출력 -->
   <div class="container">
   		<br>
		<p style="font-size: 1.5em;">총 직원 수 : <%=count %> 명</p>
	</div>
   
   <!-- 직원 리스트 출력 -->
   <%=str %>
   
</div>

</body>
</html>