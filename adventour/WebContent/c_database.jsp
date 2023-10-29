<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.C_dbsave" %>
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
    String m_id = (String) request.getAttribute("c_writer");
    String country = (String) request.getAttribute("c_country");
    String city = (String) request.getAttribute("c_city");
    String c_title = (String) request.getAttribute("c_title");
    String c_cont = (String) request.getAttribute("c_con");    
    String c_pho1 = (String) request.getAttribute("origfilename1");
    String c_pho2 = (String) request.getAttribute("origfilename2");
    String c_pho3 = (String) request.getAttribute("origfilename3");
    String c_pho4 = (String) request.getAttribute("origfilename4");
    String c_pho5 = (String) request.getAttribute("origfilename5");
    
    System.out.println("아이디"+ m_id);
    System.out.println("나라" + country);
    System.out.println("도시"+ city);
    System.out.println("제목"+ c_title);
    System.out.println("내용"+ c_cont);
    System.out.println("사진"+c_pho1);
    
    if(c_pho1 == null){
    	c_pho1 = "no_p";
    }
    if(c_pho2 == null){
    	c_pho2 = "no_p";
    }
    if(c_pho3 == null){
    	c_pho3 = "no_p";
    }
    if(c_pho4 == null){
    	c_pho4 = "no_p";
    }
    if(c_pho5 == null){
    	c_pho5 = "no_p";
    }

 
    
    if (m_id == null || m_id.isEmpty() || country == null || country.isEmpty() || city == null || city.isEmpty() || c_title == null || c_title.isEmpty() || c_cont == null || c_cont.isEmpty()) {
        %>
        <script>
            alert("모든 필드를 입력해야 합니다.");
            history.back(); // 이전 페이지로 이동
        </script>
        <%
    } else {
        C_dbsave c_db = new C_dbsave();
        c_db.dbsave(m_id, country, city, c_title, c_cont, c_pho1, c_pho2, c_pho3, c_pho4, c_pho5);
        %>
        <script>
            alert("게시물이 저장되었습니다");
            window.location.href = "community_list2.jsp"; // 성공 페이지 URL
        </script>
        <%
    }
    %>
</body>
</html>