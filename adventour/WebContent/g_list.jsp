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
        
      <div class="content" style="padding: 100px;  border: solid; " > <!-- body 전체  -->
      
<div style="display: flex; "> <!-- 표 묶음  -->
      
      <div style="margin-left: auto; margin-right: auto; "> <!-- 국가  -->
      <table style="border: none;">
      <thead>
      	<tr>
      <th>국가</th>
    	</tr>
      </thead>
      
      <tbody>
      
      <tr>
      <td>
      <label>
      <input type="checkbox" name="영국"> 영국
      </label>
      </td>
      </tr>
      
      <tr>
      <td>
      <label>
      <input type="checkbox" name="프랑스"> 프랑스
      </label>
      </td>
      </tr>
      
      <tr>
      <td>
      <label>
      <input type="checkbox" name="스페인"> 스페인
      </label>
      </td>
      </tr>
      
      <tr>
      <td>
      <label>
      <input type="checkbox" name="이탈리아"> 이탈리아
      </label>
      </td>
      </tr>
      </tbody>
      
      </table>
      </div>
      
      <div style="margin-left: auto; margin-right: auto; margin-bottom: 20px; "> <!-- 도시  -->
      <table>
      <thead>
      <tr>
      <th style="text-align: center;" colspan="4"> <h3>도시</h3> </th>
      </tr>
      </thead>
      
      <tbody>
      <tr style="text-align: center;">
      <td>
      <label>
      	영국
      </label>
      </td>
      <td>
      <label>
      	프랑스
      </label>
      </td>
      <td>
      <label>
      	스페인
      </label>
      </td> 
      <td>
      <label>
      	이탈리아
      </label>
      </td>           
      </tr>
      
      <tr> <!-- 1열 -->
      
      <td>
      <label>
      <input type="checkbox" name="런던"> 런던
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="파리"> 파리
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="마드리드"> 마드리드
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="로마"> 로마
      </label>
      </td>
      
      </tr>
      
      <tr> <!-- 2열  -->
      
      <td>
      <label>
      <input type="checkbox" name="리버풀"> 리버풀
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="마르세유">마르세유
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="바르셀로나">바르셀로나
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="베네치아">베네치아
      </label>
      </td>
      
      </tr>
      
      <tr> <!-- 3열 -->
      
      <td>
      <label>
      <input type="checkbox" name="에든버러">에든버러
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="런던">모나코
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="세비야">세비야
      </label>
      </td>
      
      <td>
      <label>
      <input type="checkbox" name="밀라노">밀라노
      </label>
      </td>
      
      </tr>
      
      </tbody>
      
      
      </table>
      
      </div>
      
      
      </div> <!-- 표 묶음  -->
      
      
        <div style="text-align: center; border: solid; margin-right: auto; margin-left: auto;">
		<h1 style='text-align: center; margin-bottom: 30px;'>가이드 리스트</h1>
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