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
height: 1000px;
}

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면의 수직 중앙 정렬을 위해 사용합니다. */
        flex-direction: column; /* 내용을 수직 방향으로 정렬합니다. */

    	margin-top: 130px; /* Header의 높이만큼 여백을 둡니다. */
	    margin-bottom: 100px; /* Footer의 높이만큼 여백을 둡니다. */
	    
}
    .option_div {
    background-color: #f4f4f4; /* 배경색 지정 */
    border: 1px solid #ddd; /* 테두리 스타일 지정 */
    padding: 20px; /* 내부 여백 설정 */
    text-align: left; /* 텍스트 정렬 지정 */
    
    border: 1px solid #ddd; padding: 20px; background-color: #f4f4f4;
}
    /* 이전 버튼에 마우스 커서 스타일 적용 */
a.prev:hover {
    cursor: pointer;
}

/* 다음 버튼에 마우스 커서 스타일 적용 */
a.next:hover {
    cursor: pointer;
}

    .t-info {
    text-align: center; /* 텍스트를 중앙 정렬합니다. */
    margin-top: 20px; /* 필요한 여백을 조절하세요. */
}

 .slideshow-container {
        position: relative;
        max-width: 500px; /* 슬라이드 컨테이너의 최대 너비 조정 */
        margin: auto;
        overflow: hidden;
    }

    .slideshow-img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* 이미지를 컨테이너에 맞게 조절 */
        
    }
    
    .meeting_div{
    margin-right: auto;
    margin-left: auto;
    }
    .map_div{
    margin-right: auto;
    margin-left: auto;
    }
    
    .date_select{
    margin-bottom: 10px;
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
			

	<div class="content" style="margin-left: auto; margin-right: auto;"  > <!-- 전체 content -->
		
		
		<div class="top_area" style="display: flex;">
			<div class="top_left" style="margin-right: 30px;">
			
			<div class="t_img_div">
    <div class="slideshow-container">
        <div class="mySlides fade">
            <img alt="img1" src="<%= g.getT_img1() %>" class="slideshow-img">
        </div>
        <div class="mySlides fade">
            <img alt="img2" src="<%= g.getT_img2() %>" class="slideshow-img">
        </div>
        <div class="mySlides fade">
            <img alt="img3" src="<%= g.getT_img3() %>" class="slideshow-img">
        </div>
        <a class="prev" onclick="plusSlides(-1)" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);">
            <img src="./image/tour/leftbtn.png" alt="이전">
        </a>
        <a class="next" onclick="plusSlides(1)" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
            <img src="./image/tour/rightbtn.png" alt="다음">
        </a>
    </div>
</div> <!-- t_img_div -->
				
				<div class="t_name">
					<h2><%=g.getT_name() %></h2>
				</div>
			</div> <!-- top_left -->
			
			<div class="option_div" style="border-style: solid;">
				<div class="date_select" style="display: flex; ">
					    <label style="margin-right: 10px;"><h5>날짜</h5></label>
					<input type="date" id="start" name="trip-start"  min="2023-01-01" max="2024-12-31" />
				</div>
				
				<div class="t_price" style="display: flex; ">
					    <label style="margin-right: 10px;"><h5>가격</h5></label>
						<label><%= g.getT_price() %> 원</label>
				</div>
				<div>
    				<button style="background-color: red; color: white; padding: 10px 20px; border: none; cursor: pointer;">❤️ 좋아요</button>
    				<button style="background-color: green; color: white; padding: 10px 20px; border: none; cursor: pointer;">구매하기</button>
				</div>

			</div> <!-- option_div -->
		
		
		</div> <!-- top_area -->
		
		
		<hr>
		<div class="bottom_area" style="margin-top: 20px;">
			
			<div class="meeting_div" >
				<div class="map_div" id="map_div" style="height: 230px; width: 700px; ">
					<!--지도 -->
				</div>
				<div class="meeting-info" style=" display: flex; margin-top: 20px; ">
					
					<div class="meeting_spot" style="margin-right: 30px; margin-left: auto; ">
							<label><img alt="" src="./image/tour/spot.png"> <strong>집합 장소</strong> </label>
						<div style="margin-left: 20px;"><%=g.getM_spot() %></div>
					</div>
					
					<div class="meeting_time" style=" margin-right: auto;">
						<label><img alt="" src="./image/tour/time.png"><strong>집합 시간</strong> </label>
						<div style="margin-left: 20px;"><%=g.getD_time() %></div>
					</div>
				</div> <!-- meeting-info -->
			</div>
			
			<div class="t-info" style="margin-top: 20px;">
				<div >
					<h3>여행 정보</h3>
				</div>
				
				<div >
					주요 방문 장소
					<div>
						<%= g.getT_spot1() %>, <%= g.getT_spot2() %>, <%= g.getT_spot3() %>
					</div>
				</div>
					
				<div >
					여행 소개
					<div>
						<%= g.getT_info() %>
					</div>
				</div>
			
			</div> <!-- t-info -->
		
		</div> <!-- bottom_area -->
		
		<hr>
		
		<div class="rating-div" style="margin-bottom: 30px;">
		
			    <div id="stars">
        			<span class="star" data-rating="1">☆</span>
        			<span class="star" data-rating="2">☆</span>
        			<span class="star" data-rating="3">☆</span>
        			<span class="star" data-rating="4">☆</span>
        			<span class="star" data-rating="5">☆</span>
    			</div>
    			
		
		
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

<script> /* slide effect 	 */
	var slideIndex = 1;
		showSlides(slideIndex);

	function plusSlides(n) {
    	showSlides(slideIndex += n);
	}

	function showSlides(n) {
    	var i;
    	var slides = document.getElementsByClassName("mySlides");
    	if (n > slides.length) { slideIndex = 1 }
    	if (n < 1) { slideIndex = slides.length }
    	for (i = 0; i < slides.length; i++) {
	        slides[i].style.display = "none";
    	}
    	slides[slideIndex - 1].style.display = "block";
	}
</script>

<script>
    // 이미지 슬라이딩 관련 JavaScript 코드 (이전과 다음 슬라이드 이동)
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex - 1].style.display = "block";
    }
</script>

<%} %>
<!--  -->
</jsp:useBean>

<!--  -->

</html>