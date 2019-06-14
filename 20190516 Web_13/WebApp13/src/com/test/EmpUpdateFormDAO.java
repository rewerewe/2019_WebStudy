package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

public class EmpUpdateFormDAO
{
	private Connection conn;
	
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	
	// 사원 수정 메소드
	public int modify(EmpDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE EMP SET ENAME=?, DEPTNO=? WHERE EMPNO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEname());
		pstmt.setString(2, dto.getDeptno());
		pstmt.setString(3, dto.getEmpno());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
	// 사원 삭제 메소드
	public int delete(String empno) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM EMP WHERE EMPNO = " + empno;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
	
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
