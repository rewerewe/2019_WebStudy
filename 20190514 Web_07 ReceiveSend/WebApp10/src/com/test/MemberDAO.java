/*=========================================
 	MemberDTO.java
 	- 데이터베이스 액션 처리 전용 객체 활용
 =========================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 → 생성자 형태로 정의
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				   + " VALUES(MEMBERSEQ.NEXTVAL, ? , ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 리스트 전체 출력 메소드 정의
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// MemberDTO 를 받을 수 있는 자료형으로...
		
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		return result;
	}
	
	// 인원 수 확인을 위한 메소드 정의
	public int count() throws SQLException
	{
		int result=0;
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) FROM TBL_MEMBER";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			result = rs.getInt("COUNT(*)");
		}
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close()
	{
		DBConn.close();
	}

}

