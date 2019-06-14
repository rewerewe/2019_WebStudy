

<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	// 기본 조회 인덱스=0
	int deptno=0;
	// 넘겨 받은 값이 있으면 조회 인덱스 변경
	String deptnoStr = request.getParameter("selectDept");
	if(deptnoStr!=null )
		deptno = Integer.parseInt(deptnoStr);
	
	// Search용 인덱스
	String listSearch = request.getParameter("listSearch");
	// 대문자로 변환
	if(listSearch!=null)
		listSearch = listSearch.toUpperCase();
	
	// 조회 테이블 담을 StringBuffer
	StringBuffer str = new StringBuffer();
	// 기본 테이블 head
	str.append("<table class='table'>");
	str.append("<tr>");
	str.append("<th>사원번호</th>");
	str.append("<th>이름</th>");
	str.append("<th>직위</th>");
	str.append("<th>담당매니저</th>");
	str.append("<th>입사일</th>");
	str.append("<th>급여</th>");
	str.append("<th>보너스</th>");
	str.append("<th>연봉</th>");
	str.append("<th>급여등급</th>");
	str.append("<th>부서</th>");
	str.append("<th>지역</th>");
	str.append("<th>버튼들</th>");
	str.append("</tr>");
	
	// EmpDAO 인스턴스 생성
	EmpDAO dao = new EmpDAO();
	// 입력 버튼
	String btnInsert="";
	// 수정 버튼
	String btnUpdate="";
	// 삭제 버튼
	String btnDelete="";
	try
	{
		// DB연결
		dao.connection();
		
		// 테이블에 행 추가
		for(EmpDTO dto : (listSearch==null ? dao.empManageLists(deptno) : dao.empManageLists(listSearch)))
		{
			// 모두 비어 있으면 버튼 클래스 변경 및 href 변경
			//   JOB 미입력                   급여 미입력        보너스 미입력
			if(dto.getJob()==null && dto.getSal()==0 && dto.getComm()==0) // Pay, Grade는 입력 값이 아님
			{
				// 모두 비어 있을 때 → 입력만 가능
				// Insert a태그에 href를 걸어주고 button엔 btn01 클래스
				btnInsert = "<a href='EmpManageInsertForm.jsp?Empno="+dto.getEmpno()+"'><button class='btn01 btn btn-outline-primary'>입력</button></a>";
				// Update, Delete a태그에 href 빼주고 button에 btn02 클래스
				btnUpdate = "<button class='btn02 btn btn-outline-primary'>수정</button>";
				btnDelete = "<button class='btn02 btn btn-outline-danger'>삭제</button>";
			}
			else
			{
				// 하나라도 들어가 있을 때 → 수정, 삭제 가능
				// Insert a태그에 href 빼주고 button에 btn02 클래스
				btnInsert = "<button class='btn02 btn btn-outline-primary'>입력</button></a>";
				// Update, Delete a태그에 href를 걸어주고 button엔 btn01 클래스
				btnUpdate = "<a href='EmpManageUpdateForm.jsp?Empno="+dto.getEmpno()+"'><button class='btn01 btn btn-outline-primary'>수정</button></a>";
				btnDelete = "<a href='javascript:empDelete(\""+dto.getEmpno()+"\", \""+dto.getEname()+"\")'><button class='btn01 btn btn-outline-danger'>삭제</button></a>";
			}
			
			
			str.append("<tr>");
			str.append("<td>" + dto.getEmpno() + "</td>"); // 필수
			str.append("<td>" + dto.getEname() + "</td>"); // 필수
			str.append("<td>" + (dto.getJob()==null?"":dto.getJob()) + "</td>");
			str.append("<td>" + (dto.getMgr().equals("()")?"":dto.getMgr()) + "</td>");
			str.append("<td>" + dto.getHiredate() + "</td>");
			str.append("<td>" + (dto.getSal()==0 ? "" : String.valueOf(dto.getSal())) + "</td>");
			str.append("<td>" + (dto.getComm()==0 ? "" : String.valueOf(dto.getComm())) +"</td>");
			str.append("<td>" + (dto.getPay()==0 ? "" : String.valueOf(dto.getPay())) + "</td>");
			str.append("<td>" + (dto.getGrade()==null?"":dto.getGrade()) + "</td>");
			str.append("<td>" + dto.getDname() + "</td>"); // 필수
			str.append("<td>" + dto.getLoc() + "</td>"); // 필수
			str.append("<td>");
			str.append(btnInsert);
			str.append(btnUpdate);
	 		str.append(btnDelete);
			str.append("</td>");
			str.append("</tr>");
		}
	}catch(Exception e)
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
	str.append("</table>");
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 부서 SelectBox 출력
	
	// DeptDAO 인스턴스 생성
	DeptDAO deptDao = new DeptDAO();
	
	// 부서 SelectBox 만들 StringBuffer
	StringBuffer deptList = new StringBuffer();
	deptList.append("<select class = 'custom-select' id='selectDept' name='selectDept' onchange='changeDept()'>");
	deptList.append("<option value=0>전체 출력</option>");
	try
	{
		// DB연결
		deptDao.connection();
		// 부서 담기
		for(DeptDTO dto : deptDao.list())
		{
			deptList.append("<option value="+dto.getDeptno()+" "+(dto.getDeptno().equals(deptnoStr)? "selected='selected'" : "") + "'>"+dto.getDname()+"</option>");
		}
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			deptDao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	deptList.append("</select>");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/1.css">
<title>EmployManageMain.jsp</title>
</head>
<body>

<div>
	<h1>Emp 인사관리 > 사원 정보</h1>
	<hr>
</div>


<div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="#">사원 관리</a>
	
	  <div class="collapse navbar-collapse" id="navbarColor02">
	  
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link"  href="../EmpMain.jsp">Home</a>
	      </li>
	      <li class="nav-item active">
	    	<form action="EmployManageMain.jsp" id="form" name="form">
				<%=deptList %>
			</form>
	      </li>
	    </ul>
	    
	    <form action="EmployManageMain.jsp"  class="form-inline my-2 my-lg-0" id="searchForm">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search" id="listSearch" name="listSearch">
	      <button class="btn btn-secondary my-2 my-sm-0" type="button" onclick="fn1()" >Search</button>
	    </form>
	    
	  </div>
	</nav>
</div>


<div>
	<%=str %>
</div>
<script>
	// 부서 SelectBox 바꾸면 실행
	function changeDept()
	{
		var form = document.getElementById("form");
		form.submit();
	}
	// 삭제 버튼 누르면 실행
	function empDelete(empno, ename)
	{
		var res = confirm("사원번호: "+empno+", 사원명: "+ename+"\n사원의 입력 정보를 삭제하시겠습니까?");
		if(res)
			window.location.href = "EmployManageDelete.jsp?empno=" + empno;
	}
	function fn1()
	{
		var form = document.getElementById("searchForm");
		form.submit();
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
</body>
</html>