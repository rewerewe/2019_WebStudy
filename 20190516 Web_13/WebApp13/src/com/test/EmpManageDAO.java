package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class EmpManageDAO
{

	private Connection conn;

	// 데이터 베이스 연결
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}

   // 담당 매니저 출력
   public String selectManager(String empno) throws SQLException
   {
      String mgr = "";
      
      String sql = "SELECT (SELECT ENAME FROM EMP WHERE EMPNO=E.MGR) MGR FROM EMP E WHERE EMPNO = "+empno;
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      ResultSet rs = pstmt.executeQuery();
      
      while(rs.next())
      {
         mgr+=rs.getString("MGR");
      }
      
      return mgr;
   }
   
	// 직원 정보 등록(INSERT) 메소드
	public int add(EmpDTO emp) throws SQLException
	{
		int result = 0;

		String sql = "UPDATE EMP SET JOB=?, SAL=?, COMM=? WHERE EMPNO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, emp.getJob());
		pstmt.setInt(2, emp.getSal());
		pstmt.setInt(3, emp.getComm());
		pstmt.setString(4, emp.getEmpno());

		result = pstmt.executeUpdate();

		pstmt.close();

		return result;
	}

	// 사원번호로 검색 메소드

	public EmpDTO search(String empno) throws SQLException
	{
		EmpDTO result = new EmpDTO();

		String sql = "SELECT EMPNO, ENAME, JOB, MGR, TO_CHAR(HIREDATE, 'YYYY-MM-DD') HIREDATE, SAL, COMM, DEPTNO FROM EMP WHERE EMPNO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, empno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			result.setEmpno(rs.getString("EMPNO"));
			result.setEname(rs.getString("ENAME"));
			result.setJob(rs.getString("JOB"));
			result.setMgr(rs.getString("MGR"));
			result.setHiredate(rs.getString("HIREDATE"));
			result.setSal(rs.getInt("sal"));
			result.setComm(rs.getInt("COMM"));
			result.setDeptno(rs.getString("DEPTNO"));
		}

		rs.close();
		pstmt.close();

		return result;
	}

	// 본인 제외 해당 부서 직원들 담당 메소드(매니저 선택)

	public ArrayList<EmpDTO> lists() throws SQLException
	{
		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();

		String sql = "SELECT ENAME FROM EMP WHERE DEPTNO=? AND EMPNO!=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		EmpDTO emp = null;

		while (rs.next())
		{
			emp = new EmpDTO();

			emp.setEmpno(rs.getString("EMPNO"));
			emp.setEname(rs.getString("ENAME"));

			result.add(emp);
		}
		rs.close();
		pstmt.close();

		return result;
	}

	// 직원 정보 수정 메소드

	public int modify(EmpDTO emp) throws SQLException
	{
		System.out.println("****");
		int result = 0;
		//String sql = "UPDATE EMP SET ENAME=?, JOB=?, SAL=?, COMM=? WHERE EMPNO=?";
		String sql = "UPDATE EMP SET ENAME=?, JOB=?, SAL=?, COMM=? WHERE EMPNO=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		System.out.println("***");
		pstmt.setString(1, emp.getEname());
		pstmt.setString(2, emp.getJob());
		pstmt.setInt(3, emp.getSal());
		pstmt.setInt(4, emp.getComm());
		pstmt.setString(5, emp.getEmpno());
		System.out.println("**");
		result = pstmt.executeUpdate();

		pstmt.close();
		System.out.println("*");
		return result;
	}

	public void close() throws SQLException
	{
		DBConn.close();
	}

}
