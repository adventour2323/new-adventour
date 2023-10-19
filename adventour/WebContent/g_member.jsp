<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>

<%
request.setCharacterEncoding("UTF-8");

String g_id = request.getParameter("g_id");
String g_pw = request.getParameter("g_pw");
String g_name = request.getParameter("g_name");
String g_nickname = request.getParameter("g_nickname");
String g_country = request.getParameter("g_country");
String g_city = request.getParameter("g_city");
String g_theme = request.getParameter("g_theme");
String g_email = request.getParameter("g_email");
String g_emaild = request.getParameter("g_emaild");
String g_pnum1 = request.getParameter("g_pnum1");
String g_pnum1_1 = request.getParameter("g_pnum1_1");
String g_pnum1_2 = request.getParameter("g_pnum1_2");
String g_birth_y = request.getParameter("g_birth_y");
String g_birth_m = request.getParameter("g_birth_m");
String g_birth_d = request.getParameter("g_birth_d");
String g_gender = request.getParameter("g_gender");
String g_agree1 = request.getParameter("cked_privacy");
String g_agree2 = request.getParameter("cked_slct_agre");

String uploadPath = request.getRealPath("/image/tour"); // 이미지 업로드 경로

int size = 10 * 1024 * 1024; // 최대 업로드 파일 크기 (10MB)
String g_img = ""; // 파일명

try {
    MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

    Enumeration files = multi.getFileNames();

    String file1 = (String) files.nextElement();
    g_img = multi.getFilesystemName(file1);

    // 나머지 폼 필드 처리
    g_id = multi.getParameter("g_id");
    g_pw = multi.getParameter("g_pw");
    g_name = multi.getParameter("g_name");
    g_nickname = multi.getParameter("g_nickname");
    g_country = multi.getParameter("g_country");
    g_city = multi.getParameter("g_city");
    g_theme = multi.getParameter("g_theme");
    g_email = multi.getParameter("g_email");
    g_emaild = multi.getParameter("g_emaild");
    g_pnum1 = multi.getParameter("g_pnum1");
    g_pnum1_1 = multi.getParameter("g_pnum1_1");
    g_pnum1_2 = multi.getParameter("g_pnum1_2");
    g_birth_y = multi.getParameter("g_birth_y");
    g_birth_m = multi.getParameter("g_birth_m");
    g_birth_d = multi.getParameter("g_birth_d");
    g_gender = multi.getParameter("g_gender");
    g_agree1 = multi.getParameter("cked_privacy");
    g_agree2 = multi.getParameter("cked_slct_agre");

} catch (Exception e) {
    e.printStackTrace();
}

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
    out.println("<script>alert('환영합니다! 회원가입을 축하합니다.'); window.location.href='index_login_ing.jsp';</script>");
    
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
