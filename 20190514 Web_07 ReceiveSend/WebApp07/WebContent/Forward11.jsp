<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	int num1 = Integer.parseInt(request.getParameter("su1"));
	int num2 = Integer.parseInt(request.getParameter("su2"));
 	String calResult = request.getParameter("yon");
	
	String result ="";
	
	if(calResult.equals("1"))
		result = String.format("%d + %d = %d",num1,num2,(num1+num2));
	if(calResult.equals("2"))
		result = String.format("%d - %d = %d",num1,num2,(num1-num2));
	if(calResult.equals("3"))
		result = String.format("%d * %d = %d",num1,num2,(num1*num2));
	if(calResult.equals("4"))
		result = String.format("%d / %d = %d",num1,num2,(num1/(double)num2));
	
	request.setAttribute("resultStr",result); 
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:forward page="Receive11.jsp"></jsp:forward>

</head>
<body>

</body>
</html>