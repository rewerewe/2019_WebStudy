package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
   private static Connection dbConn;
   
   // DB 계정 정보 입력 - 드라이버 연결 
   public static Connection getConnection()
   {
      try
      {
         if (dbConn==null)
         {
            String url= "jdbc:oracle:thin:@localhost:1521:xe";
            String user = "scott";
            String pwd = "tiger";
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            dbConn = DriverManager.getConnection(url, user, pwd);
            
         }
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return dbConn;
   }
   
   // DB 드라이버로 연결 
   public static Connection getConnection(String url, String user, String pwd)
   {
      if(dbConn == null)
      {
         try
         {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            dbConn = DriverManager.getConnection(url, user, pwd);
            
         } catch (Exception e)
         {
            System.out.println(e.toString());
         }
      }
      return dbConn;
   }
   
   // DB 연결 종료 
   public static void close()
   {
      if (dbConn != null)
      {
         try
         {
            if(!dbConn.isClosed())
               dbConn.close();
            
         } catch (Exception e)
         {
            System.out.println(e.toString());
         }
      }
      
      dbConn = null;
   }
}