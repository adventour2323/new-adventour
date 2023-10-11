<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
</head>
<script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>

<body>

		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<div id="header"></div>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>
		
		
	<div class="content"> <!-- 전체 content -->

		<div class="top_area">
			<div class="top_left">
				<div class="t_img_div">
					<img alt="img1" src="">
					<img alt="img2" src="">
					<img alt="img3" src="">
				</div>
				
				<div class="t_name">
				투어 이름
				</div>
			
			</div>
			
			<div class="option_div">
				<div class="date_select" style="display: flex;">
					<label><h5>날짜</h5></label>
					<input type="date" id="start" name="trip-start" value="2023-10-11" min="2023-01-01" max="2024-12-31" />
				</div>
				
				<div>
					<label><h5>가격</h5></label>
					<label>10000원</label>
				</div>
			</div>
			
		</div> <!-- top_area -->










	</div> <!-- 전체 content -->
</body>
		<footer>
			<div id="footer"></div>
		</footer>

</html>