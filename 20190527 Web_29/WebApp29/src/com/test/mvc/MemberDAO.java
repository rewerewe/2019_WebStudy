package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	public MemberDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 insert 메소드 정의
	public int add(MemberDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = "";
		
		try
		{
			sql = "INSERT INTO TBL_MEMBERLIST VALUES (?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		}
		catch (Exception e)
		{
			System.out.print(e.toString());
		}
		
		return result;
	}
	
	// 데이터 Select (조회) 메소드 정의 
	public List<MemberDTO> lists()
	{
		List<MemberDTO> result = new ArrayList<MemberDTO>();		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try 
		{
			sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("ID"));
				dto.setPw(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setTel(rs.getString("TEL"));
				dto.setEmail(rs.getString("EMAIL"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
		}
		catch (Exception e)
		{
			System.out.print(e.toString());
		}
		return result;
	}
	
	public void close()
	{
		DBConn.close();
	}
	
}
