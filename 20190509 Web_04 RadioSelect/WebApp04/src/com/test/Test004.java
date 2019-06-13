/*====================
  	Test004.java
  	- Servlet 실습
 =====================*/

// 현재... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 → Servlet


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// 1) 상속 받음. servlet이 가진 class를 재정의 해서 써야 함. 
// 2) servlet이 가져야 하는 요건 중 하나는 객체 직렬화. 
// 3) 일반적으로는 http:// 상속받아 servlet을 생성하는 방법을 쓴다.
public class Test004 extends GenericServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		
		try
		{
			PrintWriter out = response.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.html");
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
			out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("<hr>");
			out.print("</div>");
			out.print("</body>");
			out.print("</html>");
			
					
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

		
	
	
	
	
}
