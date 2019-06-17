<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#search
	{
		width: 500px;
	}
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 68px;
		top: 134px;
		
		display: none; 
	}
	#list .item
	{
		padding: 3px;
	}
	#list #footer
	{
		background-color: #DDD;
		text-align: right;
		padding: 5px;
		font-size: small;	
	}
</style>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

	// 키보드를 누를때마다 그 때까지의 입력된 단어를 서버로 전송하고,
	// 그에 맞는 추천 검색어를 받아올 수 있도록 처리
	function search()
	{
		// 데이터 수집
		var search = document.getElementById("search").value;
		
		// 테스트
		//alert(search);
		
		// 검색어가 있을 경우에만 전솔할 수 있도록 처리.
		if (search.replace(" ","") == "")
		{
			document.getElementById("list").style.display = "none";
			return;
		}
		
		//완성형 한글 정규식 -> 관련해서는 검색하고 찾아보고 정리해둘것.
		// 완선형 한글일 경우에만 검색 키워드 전송하기 → 정규표현식 사용
		var regEx = /^[가-힣]{1,}$/;

		if (!regEx.test(search))
		{
			return;
		}
		// URL 구성
		
		var url = "test05.do?search=" + search;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			console.log("ajax.readyState : ", ajax.readyState);
			if (ajax.readyState==4)
			{
				if (ajax.status==200)
				{
					callBack();
				}
			}
		}
	
		ajax.send("");
	}
	
	// 업무 내용 
	//-- XML 목록으로 받아온 검색어들을 적당한 리스트로 생성해서 화면에 출력
	function callBack()
	{
		document.getElementById("items").innerHTML = "";
		
		// XML 문서 객체
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트 수신 : <list>	
		var root = doc.documentElement;
		
		// TagName 으로 가져오자 : <item>
		var itemList = root.getElementsByTagName("item");
		
		// alert 창을 어떻게 확인하니....
		//alert(itemList.length);
		
		// <search> 로 가야하는데... 배열값을 반환하니 for 문으로 꺼내주는 것인가!
		for (var i=0; i<itemList.length; i++)
		{
			// <search> Tag 에 있는 값을 담아보자.
			var word = itemList[i].getElementsByTagName("search");
			//console.log("word : ", word);
			
			// ........? → F11 + ctrl 실행후 F12 + console.log(ajax) 로 확인해보기. 
			var wordText = word[0].firstChild.nodeValue;
	
			document.getElementById("items").innerHTML += "<div class='item'>" + wordText + "</div>";
		}
		
		document.getElementById("list").style.display = "inline";
		
	}
	
</script>
</head>
<body>

<div>
	<h1>추천 검색어 실습</h1>
	<hr>
</div>

<div>검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요." onkeyup="search()">
</div>


<!-- 
<div id="list">
	<div id="items">
		<div class="item">가사</div>
		<div class="item">가위</div>
		<div class="item">가지</div>
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 풀기</div>
		<div class="item">가방끈 매듭 만드는 법</div>
		<div class="item">가장자리 다듬기</div>
		<div class="item">가차없이</div>
	</div>
	<div id="footer">
		추천검색어
	</div>
</div> 
-->

<div id="list">
	<div id="items">
		<div class="item"></div>
	</div>
	<div id="footer">
		추천검색어
	</div>
</div>

</body>
</html>