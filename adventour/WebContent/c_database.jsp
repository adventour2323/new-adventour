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
    request.setCharacterEncoding("UTF-8"); 
    String m_id = request.getParameter("c_writer"); 
    String country = request.getParameter("c_country");
    String city = request.getParameter("c_city");
    String c_title = request.getParameter("c_title");
    String c_cont = request.getParameter("c_con");
    String c_pho1 = request.getParameter("c_pho1");
    String c_pho2 = request.getParameter("c_pho2");
    String c_pho3 = request.getParameter("c_pho3");
    String c_pho4 = request.getParameter("c_pho4");
    String c_pho5 = request.getParameter("c_pho5");
    
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