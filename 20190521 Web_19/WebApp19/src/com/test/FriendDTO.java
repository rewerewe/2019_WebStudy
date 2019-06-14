package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name, gender;	//-- 이름, 성별
	private int age;				//-- 나이
	private String[] idealType;		//-- 이상형
	
	//-- 이상형은 여러개의 데이터가 동시에 전달되므로
	//   (다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리한다.
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getGender()
	{
		return gender;
	}
	
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	
	public String[] getIdealType()
	{
		return idealType;
	}
	
	public void setIdealType(String[] idealType)
	{
		this.idealType = idealType;
	}
	
	public int getAge()
	{
		return age;
	}
	
	public void setAge(int age)
	{
		this.age = age;
	}
	
	
	
}
