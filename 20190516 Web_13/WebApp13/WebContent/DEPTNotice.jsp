<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPTNotice.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/team4_v1.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/team4.css">
</head>
<body>

<!-- 메뉴 바 구성 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="EMPSelect.jsp" style="font-size:2.5em;">Home |</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	  <li class="nav-item">
        <a class="nav-link" href="SALGRADESelect.jsp" style="font-size: 1.5rem;">급여 등급 관리</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="SALGRADEInsertForm.jsp" style="font-size: 1.5rem;">급여 등급 추가</a>
      </li>
    </ul>
  </div>
</nav>

<br><br>

<div class="container">
	<div>
		<h1>안내</h1>
		<hr>
	</div>
	
	<div>
		<p style="font-size: 20pt;">해당 부서로 등록되어 있는 직원이 있으므로 해당 부서는 삭제가 불가능합니다. </p>
		<br>
		<a href="DEPTSelect.jsp" style="font-size: 20pt;">돌아가기</a>
	</div>
</div>
</body>
</html>