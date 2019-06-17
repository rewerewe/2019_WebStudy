<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#result
	{
		display : inline-block;
		width: 250px;
		color: #F33;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// 데이터 수집 
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" + id;
		
		// Ajax객체 = XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정 (『open("메소드방식", "URL", 동기/비동기)』)
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function name()
		{
			if (ajax.readyState==4)
			{
				if (ajax.status==200)
				{
					// 업무처리
					callBack();
					
				}
			}
		}
		
		ajax.send("");
	}
	
	// 아이디 중복검사의 결과를 통보받아 사용자에 메시지 출력
	// → span → result	
	function callBack()
	{
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if (data==0)
			document.getElementById("result").innerText = "사용가능한 아이디입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
	}
	
	function search()
	{
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		
		// URL 준비
		var url = "test04.do?addr=" + addr;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
				callBack2();
		}
		ajax.send("");
	
	}
	
	// 우편번호 검색 결과를 통보받아서 사용자에게 안내해 줄 수 있도록 처리.
	function callBack2()
	{
		// XML 문서 전체의 참조 객체. (흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;		
		
		// XML 문서의 최상이 엘리먼트
		//-- 현재는 『<list>』엘리먼트
		var root = doc.documentElement;
		
		// 모든 『<item>』 엘리먼트들 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if (itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 검색하세요.</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML
				= "<option value='0'>주소를 선택하세요.</option>";
		}					
		
		// 검색 결과가 존재할 경우... 반복문 돌며 각 정보 가져오기
		for (var i=0; i<itemList.length; i++)
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는 태그의 첫 번째 자식이고,
			//    텍스트 노드의 값은 nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select Box 에 아이템 추가
			document.getElementById("addrResult").innerHTML 
				+= "<option value='"+ zipcodeText + " / " + addressText 
				+ "'>[" + zipcodeText + "]" + addressText + "</option>";
		}
	}
	
	function selZipCode(sel)
	{
		alert(sel.value);
		
		if (sel.vale != '0')
		{
			// 04048/서울특별시 마포구 서교동 404-27 (서교빌딩)
			document.getElementById("addr1").value = sel.value.split("/")[0];
			document.getElementById("addr2").value = sel.value.split("/")[1];
			document.getElementById("addr3").focus();
		}
	}
	
</script>	
</head>
<body>

<div>
	<h1>회원가입</h1>
	<p>우편번호검사</p>
	<hr>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" >
			<input type="button" value="중복검사" class="control" onclick="check()">
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control" />
			<input type="button" value="검색하기" class="control" onclick="search()">
			<br>
			<select id="addrResult" class="control" onchange="selZipCode(this)">
				<option>주소를 입력하세요.</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control" readonly="readonly" style="width: 200px;">
			<br>
			<input type="text" id="addr2" class="control" readonly="readonly" style="width: 400px;">
			<br>
			<input type="text" id="addr3" class="control" readonly="readonly" placeholder="상세주소를 입력하세요." 
			style="width: 400px;`">
			
		</td>
	</tr>
</table>

</body>
</html>