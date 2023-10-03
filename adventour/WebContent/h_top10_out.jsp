<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="getset.H_getset" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>데이터를 출력하는 페이지</title>
</head>
<body>

<% 
    List<H_getset> info_top10 = (List<H_getset>) request.getAttribute("info_top10"); // null값이라 출력 x
    if (info_top10 != null) {
        for (H_getset aaa : info_top10) {
%>
                        
        <%= aaa.getCountry_eng() %>
        <%= aaa.getCountry_ko() %>
        <%= aaa.getCity_eng() %>
        <%= aaa.getCity_ko() %>
        <%= aaa.getH_name_eng() %>
        <%= aaa.getH_name_ko() %>
        <%= aaa.getH_grade() %>
        <%= aaa.getH_addr() %>
        <%= aaa.getH_lat() %>
        <%= aaa.getH_lon() %>
        <%= aaa.getH_pho() %>
        <%= aaa.getH_breakfast() %>
        <%= aaa.getH_pool() %>
        <%= aaa.getH_rooftop() %>
        <%= aaa.getH_tel() %>
                    
<%
    }
} else {
    out.println("null data"); // null값이 들어온 경우 출력되는 데이터
}
%>
<!--  reponse.setRedirect(); //페이지 이동 연결만
RequestDispacher dispacher = request.getRequestDispacher("data_prtint.jsp");
dispacher.forward(request,response);-->
</body>
</html>
