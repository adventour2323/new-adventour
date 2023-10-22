<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.servlet.http.Cookie" %>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
String loginType = null; // 가이드용 또는 회원용 로그인 유형을 저장할 변수

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour", "root", "qhdks12!@");
    String sql = "select count(*) as cnt from guide where g_id=? and g_pw=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, pw);
    rs = pstmt.executeQuery();
    rs.next();
    if (rs.getString("cnt").equals("1")) {
        session.setAttribute("id", id);
        loginType = "guide";
    }
} catch (Exception e) {
    e.printStackTrace();
}

if (loginType == null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour", "root", "qhdks12!@");
        String sql = "select count(*) as cnt from member where m_id=? and m_pw=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        rs.next();
        if (rs.getString("cnt").equals("1")) {
            session.setAttribute("id", id);
            loginType = "member";

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

if (loginType != null) {
    // 로그인 성공
    if (loginType.equals("guide")) {
        // 가이드로 로그인한 경우
        session.setAttribute("id", id);
        response.sendRedirect("index_login_ing.jsp");
    } else if (loginType.equals("member")) {
        // 회원으로 로그인한 경우
        session.setAttribute("id", id);
        response.sendRedirect("index_login_ing.jsp");
    }
} else {
    // 로그인 실패
%>
    <script>
        alert("로그인 실패");
        location.href = "login_merge_form.jsp";
    </script>
<%
}
%>
