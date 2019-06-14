package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class EmpInsertFormDAO
{
	private Connection conn;
	
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	
	// 부서 목록 출력 메소드
	public ArrayList<DeptDTO> buseoLists() throws SQLException
	{
		ArrayList<DeptDTO> result = new ArrayList<DeptDTO>();
			
		String sql = "SELECT DEPTNO, DNAME FROM DEPT WHERE NOT DNAME IS NULL";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next())
		{
			DeptDTO dto = new DeptDTO();
			dto.setDeptno(rs.getString("DEPTNO"));
			dto.setDname(rs.getString("DNAME"));
				
			result.add(dto);
		}
		rs.close();
		pstmt.close();
			
		return result;
	}

	
	// 사원번호 최대값+1 출력 메소드
	public String maxEmpno() throws SQLException
	{
		String result = "";
		String sql = "SELECT MAX(EMPNO)+1 AS EMPNO FROM EMP";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while( rs.next())
		{
			result+=rs.getString("EMPNO");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	 
	// 입력 메소드
	public int add(EmpDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO, MGR) VALUES((SELECT MAX(EMPNO)+1 AS EMPNO FROM EMP), ?, SYSDATE, ?, (SELECT EMPNO FROM EMP WHERE DEPTNO=? AND JOB='MANAGER'))";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getEname());
		pstmt.setString(2, dto.getDeptno());
		pstmt.setString(3, dto.getDeptno());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	

}
