<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.Mypage_db" %>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <%
 // request attribute에서 폼 데이터 및 파일명을 가져옵니다.
    String m_id = (String) request.getAttribute("m_id");
    
    System.out.println("m_id"+m_id);
    
    Mypage_db m_like_db = new Mypage_db();
    ArrayList<getset.H_getset> m_like_db1 = m_like_db.m_h_like(m_id);
 %>


    
    
    	<div id="like_div">
       <p id="like-title">상품 명</p>
      
      
       <ul id="like_ul">
      
       <%      
   if ( m_like_db1 != null) {
     for (int s = 0; s < m_like_db1.size(); s++) {
         H_getset bbb = m_like_db1.get(s); 
         System.out.println(bbb.getH_name_eng());
    
    
        %>
      
       <li>
       <p id="li_eng"><%= bbb.getH_name_eng()%></p>
       <p id="li_ko"><%= bbb.getH_name_ko()%></p>
       <p id="li_city"><%= bbb.getCountry_ko() %>, <%= bbb.getCity_ko()%></p>  
       <input type="button" id="h_like_del_btn" class="h_like_del_btn" name="h_like_del_btn"value="삭제하기">    
       </li>
       
<%
     }
%>
       </ul><!-- like_ul -->
       
       
<%
     }
%>       
  
     
	
	</div><!--like_div -->
    
    
    
</body>
</html>