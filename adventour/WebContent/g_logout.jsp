<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
/* if(session!=null) session.invalidate(); */

if(session!=null) session.removeAttribute("id");
response.sendRedirect("g_login_done.jsp");
%>
</body>
</html>