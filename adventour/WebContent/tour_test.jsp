<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>test</h1>

<jsp:useBean id="id" class="adventour.g_list_print">

<%

ArrayList<g_getset> a1 = id.g3();

for(g_getset info : a1) {
	
	info.getCity();
	out.println("<br>");
	info.getG_id();
}


%>
		
ttttttttttttttttttttttttttttt

</jsp:useBean>


</body>
</html>