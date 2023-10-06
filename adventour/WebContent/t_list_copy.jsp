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

	<jsp:useBean id="id" class="adventour.g_list_print">

		<%
			ArrayList<t_getset> a1 = id.t1();
		%>

		<% for (t_getset g : a1) {
		%>
		<div class="container" style=" margin-left: auto; margin-right: auto; margin-bottom: 30px;">
	  <table style="width: 100px; border-style: solid;">
		  <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getT_img1()+"' width='200px' alt='img'>");
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
                <td><%=g.getT_name()%></td>
                <td><%=g.getCountry() %></td>
                <td><%= g.getCity() %></td>
                <td><%=g.getT_theme() %></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
<% } %>



	</jsp:useBean>
	<footer>
		<jsp:include page="footer.html"></jsp:include>
	</footer>

</body>
</html>