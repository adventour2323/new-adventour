
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
    <% //html에서 입력 받은 값 가져오기
    request.setCharacterEncoding("UTF-8"); 
    String m_id = request.getParameter("c_writer");  //로그인된 아이디 자동으로 받아와서 보여줘야함
    String country = request.getParameter("c_country"); //선택나라
    String city = request.getParameter("c_city"); //선택도시
    String c_title = request.getParameter("c_title");//제목
    String c_cont = request.getParameter("c_con"); //내용
    String c_pho1 = request.getParameter("c_pho1"); //사진1
    String c_pho2 = request.getParameter("c_pho2");//사진2
    String c_pho3 = request.getParameter("c_pho3");//사진3
    String c_pho4 = request.getParameter("c_pho4");//사진4
    String c_pho5 = request.getParameter("c_pho5");//사진5
    
    if (m_id == null || m_id.isEmpty() || country == null || country.isEmpty() || city == null || city.isEmpty() || c_title == null || c_title.isEmpty() || c_cont == null || c_cont.isEmpty()) {
    	// 입력값 null값, 빈값 검사
        %>
        <script>
            alert("빈칸을 모두 입력하세요");
            window.location.href = "c_savefail.jsp"; // 저장실패 확인용 임시페이지
        </script>
        <%
    } else {
        C_dbsave c_db = new C_dbsave();
        c_db.dbsave(m_id, country, city, c_title, c_cont, c_pho1, c_pho2, c_pho3, c_pho4, c_pho5);
        %>
        <script>
            alert("게시물이 저장되었습니다");
            window.location.href = "c_saveok.jsp"; // 저장성공 ㅇ확인용 임시페이지
        </script>
        <%
    }
    %>

</body>
</html>