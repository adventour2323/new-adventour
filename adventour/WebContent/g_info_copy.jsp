<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "adventour.t_getset" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>guide information</title>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
</head>
<style>
   /* tab 색상 유지 */
     .movet {
    background-color: rgb(20, 3, 78); /* 배경색을 원하는 색상으로 설정 */
    color: white!important; /* 글자색을 원하는 색상으로 설정 */
}

</style>

 
<body>

		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<div id="header"></div>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>

<!--  -->

      <div class="content">
       		<jsp:useBean id="id" class="adventour.g_list_print">
       		<%	
			String g_id = request.getParameter("g_id");
       		
       		ArrayList<g_getset> a1 = id.g2(g_id);
       		ArrayList<t_getset> a2 = id.t2(g_id);
			
			for(g_getset info : a1) {
				
			%>
       		
       		
        <div style="text-align: center; margin-right: auto; margin-left: auto; width: 700px;">
            <table style="width: 700px" >
                <tbody>
                <tr align="center">
                  <td rowspan="11" style="width: 200px"><img src="<%=info.getImg()%>" style="height: 200px; width: 200px; border: solid;"></td>
                  <td>이름</td>
                  <td><%= info.getName()%></td>
                </tr>

                <tr align="center">
					<th>성별</th>
					<td><%=info.getGender()%></td>
				</tr>
				
				<tr align="center">
					<th>출생년도</th>
					<td><%=info.getYear()%>년</td>
				</tr>
						
          	
                <tr align="center">
                  <td>가이드 지역</td>
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
                <!--  -->
                
               <tr align="center">		
					<th style="border: none;">모집 중인 투어</th>
					<td>
							<% 
							for ( int i = 0; i < a2.size(); i++ ) {
								t_getset tn = a2.get(i);
							%>
					<a href="./tour.html">
						<%=tn.getT_name()%> </a><br> <% } %>
					</td>
				</tr>
				
				<tr align="center">
					<th>자기소개</th>
					<td><%=info.getG_introduce()%></td>
				</tr>		
                 
                <!--  -->
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