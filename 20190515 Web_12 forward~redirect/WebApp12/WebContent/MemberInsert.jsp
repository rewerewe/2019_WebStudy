<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%
	// MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)에
	//   회원 정보 추가 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지를 요청할 수 있도록 안내
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();

	try 
	{	
		// DB 연결 
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(add() 메소드 호출을 위해 필요)
		MemberDTO dto = new MemberDTO();

		dto.setName(uName);
		dto.setTel(uTel);

		// insert 쿼리문을 수행하는 dao의 메소드 add() 호출
		dao.add(dto);
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try 
		{
			// 데이터베이스 연결 종료 
			dao.close();
		}
		catch (Exception e)	
		{
			System.out.print(e.toString());
		}
	}
	
	// ▶ check ◀
	// 클라이언트가 MemberSelect.jsp 를 다시 요청 할 수 있도록 처리
	response.sendRedirect("MemberSelect.jsp");
%>







