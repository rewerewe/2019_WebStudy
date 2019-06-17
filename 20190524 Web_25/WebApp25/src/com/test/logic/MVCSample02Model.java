/*=================================================
  	MVCSample02Model.java
  	- Model 역할을 수행할 클래스 (서블릿 아닌 자바)
 =================================================*/
package com.test.logic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCSample02Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response)
	{ 
		String result = "";
				
		List<String> lists = new ArrayList<String>();
		
		for (int i=1; i<=100; i++)
			lists.add(String.valueOf(i));
		
		request.setAttribute("lists", lists);
		
		// 뷰의 경로를 반환할 result
		result = "WEB-INF/view/MVCSample02.jsp";
			
		return result;
	}
}
