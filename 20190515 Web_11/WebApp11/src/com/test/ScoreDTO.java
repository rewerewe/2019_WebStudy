package com.test;

public class ScoreDTO
{
	private String name;
	private int sid;
	private int kor, eng, mat;
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getSid()
	{
		return sid;
	}
	
	public void setSid(int sid)
	{
		this.sid = sid;
	}
	
	public int getKor()
	{
		return kor;
	}
	
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	
	public int getEng()
	{
		return eng;
	}
	
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	
	public int getMat()
	{
		return mat;
	}
	
	public void setMat(int mat)
	{
		this.mat = mat;
	} 
}
