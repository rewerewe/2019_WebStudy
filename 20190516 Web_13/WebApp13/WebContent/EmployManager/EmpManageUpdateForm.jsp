<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpManageDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
   /* 사원등록 번호 
   
   직원명 가져오기*/

   String empno = request.getParameter("Empno");

   //String empno = "7844";

   String name = "";
   String hiredate = "";
   int sal = 0;
   int comm = 0;

   //StringBuffer str = new StringBuffer();

   // name 을 조회하기 위해 dao 인스턴스 생성
   EmpManageDAO dao = new EmpManageDAO();

   try {
      dao.connection();

      //수신한 empno를 통해 name 얻어내기
      EmpDTO emp = dao.search(empno);
      name = emp.getEname();
      hiredate = emp.getHiredate();
      sal = emp.getSal();
      comm = emp.getComm();

      /* for(EmpDTO mgr :dao.lists())
      {
         str.append("<tr>");
         str.append("<td>" + mgr.getEname() + "</td>");
         str.append("</tr>");
         
      }  */

   } catch (Exception e) {
      System.out.println(e.toString());
   } finally {
      try {
         dao.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
   }
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpManageUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">


<script type="text/javascript">
   // 등록버튼 함수
   function empManageSubmit()
   {
      var empManageForm = document.getElementById("empManageUpdateForm");

      //var mgr = document.getElementById("mgr").value;

      var job = document.getElementById("job");
      var empno = document.getElementById("empno");
      var ename = document.getElementById("ename");
      var sal = document.getElementById("sal");
      var comm = document.getElementById("comm");
      
      var enameMsg = document.getElementById("enameMsg");

      enameMsg.style.display = "none";

      
      if (ename.value == "")
      {
         enameMsg.style.display = "inline";
         ename.focus();
         return;
      }

      var salMsg = document.getElementById("salMsg");
      var sal1Msg = document.getElementById("sal1Msg");
      var commMsg = document.getElementById("commMsg");
      var comm1Msg = document.getElementById("comm1Msg");
      
      if (sal.value == "" || sal.value == 0)
      {
         salMsg.style.display = "none";
         sal1Msg.style.display = "inline";
         sal.focus();            
         return;
      }
      
      if (sal.value >= 5000)
      {
         sal1Msg.style.display = "none";
         salMsg.style.display = "inline";         
         sal.value = "";
         sal.focus();         
         return;
      }
      
      if (comm.value == "" || comm.value == 0)
      {
         commMsg.style.display = "none";
         comm1Msg.style.display = "inline";
         comm.focus();
         return;
      }
      
      
      if (comm.value >= 20000)
      {
         
         comm1Msg.style.display = "none";
         commMsg.style.display = "inline";         
         comm.value= "";
         comm.focus();
         return;
      }
      
      
      empManageUpdateForm.submit();

   }

   // 취소버튼 함수
   function empManageReset()
   {

      var empManageForm = document.getElementById("empManageUpdateForm");

      var job = document.getElementById("job").value;
      var empno = document.getElementById("empno").value;
      var ename = document.getElementById("ename").value;
      var sal = document.getElementById("sal").value;
      var comm = document.getElementById("comm").value;

      var empnoMsg = document.getElementById("empnoMsg");
      var enameMsg = document.getElementById("enameMsg");

      empnoMsg.style.display = "none";
      enameMsg.style.display = "none";

      empManageUpdateForm.reset();

   }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/1.css">
</head>
<body>

	<div>
		<h1>직원 정보 수정</h1>
		<hr>
	</div>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">사원 목록</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor02" aria-controls="navbarColor02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="../EmpMain.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="EmployManageMain.jsp">사원관리</a></li>
				</ul>

			</div>
		</nav>
	</div>

   <div>
      <!-- 직원 정보 입력 폼 구성 -->
      <form action="EmpManageUpdate.jsp?empno=<%=empno%>" method="post" 
         id="empManageUpdateForm">
         <div class="container down" style="width:500px">
	         <table class="table" >
	            <tr>
	               <th>직원번호</th>
	               <td><input  class="inputCenter" type="text" id="empno" name="empno"
	                  value="<%=empno%>" readonly="readonly" style="border: none;">
	               </td>
	            </tr>
	
	            <tr>
	               <th>직원명</th>
	               <td><input  class="inputCenter" type="text" id="ename" name="ename"
	                  value="<%=name%>"> <span class="errMsg" id="enameMsg" style="display:none">사원
	                     이름을 입력해야 합니다.</span></td>
	            </tr>
	
	            <tr>
	               <th>JOB</th>
	               <td><select id="job" name="job">
	                     <option value="CLERK">CLERK</option>
	                     <option value="SALESMAN">SALESMAN</option>
	                     <option value="MANAGER">MANAGER</option>
	                     <option value="ANALYST">ANALYST</option>
	                     <option value="PRESIDENT">PRESIDENT</option>
	               </select></td>
	            </tr>
	
	
	            <tr>
	               <th>직원등록날짜</th>
	               <td><%=hiredate%></td>
	            </tr>
	
	            <tr>
	               <th>SAL</th>
	               <td><input  class="inputCenter" type="text" id="sal" name="sal" value="<%=sal%>">
	               <span class="errMsg" name="salMsg" id="salMsg" style="display:none; color:red;">5000 이하의 수만 가능합니다.</span>   
	               <span class="errMsg" name="sal1Msg" id="sal1Msg" style="display:none; color:red;">값을 입력해주세요.</span>   
	               </td>
	            </tr>
	
	            <tr>
	               <th>COMM</th>
	               <td><input  class="inputCenter" type="text" id="comm" name="comm"
	                  value="<%=comm%>">
	               <span class="errMsg" name="commMsg" id="commMsg" style="display:none; color:red;">20000 이하의 수만 가능합니다.</span>      
	               <span class="errMsg" name="comm1Msg" id="comm1Msg" style="display:none; color:red;">값을 입력해주세요.</span>   
	               </td>
	            </tr>
	         </table>
         </div>
         <br> 
         <div style="text-align:center;">
         	<a href="javascript:empManageSubmit()">
	        	<button type="button" class="btn btn-primary btn-lg"> 수　정 </button>
	        </a> 
	        <a href="EmployManageMain.jsp">
	        	<button type="button" class="btn btn-secondary btn-lg">뒤로가기</button>
	        </a>
         </div>
         
      </form>
   </div>



</body>
</html>