<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.test.MemberScoreDAO"%>
<%
	//MemberScoreUpdate.jsp
	
	// 데이터 수신 - sid, kor, eng, mat
	String sid = request.getParameter("sid");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	// MemberScoreDAO 인스턴스 생성 
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.modify(score);
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	
	
	// 변경된 URL 로 다시 요청 할 수 있도록 안내 
	response.sendRedirect("MemberScoreSelect.jsp");	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>