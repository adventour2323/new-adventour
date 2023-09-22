<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<style>
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
width: 80px;
}

td{
border-collapse: collapse;
border-spacing: 0;
}
</style>

</head>

<body>

	<h1>test</h1>

	<jsp:useBean id="id" class="adventour.g_list_print">

		<div>
			<%
				String g_id = request.getParameter("g_id");

					ArrayList<g_getset> a1 = id.g2(g_id);
					ArrayList<t_getset> a2 = id.t2(g_id);

					for (g_getset info : a1) {
			%>
fzz <br>
<div style="border: solid;">
			<div style="text-align: center; margin-right: auto; margin-left: auto;  width: 700px; border: double;">
				<table border="1" style="wied" cellspacing="5">
					<tbody>
						<tr align="center">
							<td rowspan="11" style="width: 200px"><img
								src="<%=info.getImg()%>"
								style="height: 200px; width: 200px; border: solid;"></td>
							<th>이름</th>
							<td><%=info.getName()%></td>
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
							<th >가이드 지역</th>
							<td><%=info.getCountry()%>, <%=info.getCity()%></td>
						</tr>
						<tr align="center">
							<th>테마</th>
							<td><%=info.getTheme()%></td>
						</tr>

						<tr align="center">
							<th>연락처</th>
							<td><%=info.getPnum()%></td>
						</tr>
						<tr align="center">
							<th>이메일</th>
							<td><%=info.getEmail()%></td>
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
						
						
						<% } %>
						<!--  -->
					</tbody>
				</table>
			</div>

		</div>
</div>
	</jsp:useBean>


</body>
</html>