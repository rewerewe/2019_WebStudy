package com.test.mvc;

public class MemberDTO
{
	// 주요 속성 변수 선언
	private String id, pw;
	private String name, tel, email;

	// 주요 속성 gettet / settet 구성
	public String getId()
	{
		return id;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public String getPw()
	{
		return pw;
	}
	
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getTel()
	{
		return tel;
	}
	
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	
	
	
}
