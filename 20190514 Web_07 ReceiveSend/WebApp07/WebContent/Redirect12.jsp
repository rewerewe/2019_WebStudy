<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp

	int num1 = Integer.parseInt(request.getParameter("su1"));
	int num2 = Integer.parseInt(request.getParameter("su2"));
 	String calResult = request.getParameter("yon");
	
	String result ="";
	
	if(calResult.equals("1"))
		result = String.format("%d + %d = %d",num1,num2,(num1+num2));
	if(calResult.equals("2"))
		result = String.format("%d - %d = %d",num1,num2,(num1-num2));
	if(calResult.equals("3"))
		result = String.format("%d * %d = %d",num1,num2,(num1*num2));
	if(calResult.equals("4"))
		result = String.format("%d / %d = %d",num1,num2,(num1/(double)num2));
	
	request.setAttribute("resultStr",result); 
	
	
	//check~!!!
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive12.jsp");
	dispatcher.forward(request, response);
	
	/* -------------------------------------------------------------------------------------
	■■■ 『RequestDispatcher』인터페이스  ■■■ 
	
	※ 이 인터페이스는 『forward()』와 『include()』만 있다.
	
	※ 처리 과정 및 개념
	
	   일반적으로 HttpServlet 을 상속받는 클래스... 서블릿
	   
	   이렇게 작성된 클래스 내부에는
	   실제 요청을 서비스 하는 『doGet()』『doPost()』메소드가 
	   정의되어 있으며 (service()메소드가 상위 메소드)
	   
	   ServletContainer는 『HttpServlet』의 인스턴스를 생성하고
	   『init()』메소드를 실행해 주고
	   이 메소드에 의해 매핑된 URL에 (페이지 요청 방식에 따라)
	   『doGet()』『doPost()』 중 메소드를 호출해주고(실행시켜주고)
	   Container가 종료될 때 『destroy()』메쇼ㅗ드를 호출해 주고
	   관련된 처리 과정이 마무리 된다.
	   
	   즉 ServletContainer 가
	   init() → 처음
	   service() → 중간 중간 요청 있을 때 마다
	   destroy()  → 마지막
	   메소드를 호출한다
	    (절대 우리가 직접 호출하는 것이 아님~!!!)
	   
	   결국 『HttpServlet』은
	   하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.
	   (리소스를 여러명이 공유하여 사용)
	   
	   이렇게 구성되는 HttpServlet의 상속된 클래스의 인스턴스는
	   스레드에 안전하게 설계(스레드 세이프티)되어야 하고
	   따라서 스레드에 안전하게 설계하지 않은 경우
	   상위 클래스를 마구 접근하게 되어 에러가 발생할 수 밖에 없다.
	   (리소스를 공유하고 있기 때문에 접근이 많음. 충돌 발생)
	   
	   이와 같은 이유로 환경 설정이나 J2EE 서비스에 관한 내용은
	   『ServletContainer』에서 할 수 있게 된다. 
	   ( ※ ServletContext
			   : 서블릿에 대한 환경, 상태 등을 설정할 수 있는 객체)
	   이 『ServletContext 』는 『getServletContext 』로만 받을 수 있다.
	   
	   그렇기 때문에 『getServletContext 』는 
	   동기화가 제대로 구현되어 있을 것이라고 예측할수 있다.
	   
	   그 이유는 멀티 스레드에 안전하게 설계(세이프티) 되어 있어야
	   우리가 『ServletContext 』의 『setAttribute()』나
	   『getAttribute()』를 스레드 걱정 없이 마음대로
	   읽고 쓸수 있기 때문이다.
	   ( Attribute를 set하는 사람이 많아지면 충돌발생할 수 있음. 
			         → set 하는 내용이 달라짐(많아짐)
			         이 문제를 멀티 스레드 세이프로 해결.  )
	   
	   『ServletContext 』의 또 다른 커다란 기능중 하나는
	   다른 서블릿 인스턴스를 가져올 수 있다거나
	   서블릿 환경 설정값을 가져올 수 있는 기능이다.
	   (서블릿콘텍스트의 커다란 기능 중 하나는 환경설정, 
			             다른 서블릿 인스턴스를 가져올 수 있다는건 큰 장점
			             = RequestDispatcher 가 하는 거임 )
	   
	   『RequestDispatcher』역시 그 기능 중의 하나이다.
	   사전적인 의미로는... 요청을 제공하는 도구
	   즉, 요청을 보내주는 인터페이스이다.
	   
	   현재... 요청을 다른 서블릿(혹은 JSP)으로 보내어야 하는 상황
	   (JSP 는 결국 서블릿으로 변환됨)
	   그런데 위에 언급한 바와 같이 서블릿의 인스턴스 하나만 생성되고
	   이것이 멀티 스레딩으로 돌아가고 있다.
	   
	   그렇기 때문에 새로운 서블릿을
	   그 서블릿을 실행하는 것만으로는 안되고
	   이미 돌아가고 있는 서블릿 인스턴스의 스레드를 하나 더 추가해야 한다.
	   ( ※ 인스턴스 - 스레드 - 멀티스레드 의 개념 정리해 해둘 것 )
	   
	   CGI 방식 - 한글문서를 열때마다 한글프로그램이 실행되면 비효율적, 과부하에 걸린다. 
	              하나 프로그램 - 여러 인스턴스 로 사용한다. 
	              Enterprise 방식 이라 다루지 않을 뿐. 모듈에 따라 사용한다. 
	              (매장된 기술 아님)
	   그리고 이것은 서블릿 개발자가 처리해야할 영역을 벗어났기 때문에
	   이 일은 『Dispatcher』가 대신 수행해 준다는 것이다.
	   
	   하지만 이 『Dispatcher』는
	   『HttpServletRequest』『HttpServletResponse』를
	   생성해 줄 수는 없다.
	   그렇기 때문에 『Dispatcher』가 생성해준 새로운 서블릿 스레드를
	   실행시키기 위해 『doGet()』이나『doPost()』를 호출해야한다.
		
	   
	   이와같은 이유로
	   『dispatcher.forward(request,response);』구문을 통해
	   request 와 response를 넘겨주는 것이다. 
	    
	-----------------------------------------------------------------------------------------*/
%>
