package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class SalgradeDAO
{
	Connection conn;
   

   
   //데이터베이스 연결 담당 메소드
   
   public Connection connection()
   {
      conn = DBConn.getConnection();
      return conn;
   }
   
   
   //급여 등급 추가 
   public int add(SalgradeDTO dto) throws SQLException
   {
      int result = 0;
      
      String sql = "INSERT INTO SALGRADE VALUES(?, ?, ?)";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, dto.getGrade());
      pstmt.setInt(2, dto.getLosal());
      pstmt.setInt(3, dto.getHisal());
      
      result = pstmt.executeUpdate();
      
      pstmt.close();
      return result;
   }
   
   public int grSearch(String grade) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM SALGRADE WHERE GRADE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, grade);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();
		
		return result;
	}   
   
   
   
   //회원 등급 리스트 출력 담당 메소드
   public ArrayList<SalgradeDTO> lists() throws SQLException
   {
      ArrayList<SalgradeDTO> result = new ArrayList<SalgradeDTO>();
      
      String sql ="SELECT GRADE, LOSAL, HISAL FROM SALGRADE ORDER BY GRADE";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      
      
      while(rs.next())
      {
         SalgradeDTO dto = new SalgradeDTO();
         
         dto.setGrade(rs.getString("GRADE"));
         dto.setLosal(rs.getInt("LOSAL"));
         dto.setHisal(rs.getInt("HISAL"));
         
         result.add(dto);
      }
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   
   
   
   // 급여등급  검색 담당 메소드
   public SalgradeDTO search(String grade) throws SQLException
   {
	  if(conn==null)
		  connection();
	  
      SalgradeDTO result = new SalgradeDTO();
      
      String sql = "SELECT GRADE, LOSAL, HISAL FROM SALGRADE WHERE GRADE = ?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, grade);
      ResultSet rs = pstmt.executeQuery();
      
      while(rs.next())
      {
         result.setGrade(rs.getString("GRADE"));
         result.setLosal(rs.getInt("LOSAL"));
         result.setHisal(rs.getInt("HISAL"));
      }
      
      rs.close();
      pstmt.close();
      return result;
   }
   // 급여등급 수정 담당 메소드
   public int remove(String grade) throws SQLException
   {
      int result = 0;
      String sql="DELETE FROM SALGRADE WHERE GRADE = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,grade);
      
      result = pstmt.executeUpdate();
      pstmt.close();
      return result;
   }
   
   
   //급여 등급  수정 담당 메소드
   public int modify(SalgradeDTO dto) throws SQLException
   {
      int result = 0;
      String sql="UPDATE SALGRADE SET LOSAL =?, HISAL=?  WHERE GRADE=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, dto.getLosal());
      pstmt.setInt(2, dto.getHisal());
      pstmt.setString(3, dto.getGrade());
      
      result = pstmt.executeUpdate();
      
      pstmt.close();
      return result;
   }
   
   
   //데이터베이스 연결 종료 담당 메소드 정의
   public void close()
   {
      DBConn.close();
   }
   
}