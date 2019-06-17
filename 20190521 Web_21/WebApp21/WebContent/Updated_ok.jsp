<%@page import="java.net.URLEncoder"%>
<%@page import="javax.print.URIException"%>
<%@page import="javax.xml.crypto.URIDereferencer"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%

	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
 	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	dao.updateData(dto);

	String encodeValue = "";
	
	if (searchValue != null)
		encodeValue = URLEncoder.encode(searchValue, "UTF-8");
	
	String param= "";
	if (searchKey != null && !searchValue.equals(""))
	{
		param = "&searchKey=" + searchKey + "&searchValue=" + encodeValue;
	}
	
	
	DBConn.close();
	
	String str = "List.jsp?pageNum=" + pageNum + param;
	
	response.sendRedirect(str);
	
%>
