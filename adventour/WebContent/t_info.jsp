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
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>
			<jsp:useBean id="id" class="adventour.g_list_print">
			
		
	<div class="content"> <!-- 전체 content -->

		<div class="top_area" style="display: flex;">
			<div class="top_left" style="margin-right: 30px;">
				<div class="t_img_div">
					<img alt="img1" src="./image/tour/murano_tour.jpg" width="500px" height="500px">
					<!-- <img alt="img2" src="" width="500px" height="500px"> 
					<img alt="img3" src="" width="500px" height="500px"> -->
				</div>
				<div class="t_name">
					<h2>투어 이름</h2>
				</div>
			</div> <!-- top_left -->
			
			<div class="option_div" style="border-style: solid;">
				<div class="date_select" style="display: flex; ">
					<label><h5>날짜</h5></label>
					<input type="date" id="start" name="trip-start" value="2023-10-11" min="2023-01-01" max="2024-12-31" />
				</div>
				
				<div class="t_price" style="display: flex; ">
					<label><h5>가격</h5></label>
					<label>10000원</label>
				</div>
				<div>
				<img alt="찜하기" src="">
				<button>구매하기</button>
				</div>
			</div> <!-- option_div -->
			
		</div> <!-- top_area -->
		
		<hr>
		
		<div class="bottom_area" >
			
			<div class="meeting_div" >
				<div class="map_div" style="height: 230px; width: 700px; border-style: dotted;">
					지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도 지도  
				</div>
				<div style=" display: flex;">
					<div class="meeting_spot" style="margin-right: 30px;">
					<label>집합 장소 : </label>
						역 앞
					</div>
					<div class="meeting_time">
					<label>집합 시간: </label>
						10:00
					</div>
				</div>
			</div>
			<div>
			여행 정보 <br>
			주요 방문 장소
			
			</div>
		
		
		
		</div> <!-- bottom_area -->
		
		<div>
			<input type="text"> 
		</div>




	</div> <!-- 전체 content -->
	</jsp:useBean>
</body>
		<footer>
			<!-- <div id="footer"></div> -->
			<jsp:include page="footer.html"></jsp:include>
		</footer>

</html>