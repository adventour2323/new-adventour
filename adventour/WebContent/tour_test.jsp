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

ArrayList<g_getset> a1 = id.g1();


%>
		

		
  
  <div style="display: flex; text-align: center;">
		<% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("스페인") == true) { 
		%>
		  <div class="container" style=" margin-left: 5px; ">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  
					  <img src=" <%= g.getImg() %> " width='200px' alt='img'>

					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        
        <tbody >
            <tr>
                <td>
               
                <%=g.getName()%>
               
                </td>
              
                
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% }} %>
  </div>
  
  <!--  -->
  <div style="display: flex; text-align: center;">
		<% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("영국") == true) { 
		%>
		  <div class="container" style=" margin-left: 5px; ">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  
					  <img src=" <%= g.getImg() %> " width='200px' alt='img'>

					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        
        <tbody >
            <tr>
                <td>
                <%=g.getName()%>
                </td>
               
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% }} %>
  </div>
  
  <!--  -->
  <div style="display: flex; text-align: center;">
		<% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("프랑스") == true) { 
		%>
		  <div class="container" style=" margin-left: 5px; ">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  
					  <img src=" <%= g.getImg() %> " width='200px' alt='img'>

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
                <td>
               
                <%=g.getName()%>
               
                </td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% }} %>
  </div>
  
  <!--  -->
  <div style="display: flex; text-align: center;">
		<% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("이탈리아") == true) { 
		%>
		  <div class="container" style=" margin-left: 5px; ">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  
					  <img src=" <%= g.getImg() %> " width='200px' alt='img'>

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
                <td>
               
                <%=g.getName()%>
               
                </td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getTheme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% }} %>
  </div>
  
  
  

</jsp:useBean>


</body>
</html>