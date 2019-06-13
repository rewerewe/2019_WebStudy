<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// Redirect12_t.jsp
	
	// 데이터 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	// 연산 처리
	String str = "";
	if(op.equals("1"))
		str += String.format("%d",(num1+num2));
	else if(op.equals("2"))
		str += String.format("%d",(num1-num2));
	else if(op.equals("3"))
		str += String.format("%d",(num1*num2));
	else if(op.equals("4"))
		str += String.format("%.1f",(num1/(double)num2));
	
	// ▶ c h e c k ◀ 
	response.sendRedirect("Receive12_t.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	// 여기서 str 넘기려면 get 방식으로만 가능하다.
	// → "네가 나한테 요청하는 즉시 요청서는 날아가.. 그러니 그걸 다시 적어서 넘겨줄게. 이대로 현우에게 주면 돼"(?) 라고 하는 것과 같음.
	// 위와 같이 값을 직접 적어 결과 데이터 재전송 → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//     : 지정된 URL(location)로 요청을 재전송 한다. 
	
%>
