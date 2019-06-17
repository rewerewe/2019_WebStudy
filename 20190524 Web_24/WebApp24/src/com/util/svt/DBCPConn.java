
/*===========================
	DBCPConn.java
 ============================*/

package com.util.svt;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩 - javax.naming.Context
				//--  컨텍스트(Context)를 얻어내기 가장 쉬운 방법은
				//    『javax.naming.InitialContext』클래스의
				//    인스턴스를 생성하는 것이다.
				//    → 『new IntialContext();』 
				Context	ctx = new InitialContext();
				
				// ※ javax.naming.InitialContext 메소드
				//    - bind(String str, Object obj)
				// 		: 서비스 할 객체를 특정 이름으로 등록한다.
				//    - rebind(string str, Object obj)
				// 		: 서비스 할 객체를 특정 이름으로 다시 등록한다.
				//	  - list(String str)
				//      : 특정 이름으로 서비슿는 개체 정보를 반환한다.
				//    - unbinding(String str)
				//		: 등록된 객체를 메모리에서 해제한다.
				//    - Object lookup(String stR)
				//		: 서비스중인 객체 정보를 얻어온다.
				// 객체의 생명주기 관리 = 모든게 Context 에 대한 관리가 된다. 
				
				// 『web.xml』로부터 환경설정을 찾아오겠다는 코딩
				//-- 다른 형태로 변경 불가
				//Context evt = (Context)ctx.lookup("java:/comp/env");
				//                       ----------------- Context 안에있는 변수명. 변경할 수 없다. 
				
				Context evt = (Context)ctx.lookup("java:/comp/env");
	            DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
	            
	            conn = ds.getConnection();
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
		
	}// end getConnection();
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
					conn.close();
			}
			catch (Exception e)
			{ 
				System.out.println(e.toString());
			}
		}
	}
}
