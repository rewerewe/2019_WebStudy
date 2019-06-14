/*========================
  	Calc.java
 ========================*/

/*
 * ○ 기본적인 계산기 프로그램에 대한 실습 (세 가지 방법으로 구현)
 *     
 *     1. 첫 번째 방법
 *        『<%@ page import="com.test.Calc" %>』
 *        구문을 통한 자바 객체 연결
 *        그리고 이를 활용한 객체 생성 
 */

package com.test;

public class Calc
{
	private int su1; 		//-- 피연산자 1	(정수 형태)
	private String op;	    //-- 연산자  	(문자열 형태)
	private int su2; 	    //-- 피연산자 2	(정수 형태)

	// 속성이 private 하고, getter/setter 가 생성되어 있어야 JavaBean 을 사용할 수 있다. → 빈 규약
	// private 변수 선언시 앞 두글자는 소문자로 하자는 약속도 있다. 
	// → nUserSelect() 의 getter / setter 는 getnUserSelect() 가 되기 때문. 
	
	// 사용자 정의 생성자 → 정의하지 않음 → default 생성자 자동 삽입
	
	// getter / setter 구성
	public int getSu1()
	{
		return su1;
	}


	public void setSu1(int su1)
	{
		this.su1 = su1;
	}


	public String getOp()
	{
		return op;
	}


	public void setOp(String op)
	{
		this.op = op;
	}


	public int getSu2()
	{
		return su2;
	}


	public void setSu2(int su2)
	{
		this.su2 = su2;
	}


	public String result()
	{
		String result="";
		
		int s = 0;
		if (op != null)
		{
			if (op.equals("+"))
				s = su1 + su2;
			else if (op.equals("-"))
				s = su1 - su2;
			else if (op.equals("*"))
				s = su1 * su2;
			else if (op.equals("/"))
				s = su1 / su2;
			
			result=String.format("%d %s %d = %d", su1, op, su2, s);
					
		}
		
		return result;
	}
}

