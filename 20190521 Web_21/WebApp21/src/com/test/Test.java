package com.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
 
public class Test {
    public static void main(String[] args) throws UnsupportedEncodingException 
    {	
    	// 조회수 up
        String url = "http://211.238.142.161:8090/WebApp21/Article.jsp?num=815";
        
        // <script> var i = 0; while ( i < 2 ){ alert("열지말라니까"); alert("왜 열었니"); i++; } alert("여기까지만 할게 공부하러 가"); location.href=" https://docs.oracle.com/javase/9/docs/api/index.html?overview-summary.html "</script>
        
        // 입력할 제목, 이름, 내용
        String subject = "제목";
        String name = "이름";
        String content = "내용";
        String email = "";
        String pwd = "1111";
        
        
        subject = URLEncoder.encode(subject, "UTF-8");
        content = URLEncoder.encode(content, "UTF-8");
        name = URLEncoder.encode(name, "UTF-8");
        email = URLEncoder.encode(email, "UTF-8");
        pwd = URLEncoder.encode(pwd, "UTF-8");
        
        
        String createUrl = "http://localhost:8090/WebApp21/Created_ok.jsp?name="+name+"&subject="+subject+"&email="+email+"&content="+content+"&pwd="+pwd;

        
        for(int i = 0 ; i < 1 ; i++)
        {
        	System.out.println(i);
        	accessURL(createUrl);
        }
    }
    
    public static void accessURL(String url)
    {
        try 
        {
            URL obj = new URL(url); // 호출할 url 설정
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
 
            con.setRequestMethod("GET");
            //Thread.sleep(200);
            con.getInputStream();

        } catch(Exception e) 
        {
            e.printStackTrace();
        }
    }
}


