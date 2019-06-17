package com.test.Member;

public class MemberDTO
{

	// 주요 속성 선언 
	private String name;
	private String tel;
	private String addr;
	
	
	// 생성자 
	// default 생성자 형태의 사용자 정의 생성자 생성
	public MemberDTO()
	{
		
	}
	
	// 매개변수 3개 받는 사용자 정의 생성자 생성
	public MemberDTO(String name, String tel, String addr)
	{
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}
	
	
	// getter / setter 구성
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
	
	public String getAddr()
	{
		return addr;
	}
	
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	
	
}
