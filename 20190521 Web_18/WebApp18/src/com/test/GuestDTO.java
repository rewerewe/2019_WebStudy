/*
  GuestDTO.java
  - dto 또는 vo 활용 
 */

package com.test;

public class GuestDTO
{
	// 주요 속성 구성
	private String userName;		//-- 작성자
	private String subject;			//-- 게시물 제목
	private String content;			//-- 게시물 내용
	private String created;			//-- 작성일
	// ※ 여기에서 사용하는 변수명(속성명)의 앞 두글자는 소문자로 작성할 것
	//    numScore → getNumScore() / setNumScore()
	//    nScore   → getnScore() / setnScore()
	//    와 같이 setter 가 속성명을 불러오는 과정에서 
	//    인식이 어긋나는 경우가 발생할 수 있기 때문에.
	
    // ※ 여기에서 사용하는 변수명(속성명)은
    //    HTML의 form 태그에서 name 속성으로 지정할 것.
    //    그래야 속성 데이터 수신 및 속성 매핑을
    //    속성 수신을 자동으로 처리해줄 수 있기 때문...
	
	// getter / setter 구성
	public String getUserName()
	{
		return userName;
	}
	
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	
	public String getSubject()
	{
		return subject;
	}
	
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	
	public String getContent()
	{
		return content;
	}
	
	public void setContent(String content)
	{
		this.content = content;
	}
	
	public String getCreated()
	{
		return created;
	}
	
	public void setCreated(String created)
	{
		this.created = created;
	}
	 
	
	
	
}
