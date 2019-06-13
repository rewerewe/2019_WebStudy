<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String btnA = request.getParameter("a");
	String btnB = request.getParameter("b");
	String btnC = request.getParameter("c");
	String btnD = request.getParameter("d");
	String btnE = request.getParameter("e");
	String btnF = request.getParameter("f");
	String btnSubmit = request.getParameter("submit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fn(obj){
		obj.submit();
	}
</script>
</head>
<body>
	<div>
		<form action="Test999.jsp" method="get">
			<button name="a" value="a" onclick="fn(this.form)">btnA</button>
			<button name="b" value="b" onclick="fn(this.form)">btnB</button>
			<button name="c" value="c" onclick="fn(this.form)">btnC</button>
			<button name="d" value="d" onclick="fn(this.form)">btnD</button>
			<button name="e" value="e" onclick="fn(this.form)">btnE</button>
			<button name="f" value="f" onclick="fn(this.form)">btnF</button>
			<button type="submit" name="submit" value="submit">submit</button>
		</form>
	</div>
	<hr>
	<div>
		a:<%=btnA %><br>
		b:<%=btnB %><br>
		c:<%=btnC %><br>
		d:<%=btnD %><br>
		e:<%=btnE %><br>
		f:<%=btnF %><br>
		submit: <%=btnSubmit %>
	</div>
	
	
</body>
</html>