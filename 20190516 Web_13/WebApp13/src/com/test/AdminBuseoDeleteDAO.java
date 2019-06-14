package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class AdminBuseoDeleteDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		
		return conn;
		
	}
	
	
	// 부서 목록 출력 메소드
	public ArrayList<DeptDTO> lists() throws SQLException
	{
		ArrayList<DeptDTO> result = new ArrayList<DeptDTO>();
		
		String sql = "SELECT DNAME FROM DEPT WHERE NOT DNAME IS NULL";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			DeptDTO dto = new DeptDTO();
			dto.setDname(rs.getString("DNAME"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
}
