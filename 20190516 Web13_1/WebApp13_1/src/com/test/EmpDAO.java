package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

import oracle.jdbc.proxy.annotation.Pre;

public class EmpDAO
{
	Connection conn;
	
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	public int add(EmpDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO EMP VALUES(EMPSEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//pstmt.setString(1, dto.getEmpno());
		pstmt.setString(1, dto.getEname());
		pstmt.setString(2, dto.getJob());
		pstmt.setString(3, dto.getMgr());
		pstmt.setString(4, dto.getHiredate());
		pstmt.setInt(5, dto.getSal());
		pstmt.setInt(6, dto.getComm());
		pstmt.setString(7, dto.getDeptno());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	public ArrayList<EmpDTO> lists() throws SQLException
	{
		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
		
		String sql = "SELECT EMPNO,ENAME,JOB,MGR,NVL(MGRNAME,' ') AS MGRN,TO_CHAR(HIREDATE,'YYYY-MM-DD') AS HIRED,SAL,COMM,DEPTNO ,DNAME,LOC FROM VIEW_EMPDEPT";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			EmpDTO dto = new EmpDTO();
			
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setEname(rs.getString("ENAME"));
			dto.setJob(rs.getString("JOB"));
			dto.setMgr(rs.getString("MGR"));
			dto.setMgrname(rs.getString("MGRN"));
			dto.setHiredate(rs.getString("HIRED"));
			dto.setSal(rs.getInt("SAL"));
			dto.setComm(rs.getInt("COMM"));
			dto.setDeptno(rs.getString("DEPTNO"));
			dto.setDname(rs.getString("DNAME"));
			dto.setLoc(rs.getString("LOC"));
			
			result.add(dto);			
		}		
		return result;
	}
	
	
	public EmpDTO search(String empno) throws SQLException
	{
		//EmpDTO result = new EmpDTO();
		EmpDTO dto = null;
		
		String sql = "SELECT EMPNO, ENAME, JOB, MGR, MGRNAME, HIREDATE, SAL, COMM, DEPTNO, DNAME, LOC FROM VIEW_EMPDEPT WHERE EMPNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, empno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new EmpDTO();
			
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setEname(rs.getString("ENAME"));
			dto.setJob(rs.getString("JOB"));
			dto.setMgr(rs.getString("MGR"));
			dto.setMgrname(rs.getString("MGRNAME"));
			dto.setHiredate(rs.getString("HIREDATE"));
			dto.setSal(rs.getInt("SAL"));
			dto.setComm(rs.getInt("COMM"));
			dto.setDeptno(rs.getString("DEPTNO"));
			dto.setDname(rs.getString("DNAME"));
			dto.setLoc(rs.getString("LOC"));
			
		}
		
		return dto;
	}
	
	public ArrayList<EmpDTO> salgradeList(String grade) throws SQLException
	{
		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
		SalgradeDAO sdao = new SalgradeDAO();
		
		SalgradeDTO sdto = sdao.search(grade);
		
		String sql = "SELECT EMPNO, ENAME, JOB,COMM ,SAL, DNAME FROM VIEW_EMPDEPT WHERE SAL BETWEEN ? AND ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, sdto.getLosal());
		pstmt.setInt(2, sdto.getHisal());
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			EmpDTO dto = new EmpDTO();
			 
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setEname(rs.getString("ENAME"));
			dto.setJob(rs.getString("JOB"));			
			dto.setSal(rs.getInt("SAL"));
			dto.setComm(rs.getInt("COMM"));			
			dto.setDname(rs.getString("DNAME"));			
			
			result.add(dto);			
		}		
		
		return result;
	}
	
	public int remove(String empno) throws SQLException
	{
		int result = 0;
		
		removeMgr(empno);
		
		String sql = "DELETE FROM EMP WHERE EMPNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, empno);
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	
	  public void removeMgr(String empno) throws SQLException 
	  {
		  String sql = "UPDATE EMP SET MGR=NULL WHERE MGR=?";
		  
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  
		  pstmt.setString(1, empno);
		  
		  pstmt.executeUpdate();
	  }
	 
	
	public int modify(EmpDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE EMP SET ENAME=?, JOB=?, MGR=?, HIREDATE=?, SAL=?, COMM=?, DEPTNO=? WHERE EMPNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getEname());
		pstmt.setString(2, dto.getJob());
		pstmt.setString(3, dto.getMgr());
		pstmt.setString(4, dto.getHiredate());
		pstmt.setInt(5, dto.getSal());
		pstmt.setInt(6, dto.getComm());
		pstmt.setString(7, dto.getDeptno());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	public void close()
	{
		DBConn.close();
	}	
	
	// 추가 메소드 
	// 선택한 부서의 매니저 출력 메소드
	public ArrayList<EmpDTO> mgrSearch(String deptno) throws SQLException
	{
		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
		
		EmpDTO dto = null;
		
		String sql = "SELECT EMPNO, ENAME FROM EMP E WHERE DEPTNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deptno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new EmpDTO();
			
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setEname(rs.getString("ENAME"));
		
			result.add(dto);
		}
		
		return result;
		
	}
}

