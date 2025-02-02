/*=========================
	Test03.java
=========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// (AjaxTest03.jsp 에서 넘긴) 데이터 수신 
		String id = request.getParameter("id");
		
		// id 가 ujs 일 경우,
		// Model → DB 액션 처리 요청 → DAO(처리 요청)
		// 								 --------------
		// 									DTO, Connection 활용
		// → SELECT COUNT(*) AS COUNT FROM TBL_MEMBER WHERE ID = 'ujs';
		//           -----------------
		//               수신처리
		
		// ※ DB 구성을 별도로 하지 않았기 때문에 컬렉션 자료구조로 대신함.
		ArrayList<String> db = new ArrayList<String>();
		db.add("superman");
		db.add("batman");
		db.add("admin");
		
		int result = 0;
		
		for (String item : db)
		{
			if (item.equals(id))
			{
				result = 1;
			}
		}
		
		// 				최종 result에 1이 있으면 → 이미 존재하는 id
		// 	1로 바뀌지 않고 0이 계속 남아 있으면 → 존재하지 않는 id  (사용 가능)
		
		// 이 값을 돌려주기 위해 조각 데이터를 View 에 넘긴다.
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03OK.jsp");
		dispatcher.forward(request, response);
	}
	
}
