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
    String c_num = request.getParameter("c_num");
    C_dbsave c_db = new C_dbsave();
    %>
        
    <script>
        var confirmed = confirm("게시물을 삭제하시겠습니까?");
        if (confirmed) {
            <% c_db.dbDelete(c_num); %>
            alert("게시물이 삭제되었습니다.");
            window.location.href = "community_list2.jsp";
        } else {
            alert("게시물 삭제가 취소되었습니다.");
            history.back();
        }
    </script>
</body>
</html>