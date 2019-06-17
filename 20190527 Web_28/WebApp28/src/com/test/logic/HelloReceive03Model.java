package com.test.logic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String checkName(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		
		// 뷰의 경로를 컨트롤러에 반환할 result
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
}
