<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String su1 = request.getParameter("su1");
	String su2 = request.getParameter("su2");

	
	int row = Integer.parseInt(su1);
	int col = Integer.parseInt(su2);
		
	String result ="";
	int count = 0;
	
	result += "<table>";

	for(int i=1; i<=row; i++)
	{
		result += "<tr>";
				
		for(int j=1; j<=col; j++)
		{
			result += "<td>" + (count++) + "</td>";
		}
		
		result += "</tr>";
	}

	result += "</table>";
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

.table tr 
{
	border: 1px solid gray;	
}

</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Table.jsp → Table_ok.jsp ● </p>
</div>

<div>
	<h2>수신한 데이터</h2>
	
	
</div>

<div> <%=result %> </div> 

</body>
</html>