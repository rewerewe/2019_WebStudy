package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class EmpMainDAO
{
	private Connection conn;

	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();

		return conn;
	}

	// 리스트 출력 메소드
	public ArrayList<EmpDTO> lists() throws SQLException
	{
		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();

		String sql = "SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, LOC FROM buseostatusall";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			EmpDTO dto = new EmpDTO();
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setEname(rs.getString("ENAME"));
			dto.setJob(rs.getString("JOB"));
			dto.setMgr(rs.getString("MGR"));
			dto.setHiredate(rs.getString("HIREDATE"));
			dto.setSal(rs.getInt("SAL"));
			dto.setComm(rs.getInt("COMM"));
			dto.setDeptno(rs.getString("LOC"));

			result.add(dto);
		}
		rs.close();
		pstmt.close();

		return result;
	}

	// 메인리스트 전체 출력 메소드

	public ArrayList<EmpDTO> list() throws SQLException
	{

		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();

		/*String sql = "select e1.empno EMPNO, d1.dname DEPTNAME,e1.ename ENAME from emp e1 left join  dept d1 on e1.deptno = d1.depno";*/
		String sql = "select e1.empno EMPNO, d1.dname DEPTNAME,e1.ename ENAME from emp e1 left join  dept d1 on e1.deptno = d1.deptno";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			EmpDTO dto = new EmpDTO();
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setDeptName(rs.getString("DEPTNAME"));
			dto.setEname(rs.getString("ENAME"));
			

			result.add(dto);
		}
		rs.close();
		pstmt.close();

		return result;
	}
	
	//메인리스트 search 출력 메소드 

	public ArrayList<EmpDTO> searchList(String s) throws SQLException
	{

		ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();

		String sql = "select e1.empno EMPNO, d1.dname DEPTNAME,e1.ename ENAME from emp e1 left join  dept d1 on e1.deptno = d1.deptno  where EMPNO like UPPER('%"+s+"%') or d1.dname like UPPER('%"+s+"%') or ENAME like UPPER('%"+s+"%')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			EmpDTO dto = new EmpDTO();
			dto.setEmpno(rs.getString("EMPNO"));
			dto.setDeptName(rs.getString("DEPTNAME"));
			dto.setEname(rs.getString("ENAME"));
			

			result.add(dto);
		}
		rs.close();
		pstmt.close();

		return result;
	}
	
	
	

	// 지역번호 → 지역명 매칭 메소드

	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
