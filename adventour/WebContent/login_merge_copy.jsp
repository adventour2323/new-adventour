<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 결과</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String userType = ""; // 가이드 또는 회원 사용자 유형을 저장할 변수

        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
  //          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour", "root", "qhdks12!@");
             conn = DriverManager.getConnection("jdbc:mysql://15.164.100.232:3306/adventour", "adventour2323", "0521");

            String sql = "SELECT COUNT(*) AS cnt FROM guide WHERE g_id = ? AND g_pw = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt("cnt") == 1) {
                userType = "guide"; // 가이드 사용자
            } else {
                sql = "SELECT COUNT(*) AS cnt FROM member WHERE m_id = ? AND m_pw = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, pw);
                rs = pstmt.executeQuery();

                if (rs.next() && rs.getInt("cnt") == 1) {
                    userType = "member"; // 회원 사용자
                }
            }

            if (!userType.isEmpty()) {
                session.setAttribute("id", id);
                session.setAttribute("pw", pw);
    %>
                <script>
                    history.back();
                </script>
    <%
            } else {
    %>
                <script>
                    alert("로그인 실패");
                  location.href = "login_merge_form.jsp";
                </script>
    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
