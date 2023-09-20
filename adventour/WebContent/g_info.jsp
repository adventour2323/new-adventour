<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>guide information</title>
</head>


<body>

<header>
    	 <jsp:include page="header.html"></jsp:include>
</header>

<!--  -->

      <div class="content">
       		<jsp:useBean id="id" class="adventour.g_list_print">
       		<%	
			String g_id = request.getParameter("g_id");
       		
       		ArrayList<g_getset> a1 = id.g2(g_id);
			
			for(g_getset info : a1) {
				
			%>
       		
       		
        <div style="text-align: center; margin-right: auto; margin-left: auto;">
            <table border="1" width="100%" height="200" bordercolor="orange" cellspacing="5">
                <tbody><tr align="center">
                  <td rowspan="11" style="width: 200px"><img src="<%=info.getImg()%>" style="height: 200px; width: 200px; border: solid;"></td>
                  <td>이름</td>
                   
                  <td><%= info.getName()%></td>
                </tr>
          	
                <tr align="center">
                  <td>지역</td>
                  <td><%= info.getCountry()%>, <%=info.getCity() %></td>
                </tr>
                <tr align="center">
                    <td>테마</td>
                    <td><%= info.getTheme() %></td>
                  </tr>
                
                <tr align="center">
                    <td>연락처</td>
                    <td><%= info.getPnum()%></td>
                </tr>
                <tr align="center">
                    <td>이메일</td>
                    <td><%= info.getEmail()%></td>
                </tr>
                <tr align="center">
                    <td>모집 중인 투어</td>
                    <td><a href="./tour.html">대영박물관 투어(클릭시 이동합니다)</a>
                        <br>
                        <a href="./tour.html">자연사박물관 투어(클릭시 이동합니다)</a>
                    </td>
                </tr>
              </tbody></table>
        </div>
        <div style="height: 400px; border-style: dotted">
       	 	<div style="height: 200px; border-bottom: solid; ">
            별점
	     	</div>
        	<div style="height: 200px; ">
            추천 투어
        	</div>
        </div>
        
        
        <% } %>
        </jsp:useBean>
      </div><!--content-->
	
<!--  -->

<footer>
		<jsp:include page="footer.html"></jsp:include>
</footer>


</body>
</html>