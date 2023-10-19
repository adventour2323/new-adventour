<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

String g_id = request.getParameter("g_id");
String g_pw = request.getParameter("g_pw");
String g_name = request.getParameter("g_name");
String g_nickname = request.getParameter("g_nickname");
String g_country = request.getParameter("g_country");
String g_city = request.getParameter("g_city");
String g_theme = request.getParameter("g_theme");
String g_img = request.getParameter("g_img");
String g_email = request.getParameter("g_email");
String g_emaild = request.getParameter("g_e_maild");
String g_pnum1 = request.getParameter("g_pnum1");
String g_pnum1_1 = request.getParameter("g_pnum1_1");
String g_pnum1_2 = request.getParameter("g_pnum1_2");
String g_birth_y = request.getParameter("g_birth_y");
String g_birth_m = request.getParameter("g_birth_m");
String g_birth_d = request.getParameter("g_birth_d");
String g_gender = request.getParameter("g_gender");
String g_agree1 = request.getParameter("cked_privacy");
String g_agree2 = request.getParameter("cked_slct_agre");

Connection conn = null;
Statement stmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf8", "root", "qhdks12!@");

    if (conn == null) {
        throw new Exception("데이터베이스에 연결할 수 없습니다.");
    }

    stmt = conn.createStatement();

    // SQL 쿼리를 작성하여 데이터베이스에 정보를 삽입합니다.
    String command = "INSERT INTO guide (g_id, g_pw, g_name, g_nickname, g_country, g_city, g_theme, g_img, g_email, g_pnum, g_birth_y, g_birth_m, g_birth_d, g_gender, g_agree1, g_agree2) VALUES " +
        "('" + g_id + "', '" + g_pw + "', '" + g_name + "', '" + g_nickname + "', '" + g_country + "', '" + g_city + "', '" + g_theme + "', '" + g_img + "', '" + g_email + g_emaild +"', '" + g_pnum1 + g_pnum1_1 + g_pnum1_2 + "', '" + g_birth_y + "', '" + g_birth_m + "', '" + g_birth_d + "', '" + g_gender + "', '" + g_agree1 + "', '" + g_agree2 + "')";

    int rowNum = stmt.executeUpdate(command);

    if (rowNum < 1) {
        throw new Exception("데이터를 DB에 입력할 수 없습니다.");
    }
    
    // 회원가입이 성공한 경우 JavaScript로 alert를 띄우고 index.html로 리다이렉트
    out.println("<script>alert('환영합니다! 회원가입을 축하합니다.'); window.location.href='index.html';</script>");
    
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        stmt.close();
    } catch (Exception ignored) {
    }
    try {
        conn.close();
    } catch (Exception ignored) {
    }
}


%>

</body>
</html>
