<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message");
	//-- getAttribute 는 obj 를 반환하므로, 실제 데이터가 들어있는 데이터타입으로 형변환 해서 쓴다. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습10</h1>
	<hr>
</div>

<div>
	<p>최종 수신 페이지(Receive10.jsp)</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>


<!-- ① 리다이렉트(Send.jsp → Send10_re.jsp→Receive10.jsp)
	
     -리다이렉트는 클라이언트가
     지정한 주소 (『response.sendRedirect("Receive10.jsp")』를
     서버에게 다시 요청하는 것
     - 처음 요청한 request 객체는 ㅡ리다이렉트로 넘어가는 과정에서
     사라지게 된다.(소멸된다)
     -요청이 클라이언트 단위에서 새로 요청하는 것이기 때문에
     속도가 느릴 수 있다
     -DB에서 insert,update,delete 하고나면
     리다이렉트를 지정하여 처리해야 수정된 내용을
     다시 적용하여 확인할 수 있다.
     - 브라우저의 주소를 확인해 보면
     최종 도착 페이지에 해당하는
     『Receive10.jsp』인 것을 확인할 수 있다.
     
     ② 포워드 (Send.jsp → Send10_for.jsp→Receive10.jsp)
     
      - 포워드는 서버 내에 수신된 데이터를 포워딩한 주소로 넘겨주는 것.
      - 처음 요청한 request 객체가 유지된다.
      - 서버 내부에서 주소가 변경된 것이기 때문에
      클라이언트 입장에서는 이 사실을 알지 못한다.
      그렇기 때문에 클라이언트에게 보이는 주소는
      포워딩 이전 주소만 노출된다
      - 보안 측면에서 유리할 수 있다.
      - 포워딩 하는 과정에서 재존송하는 데이터를 가감할 수 있다.
      (setaAttribute(), getAttribute() 메소드 사용)
      ※ setaAttribute(),getAttribute() 는
        문자열 뿐만 아니라 객체를 넘기고 받을 수 있다.
      - 서블릿에서 작업한 결과를 클라이언트 출력 화면을 구성하는
        JSP 로 넘길 때 포워딩을 많이 사용하게 된다.
      - 브라우저 주소를 확인해 보면
      최종 도착 페이지가 아닌
      『Send10_for.jsp』인 것을 확인할 수 있다.
	
	 -->
</body>
</html>