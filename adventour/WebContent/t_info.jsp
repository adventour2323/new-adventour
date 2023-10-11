<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
</head>
<script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>


<style>

body{
height: 100%;
}

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면의 수직 중앙 정렬을 위해 사용합니다. */
        flex-direction: column; /* 내용을 수직 방향으로 정렬합니다. */
    }
</style>



<jsp:useBean id="id" class="adventour.g_list_print">
			<%
                String t_id = request.getParameter("t_id");
                
                ArrayList<t_getset> a1 = id.t4(t_id);
            %>
            <% for (t_getset g : a1) { %>
<body>

		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>
			

			
		
	<div class="content" style="margin-left: auto; margin-right: auto;"> <!-- 전체 content -->
		
		
		<div class="top_area" style="display: flex;">
			<div class="top_left" style="margin-right: 30px;">
				<div class="t_img_div">
					<img alt="img1" src="<%= g.getT_img1()  %>" width="500px" height="500px">
					<%-- <img alt="img2" src="<%= g.getT_img2() %>" width="500px" height="500px"> 
					<img alt="img3" src="<%= g.getT_img3() %>" width="500px" height="500px">  --%>
				</div>
				<div class="t_name">
					<h2><%=g.getT_name() %></h2>
				</div>
			</div> <!-- top_left -->
			
			<div class="option_div" style="border-style: solid;">
				<div class="date_select" style="display: flex; ">
					<label><h5>날짜</h5></label>
					<input type="date" id="start" name="trip-start" value="2023-10-11" min="2023-01-01" max="2024-12-31" />
				</div>
				
				<div class="t_price" style="display: flex; ">
					<label><h5>가격</h5></label>
					<label><%= g.getT_price() %></label>
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
				<div class="map_div" id="map_div" style="height: 230px; width: 700px; border-style: dotted;">
					<!--지도 -->
				</div>
				<div style=" display: flex;">
					<div class="meeting_spot" style="margin-right: 30px;">
					<label>집합 장소 : </label>
						<div style="margin-left: 20px;"><%=g.getM_spot() %></div>
					</div>
					<div class="meeting_time">
					<label>집합 시간: </label>
						<div style="margin-left: 20px;"><%=g.getD_time() %></div>
					</div>
				</div>
			</div>
			
			<div>
				<h3>여행 정보</h3>
					<div>
						주요 방문 장소
						<div>
							<%= g.getT_spot1() %>, <%= g.getT_spot2() %>, <%= g.getT_spot3() %>
						</div>
					</div>
					
					<div>
						여행 소개
						<div>
							<%= g.getT_info() %>
						</div>
					</div>
			
			</div>
		
		
		
		</div> <!-- bottom_area -->
		
		<div>
		<form name="rating_comment" action="">
			<input type="text" id="comment">
			<input type="submit" value="등록하기">
		</form>	 
		</div>




	</div> <!-- 전체 content -->
	
</body>
		<footer>
			<!-- <div id="footer"></div> -->
			<jsp:include page="footer.html"></jsp:include>
		</footer>
		
		<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>

<script>
    function initMap() {
        var mapOptions = {
            center: { lat: <%=g.getM_x() %>, lng: <%=g.getM_y() %> },
            zoom: 15
        };
        
        var map = new google.maps.Map(document.getElementById('map_div'), mapOptions);

        // 마커를 추가할 위치의 위도와 경도
        var markerLatLng = { lat: <%=g.getM_x() %>, lng:<%=g.getM_y() %>  };

        // 마커 생성
        var marker = new google.maps.Marker({
            position: markerLatLng,
            map: map,
            title: '집합 장소'
        });
    }
</script>
<script>
    initMap(); // initMap 함수 호출
</script>
<%} %>
<!--  -->
</jsp:useBean>

<!--  -->

</html>