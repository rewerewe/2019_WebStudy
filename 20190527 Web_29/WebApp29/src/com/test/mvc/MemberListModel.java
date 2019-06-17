package com.test.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel
{
	public String searchMember(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		MemberDAO dao = new MemberDAO();	
		
		List<MemberDTO> lists = dao.lists();
		
		request.setAttribute("lists", lists);
		result = "WEB-INF/view/MemberList.jsp";

		dao.close();
		
		return result;
	}
}
