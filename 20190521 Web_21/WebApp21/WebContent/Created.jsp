<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">

<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		f = document.myForm;
		
		// 제목 입력 확인 ------------------------------------------
		str = f.subject.value;
		str = str.trim();
		
		// 자바스크립트에는 trim 함수가 없으나, util 에서 만들어 주었기 때문에 호출해서 쓸 수 있다
		// ※ javascript 에는 trim() 이 존재하지 않음.
		//    외부에서 참조한 util.js 에 만들어 두었음.
		
		// 테스트
		//alert("|" + str + "|");
		
		if (!str)
		{
			alert("제목을 입력하세요-!!!!")
			f.subject.focus();
			return;
		}
		
		
		/* 
		언니...
		맨 뒷자리는 아늑하네요...
		키보드도 너무 좋아요...
		언니 오늘 카페 가서 사진 백장 찍어요
		*/
		
		
		
		// 이름 입력 확인 ------------------------------------------
		str = f.name.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n작성자 이름을 입력하세요-!!!");
			f.name.focus();
			return;
		}
		
		// 이메일 검사  ---------------------------------------------
		if (f.email.value)
		{
			if (!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요-!!!");
				f.email.focus();
				return;
			}
		}
		
		// 비밀번호  ---------------------------------------------
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요-!!!!");
			f.pwd.focus();
			return;
		}
		
		//--- 모든 검사 끝. 
		
		
		f.action = "<%=cp%>/Created_ok.jsp";
		
		f.submit();
		
	}

</script>
</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<form action="" method="post" name="myForm">
	
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" size="74" maxlength="100" class="boxTF">
					</dd>
				</dl>
			</div>
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<input type="text" name="name" size="35" maxlength="20" class="boxTF">
					</dd>
				</dl>
			</div>
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<input type="email" name="email" size="35" maxlength="50" class="boxTF">
					</dd>
				</dl>
			</div>
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
					</dd>
				</dl>
			</div>
			
			<div id="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>	
						<input type="password" name="pwd" size="35" maxlength="7" class="boxTF">
						&nbsp;(게시물 수정 및 삭제시 필요-!!!)
					</dd>
				</dl>
			</div>
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2" onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.subject.focus();">
				<input type="button" value="작성취소" class="btn2" onclick="javascript:location.href='<%=cp %>/List.jsp'">
			</div>
		
		</div><!-- close bbsCreated -->
	</form>
</div>

</body>
</html>