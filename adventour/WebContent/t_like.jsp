<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%
 // request attribute에서 폼 데이터 및 파일명을 가져옵니다.
    String m_id = (String) request.getParameter("m_id");
    String t_id = (String) request.getParameter("t_id");

    
    System.out.println("회원 아이디"+ m_id);
    System.out.println("투어 아이디" + t_id);
 
   
        g_list_print h_dbsave = new g_list_print();
        h_dbsave.t_likesave(m_id, t_id);
        %>
        <script>
            alert("찜에 성공 하였습니다.");
            window.history.back(); // 성공 페이지 URL
        </script>
        <%

    %>

</body>
</html>