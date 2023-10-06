<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta charset="UTF-8">
<script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
<link rel="stylesheet" type="text/css" href="./css/tour_g_list.css">
<script src="./js/jquery-3.6.0.min.js"></script>

<title>Tour list</title>
</head>


<body>

	<header>
		<jsp:include page="header.html"></jsp:include>
	</header>

 <div style="height: 100%; padding-left: 100px; ">
 
	<jsp:useBean id="id" class="adventour.g_list_print">

		<%
			ArrayList<t_getset> a1 = id.t1();
		%>

		<% for (t_getset g : a1) { %>
		
		<div class="container" style=" margin-left: 50px; margin-right: 30px;margin-top: 50px;  margin-bottom: 30px; float: left; ">
	  
	  <div style="width: 250px; height: 311px;"> <!-- 시작  -->
	  
	  <div style="margin-bottom: 30px;"> <!-- img -->
	  <a href="https://www.naver.com">
	  <img alt="img<%=g.getT_name() %>" src="<%=g.getT_img1()%>" style=" width: 250px; height: 166px; " >
	  </a>
	  </div> <!-- img -->
	  
	  <div style="overflow: hidden; text-overflow: ellipsis; ">
	  <h3>
	  <a href="https://www.naver.com">
	  <%= g.getT_name() %>
	  </a>
	  </h3>
	  
	  </div>
	  
	  <div style="bottom: 0px;"> <!-- price -->
	  ₩ <%= g.getT_price() %>
	  </div>
	  
	  
	  </div>	
	    
	  </div> <!-- 끝 -->
	  
	<% } %>
</jsp:useBean>
</div>

</body>

<footer>
		<jsp:include page="footer.html"></jsp:include>
	</footer>
	



</html>