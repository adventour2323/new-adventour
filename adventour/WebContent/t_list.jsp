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

		<%
			for (t_getset info : a1) {
		%>
		<div>

			<div>
				
				
				<table style="height: 200px;">
					<tr>
					<td rowspan="10" style="width: 200px;">
					<img
						src="<%=info.getT_img1()%>" alt='tour 사진'
						style='height: 200px; width: 200px;'>
					</td>
					</tr>
					<tr align='center'>
						<th style='width: 100px;'>이름</th>
						<td><%=info.getT_name()%></td>
					</tr>
					
					<tr align='center'>
						<th>국가</th>
						<td><%=info.getCountry()%></td>
					</tr>
					<tr>
					<th>도시</th>
					<td><%=info.getCity()%></td>
					</tr>
					
					<tr>
					<th>테마</th>
					<td><%=info.getT_theme()%></td>
					</tr>




				</table>
			</div>

		</div>





		<%
			}
		%>



	</jsp:useBean>
	<footer>
		<jsp:include page="footer.html"></jsp:include>
	</footer>

</body>
</html>