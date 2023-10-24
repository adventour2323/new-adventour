<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="getset.guide_gs"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:useBean id="id" class="adventour.g_list_print">
			<!--  -->


			<div class="recommend_ticket" style="margin-bottom: 50px;">
				<h3 style="text-align: center;">추천 호텔</h3>
				<!--  -->
				<% ArrayList<H_getset> a3 = id.h1();
				/*  */
					for (int i = 0; i < a3.size(); i++) {
							H_getset h = a3.get(i);
							if (h.getH_pho().equals("h_eurostars.PNG") == true) {
				%>
					<div class="recommend_img">
						<img src="./image/hotel/h_image/<%= h.getH_pho() %>" style="width: 300px; margin-left: 50px;" alt="추천 호텔 1">
					</div>
					<%} %>
					<div class="recommend_img"> 
						<img src="./image/hotel/h_image/" style="width: 300px; margin-left: 30px; margin-bottom: 10px" alt="추천 호텔 2">
					</div>
					<div class="recommend_img">
						<img src="./image/hotel/h_image/" style="width: 300px; margin-left: 30px; margin-bottom: 20px;" alt="추천 호텔 3">
					</div>
					<!--  -->
					
					<!--  -->
					 <% } %> 
			</div>
			
			</jsp:useBean>

</body>
</html>