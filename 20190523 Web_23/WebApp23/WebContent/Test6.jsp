<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.test.core.MyData"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<%
	// Test6.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();

	MyData ob = new MyData("유진석", 25);
	lists.add(ob);
	
	ob = new MyData("진윤비", 15);
	lists.add(ob);
	
	ob = new MyData("나주영", 8);
	lists.add(ob);
	
	ob = new MyData("이승희", 13);
	lists.add(ob);
	
	ob = new MyData("김경환", 17);
	lists.add(ob);
	
	ob = new MyData("이지혜", 85);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
	/* parameter는 살아있을 것이라, setAtrribute 에 담아 함께 넘겨준다. */
%>
<jsp:forward page="Test6_result.jsp"></jsp:forward>
