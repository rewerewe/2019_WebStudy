<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	.short
	{
		width: 150px;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function sum()
	{
		//데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		// URL 구성
		var url = "test02.do?n1=" + n1 + "&n2=" + n2;
		
		// XMLHttpRequest 객체 생성(AJAX 객체)
		ajax = createAjax();	//-- ajax.js
		
		// 『"GET"』 : 요청방식 (POST 사용 가능. POST 사용시 헤더 추가)
		// 『url』 : AJAX 요청 페이지 (데이터 수신 및 응답 페이지)
		// 『true』 : boolean → true(비동기), false(동기), 동기는 사용 안함. 	
		ajax.open("GET", url, true);
		//-- 실제 서버와의 연결이 아니고 환경설정 부분으로 이해하는 것이 좋다.
		//   (실제 서버 연결은 나중에...)
		
		// ajax 객체(XMLHttpRequest 객체)의 readystate 속성은
		// 각 단계별로 변환되어 0 부터 4까지 순차적으로 증가한다.
		// 그 때마다... 『readystatechange』 이벤트가 발생한다.
		ajax.onreadystatechange = function()
		{
			// ※ 『XMLHttpRequest』의 『readyState』는 0 에서 4까지 순차적으로 변화한다.
			//		0 → 요청이 초기화 되지 않음.
			//		1 → 서버 연결이 이루어지지 않음.
			//    	2 → 요청이 수신됨.
			//    	3 → 요청을 처리중.
			//    	4 → 요청의 처리가 종료되고, 응답이 준비됨.
			
			// 그 중에서... (0 부터 4 까지의 상태 중에서...)
			// 4 가 되는 순간이 요청했던 서버로부터 응답이 완료된 시점이기 때문에
			// 4인 경우 업무를 진행한다.
			if (ajax.readyState == 4)
			{
				// 서버로부터 응답이 완료되었다 하더라도 
				// 그 과정에서 데이터가 올바른 것인지 에러 메시지를 받은 것인지
				// 알 수 없기 때문에 서버로부터 응답 코드를 확인한 후
				// 업무를 진행할 수 있도록 처리(구성)한다.
				if (ajax.status == 200)
				{
					 	// 업무 진행
					 	//-- 업무 코드를 외부로 추출 
					 	callBack();
					 	//-- 이같은 방식으로 처리되는 행위를 callBack 이라고도 한다. 
				}
			}
		}
		
		// 실제 서버에서 AJAX 요청을 한다. (즉, 이 부분이 진짜 연결 작업이다.)
		// GET 방식으로 데이터를 전송하는 경우... 인자값이 ""
		// POST 방식으로 데이터를 전송하는 경우... 인자값에 데이터를 넣는다.
		// 현재는 GET 방식의 요청이다. (비워두는 것이 안됨)
		ajax.send("");
		
	}// end sum()
	
	
	// 추출된 업무 코드
	//-- AJAX 요청이 완료된 후 호출되는 최종 업무 처리 함수
	function callBack()
	{
		// 여기서는 두가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버에서 응답한 데이터가 텍스트일 경우 (단일 데이터)
		var data = ajax.responseText;
		
		// 2. 서버에서 응답한 데이터가 XML일 경우 (다량 데이터)
		//var data = ajax.responseXML;
		
		// 받아온 데이터를 업무에 적용한다.
		document.getElementById("result").value = data;
	}
	
	
</script>
</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr>
</div>
<!-- 
	연산처리는 다른 곳에서, 결과만 붙여넣는 방식으로 처리할 것
	(페이지가 갱신되어도 다른 데이터에 영향이 없도록)
	1. AjaxTest02.jsp 의 sum() 에서 callBack();
	   ?? callBack - send 가 되면 Test02.java 로 가나? 
									2. Test02.java 
									3. Test02OK.jsp == AjaxTest02.jsp 의 ajax.responseText 에 담김
	4. AjaxTest02.jsp 의 result.value 에 응답데이터 담김 
 -->

<input type="text" id="num1" class="short" />
+
<input type="text" id="num2" class="short" />
<input type="button" value="=" onclick="sum()" />
<input type="text" id="result" class="short" />
<br><br>

<h2>같은 페이지 내에 있는 기타 다른 요소들</h2>
<input type="text" />

<br>

<input type="checkbox" name="check" value="check1" />
<input type="checkbox" name="check" value="check2" />

<br>

<input type="radio" name="rdo" value="rdo1" />
<input type="radio" name="rdo" value="rdo2" />

<br>

<select id="sel">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
</select>

<br>
</body>
</html>