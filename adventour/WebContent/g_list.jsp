<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/tour_g_list.css">  
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
        
        <title>가이드 목록</title>
</head>

<style>
table, th, td {
border: none;
}
</style>

<body>

  	<header>
    	 <jsp:include page="header.html"></jsp:include>
	</header>
	<jsp:useBean id="id" class="adventour.g_list_print">
		<%	
			ArrayList<g_getset> a1 = id.g1();
		%>
        
      <div class="content" style="padding: 100px;  border: dotted; " > <!-- body 전체  -->
      

      
      
        <div style="text-align: center; border: solid; margin-right: auto; margin-left: auto;">
		<h1 style='text-align: center; margin-bottom: 30px;'>가이드 리스트</h1>
		<!--  -->
		<div style="display: flex; "> <!-- 표 묶음  -->
      
      <div id="category" class="all_country">
      	전체
      </div>
      <div id="category" class="category_uk">
      	영국
      </div>
      <div id="category" class="category_fr" >
      	프랑스
      </div>
      <div id="category" class="category_es" >
      	스페인
      </div>
      <div id="category" class="category_ita" >
      	이탈리아
      </div>
      
      </div> <!-- 표 묶음  -->
      <!--  -->
		
		<div style="display: flex;  ">
		<% 
		for ( int i = 0; i < 4; i++ ) {
			g_getset g = a1.get(i);
		%>
		  <div class="container" style=" margin-left: auto; margin-right: auto; margin-bottom: 30px;">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <thead>
            <tr>
                <th>이름</th>
                <th>국가</th>
                <th>도시</th>
                <th>테마</th>
            </tr>
        </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
                <td><%=g.getCountry() %></td>
                <td><%=g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% } %>
  </div>
  <div style=" display: flex;">
  		<% 
		for ( int i = 4; i < 8; i++ ) {
			g_getset g = a1.get(i);
		%>
		  <div class="container" style=" margin-left: auto; margin-right: auto; margin-bottom: 30px;">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <thead>
            <tr>
                <th>이름</th>
                <th>국가</th>
                <th>도시</th>
                <th>테마</th>
            </tr>
        </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  <% } %>
  </div>
   
    <div style=" display: flex;">
  		<% 
		for ( int i = 8; i < 12; i++ ) {
			g_getset g = a1.get(i);
		%>
		  <div class="container" style=" margin-left: auto; margin-right: auto; margin-bottom: 30px;">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <thead>
            <tr>
                <th>이름</th>
                <th>국가</th>
                <th>도시</th>
                <th>테마</th>
            </tr>
        </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  <% } %>
  </div>
  <br>
    <div style=" display: flex;">
  		<% 
		for ( int i = 12; i < 16; i++ ) {
			g_getset g = a1.get(i);
		%>
		  <div class="container" style=" margin-left: auto; margin-right: auto; margin-bottom: 30px;">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <thead>
            <tr>
                <th>이름</th>
                <th>국가</th>
                <th>도시</th>
                <th>테마</th>
            </tr>
        </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  <% } %>
  </div>
  
		
	
			

			</div>
		</div>
		
</jsp:useBean>
		<footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer>

		</body>
	</html>