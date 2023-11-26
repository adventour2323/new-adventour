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
    // 로그인 확인
    if (session.getAttribute("id") == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        window.location.href = document.referrer;
    </script>
<%
} else {
%>
    <%
 // request attribute에서 폼 데이터 및 파일명을 가져옵니다.
    String t_id = (String) request.getParameter("t_id");
    String m_id = (String) request.getParameter("m_id");

    
/*     System.out.println("투어 아이디" + t_id);
    System.out.println("회원 아이디"+ m_id); */
 
   
        g_list_print t_dbsave = new g_list_print();
        t_dbsave.t_likesave(t_id, m_id);
        %>
        <script>
            alert("찜에 성공 하였습니다.");
            window.history.back(); // 성공 페이지 URL
        </script>
        <%
}
    %>

</body>
</html>