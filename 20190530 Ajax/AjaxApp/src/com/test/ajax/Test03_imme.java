/*=========================
	ServletSample.java
=========================*/

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03_imme extends HttpServlet
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
		String id = request.getParameter("id");
		
		String result = "";
		if (id.equals("superman") || id.equals("batman") || id.equals("admin"))
		{
				result = "중복된 아이디입니다. 다른 아이디를 입력해주세요.";
		}
		else
		{
			result = "유효한 아이디입니다.";
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03OK.jsp");
		dispatcher.forward(request, response);
	}
	
}
