/*====================
  	Test005.java
  	- Servlet 실습
 =====================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드 
		doGetPost(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	
	}
		
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청이든 post 방식의 요청이든 
		// 모두 처리할 수 있는 사용자 정의 메소드
		
		// 한글 깨짐 방지 처리
		request.setCharacterEncoding("UTF-8");
		
		// getParameter(Test005.java) == name="userId" (Test005.jsp)
		// name으로 설정했기에 request 한걸 response 할 수 있는 것.
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + userId + ", 패스워드 : " + userPwd;
		
		PrintWriter out = response.getWriter();
		
		// ▼ 이 부분을 JSP 에 넘겨 작업하게 한다. 
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("Test005.java");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<h1>");
		out.print("서블릿 관련 실습");
		out.print("</h1>");
		out.print("<hr>");
		out.print("</div>");
		out.print("<div>");
		out.print("<h2>");
		out.print("HttpServlet 클래스를 활용한 서블릿 테스트");
		out.print("</h2>");
		out.print("<p>" + str + "</p>");
		out.print("<p>" + "method : " + request.getMethod() + "</p>");
		out.print("<p>");
		out.print("클라이언트 IP Address : " + request.getRemoteAddr() + "</p>");
		out.print("</p>");
		out.print("<p>" + "URI : " + request.getRequestURI() + "</p>");
		out.print("</div>");
		out.print("</body>");
		out.print("</html>");
	}
	
	
	// 클라이언트 는 서버에 HttpServlet
	// get - post 방식 중 선택할 수 있다. 
	// 장점. get / post 방식을 나눠서 사용할 수 있다. 
}
