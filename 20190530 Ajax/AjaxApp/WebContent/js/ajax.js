/**
 * ajax.js 
 */

var ajax = null;

// AJAX 객체(XMLHttpRequest객체) 생성 함수
function createAjax()
{
	// ※ 객체를 생성하는 방식의 차이일뿐..
	//    모두 XMLHttpRequest 객체를 생성하는 구문이다. 

	if (window.ActiveXObject) 	//-- IE 7 이전
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
		//   (ActiveXObject객체 → XMLHttpRequest 객체의 대리 객체)
	}
	else						//-- 그 외 브라우저 
	{
		if (window.XMLHttpRequest)	//-- XMLHttpRequest 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
		}
		else						//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
		}
	}
}