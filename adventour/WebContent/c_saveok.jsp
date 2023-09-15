<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="C_database"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시물 저장 후 보여주는 페이지</title>
</head>
<body>
<jsp:useBean id="prac" class="C_database" />
<%
ArrayList<db3_table_0913> obj = prac.db12(); // 값 가져오기 위한 메소드 호출

out.println("<html>");
out.println("<head><title>게시물 저장 </title><head>");
out.println("<body><table  border='1' bordercolor='blue'>");
out.println("<thead><tr>");
out.println("<th>ID</th>");
out.println("</tr></thead>");

for (db3_table_0913 aaa : obj) { // 아이디 필드의 모든 아이디를 출력하기 위해 반복문 사용
    out.println("<tr>");
    out.println("<td><a href='0913_lastselect.jsp?id=" + aaa.getIdd() + "'>" + aaa.getIdd() + "</a></td>");

    out.println("</tr>");
}
out.println("</table></body>");
out.println("</html>");
%>
</body>  
</html>
