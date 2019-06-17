/*===================
 	Test.java
 ====================*/

package com.test.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화 할때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다. 
		ServletConfig config = getServletConfig();
		
		// 『web.xml 』에 『<context-param>』 추가후 
		ServletContext context = getServletContext();		//--CHECK-!!!
		
		  String name = config.getInitParameter("name"); 
		  String age = config.getInitParameter("age");
		 
		 
		/* 이렇게 값을 넣을 수는 없다. 
		 * String name = "홍길동"; String age = "19";
		 */
		  
		// 『web.xml 』에 『<context-param>』 추가후
		String type = context.getInitParameter("type");		//--CHECK-!!!   
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "<h1>");
		pw.println("<h1>age : " + age + "<h1>");
		
		// 『web.xml 』에 『<context-param>』 추가후
		pw.println("<h1>type : " + type + "<h1>");
		
		pw.println("</body></html>");		//--CHECK-!!! 
	}
}
