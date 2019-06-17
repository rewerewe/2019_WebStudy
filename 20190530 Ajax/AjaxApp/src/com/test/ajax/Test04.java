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

public class Test04 extends HttpServlet
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
		request.setCharacterEncoding("UTF-8");
		
		// 동 이름 넘어온 데이터 수신
		String addr = request.getParameter("addr");
		
		// ※ 여기서도 역시 우편번호 데이터베이스가 있다고 가정하고...
		//    대신 직접 ArrayList 구성
		
		ArrayList<ZipCodeDTO> lists = new ArrayList<ZipCodeDTO>();
		
		if (addr.indexOf("서교") > -1)
		{
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 40 (서교동, 서교동다세대주택)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 서교동 396-1 (서교동다세대주택)"));
			lists.add(new ZipCodeDTO("04048", "서울특별시 마포구 독막로7길 34 (서교동, 서교빌딩)"));
			lists.add(new ZipCodeDTO("04048", "서울특별시 마포구 서교동 404-27 (서교빌딩)"));
			lists.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로 116 (서교동, 서교동교회)"));
			lists.add(new ZipCodeDTO("04049", "서울특별시 마포구 서교동 481-3 (서교동교회)"));
			lists.add(new ZipCodeDTO("04002", "서울특별시 마포구 동교로 125 (서교동, 서교CentralTown서교센트럴타운)"));
			lists.add(new ZipCodeDTO("04002", "서울특별시 마포구 서교동 459-7 (서교CentralTown서교센트럴타운)"));
			lists.add(new ZipCodeDTO("04030", "서울특별시 마포구 동교로 144-9 (서교동, 서교빌라)"));
			lists.add(new ZipCodeDTO("04030", "서울특별시 마포구 서교동 463-25 (서교빌라)"));
			
					
		}
		else if (addr.indexOf("역삼") > -1)
		{
			lists.add(new ZipCodeDTO("06252", "서울특별시 강남구 강남대로 324 (역삼동, 역삼디오슈페리움)"));
			lists.add(new ZipCodeDTO("06252", "서울특별시 강남구 역삼동 832-5 (역삼디오슈페리움)"));
			lists.add(new ZipCodeDTO("06242", "서울특별시 강남구 강남대로 342 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06242", "서울특별시 강남구 역삼동 831-18 (역삼빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로 420 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 역삼동 816-1 (역삼빌딩)"));
			lists.add(new ZipCodeDTO("06251", "서울특별시 강남구 강남대로66길 21 (역삼동, 역삼초등학교)"));
			lists.add(new ZipCodeDTO("06251", "서울특별시 강남구 역삼동 833-7 (역삼초등학교)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 강남대로84길 24-10 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 역삼동 827-11 (역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로94길 19 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 역삼동 818-10 (역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06130", "서울특별시 강남구 강남대로94길 57 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06130", "서울특별시 강남구 역삼동 636-16 (역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06133", "서울특별시 강남구 강남대로94길 74 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06133", "서울특별시 강남구 역삼동 647-4 (역삼동빌딩)"));
		}
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04OK.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	
}
