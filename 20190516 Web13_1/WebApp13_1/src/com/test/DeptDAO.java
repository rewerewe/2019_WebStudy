package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class DeptDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터베이스 입력 담당 메소드 
	public int add(DeptDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO DEPT VALUES(DEPTSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getDname());
		pstmt.setString(2, dto.getLoc());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	// 부서 리스트 출력 담당 메소드 
	public ArrayList<DeptDTO> lists() throws SQLException
	{
		ArrayList<DeptDTO> result = new ArrayList<DeptDTO>();
		
		String sql = "SELECT DEPTNO, DNAME, LOC FROM DEPT ORDER BY DEPTNO";
		
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			DeptDTO dto = new DeptDTO(); 
			dto.setDeptno(rs.getString(1));
			dto.setDname(rs.getString(2));
			dto.setLoc(rs.getString(3));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();	
		
		return result;
	}
	
	// 부서정보 검색 담당 메소드 
	public DeptDTO search(String deptno) throws SQLException
	{
		DeptDTO result = new DeptDTO();
		
		String sql = "SELECT DEPTNO, DNAME, LOC FROM DEPT WHERE DEPTNO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, deptno);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setDeptno(rs.getString(1));
			result.setDname(rs.getString(2));
			result.setLoc(rs.getString(3));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 부서정보 수정 담당 메소드
	public int modify(DeptDTO dto) throws SQLException
	{
		int result = 0;		
		
		String sql = String.format("UPDATE DEPT SET DNAME='%s', LOC='%s' WHERE DEPTNO=%s", dto.getDname(), dto.getLoc(), dto.getDeptno());
		
		
		//PreparedStatement pstmt = conn.prepareStatement(sql); 
		
		//pstmt.setString(1, dto.getDname());
		//pstmt.setString(2, dto.getLoc());
		//pstmt.setString(3, dto.getDeptno());
		
		Statement stmt = conn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		
		//result = pstmt.executeUpdate(); 
		
		System.out.println(result);
		
		stmt.close();
		
		return result;
	}
	
	
	// 부서정보 삭제 담당 메소드
	public int remove(String deptno) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM DEPT WHERE DEPTNO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, deptno);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();		
		
		return result;
	}
		
	// 자식테이블의 참조데이터 레코드 수 확인 메소드
	public int refCount(String deptno) throws SQLException
	{
		int result = 0; 
		
		String sql = "SELECT COUNT(*) AS COUNT FROM EMP WHERE DEPTNO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deptno);
		
		ResultSet rs = pstmt.executeQuery(); 
		while (rs.next())
		{
			result = rs.getInt(1); 
		}
		
		rs.close();
		pstmt.close();

		return result; 
	}
	
	// 데이터베이스 연결 종료 메소드 
	public void close()
	{
		DBConn.close();
	}
	
}
