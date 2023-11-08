<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg=initMap"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>



<link rel="stylesheet" type="text/css" href="./css/t_info_css.css">

<style>

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
	
		
	<div class="content"> <!-- 전체 content -->
		
		<div class="div-text">
			<strong>	
				<a href="main.tour?tour=main">투어</a> > 
				<a href="main.tour?tour=tourlist">투어 리스트</a> > 
				<a href="t_list_country.jsp?country_eng=<%=g.getCountry_eng()%>&country=<%=g.getCountry() %>"><%=g.getCountry() %></a> > 
				<a href="t_info.jsp?t_id=<%=g.getT_id()%>"><%=g.getT_name() %></a> 
			</strong>
		</div>
				
		<div class="top_area" >

			<div class="top_left" >
			
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
        				<a class="prev" onclick="plusSlides(-1)" >
            				<img src="./image/tour/leftbtn.png" alt="이전">
        				</a>
        				<a class="next" onclick="plusSlides(1)" >
	            			<img src="./image/tour/rightbtn.png" alt="다음">
    	    			</a>
    				</div>
				</div> <!-- t_img_div -->
				
				<div class="t_name">
					<h1 class="t_name_text"><%=g.getT_name() %>!</h1>
				</div>
			</div> <!-- top_left -->
			
			<div class="option_div" >
				<label><h5>옵션 선택</h5></label>
					<hr>
				<form id="purchaseForm" action="t_payment.jsp" method="post" onsubmit="return Form();">
					<div class="date_select" style="display: flex; align-items: center;">
    					<label style="margin-right: 10px;"><h5 style="margin: 0;">날짜</h5></label>
    					<div style="display: flex; align-items: center;">
	    					<%
								// 오늘 날짜를 가져오고, yyyy-MM-dd 형식으로 포맷
								Date today = new Date();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String formattedDate = sdf.format(today);
							%>
        					<input type="date" id="trip-start" name="trip-start" value="<%= formattedDate %>" min="<%= formattedDate %>" required>	
    					</div>
					</div>
									
					<div class="t_price_info" style="display: flex; align-items: center;">
    				 	<label style="margin-right: 10px;"><h5 style="margin: 0;">가격</h5></label>
    					<div style="display: flex; align-items: center;">
        					<label style="margin-right: 10px;"><span id="formattedPrice"><%= g.getT_price() %> 원</span></label>
        					<input type="hidden" id="tour_price" name="tour_price" value="<%= g.getT_price() %>">
    					</div>
					</div>
					

				
					<div class="people_num" style="display: flex; align-items: center;">
    					<label style="margin-right: 10px;"><h5 style="margin: 0;">인원</h5></label>
    					<div style="display: flex; align-items: center;">
        					<input type="button" onclick="updateCount(-1)" value="-" style="border: none; cursor: pointer; padding: 5px 10px;">
        					<div id="result" style="margin: 0 10px; font-size: 16px;">1</div>
        					<input type="button" onclick="updateCount(1)" value="+" style="border: none; cursor: pointer; padding: 5px 10px;">
    					</div>
    					<input type="hidden" name="total_people" value="1" id="totalPeopleInput">
					</div>

							<hr style="margin-top: 40px;">
									
					<div class="price_cal" >
    					<label style="margin-right: 10px;"><h5>합계</h5></label>
    					<label style="margin-right: 10px;"><strong id="totalPrice" style="color: red;"><%= g.getT_price() %></strong><strong> 원</strong></label>
    					 <input type="hidden" id="total_price" name="total_price" value="<%= g.getT_price() %>">
					</div>
				
					<div class="buttons">
    					<input type="submit" value="구매하기" class="buy_btn">
					</div>
				</form>
				
				<form id="wishlist_form" action="t_wishlist.jsp" method="post">
					<div class="wishlist_div">
						<input type="hidden" value="<%= g.getT_id() %>" name="t_id">
						<input type="hidden" value="<%= g.getT_name() %>" name="t_name">
						<input type="hidden" value="<%= g.getT_price() %>" name="t_price">
						
						<!-- <button class="wishlist_btn" onclick="location.href='t_wishlist.jsp'">❤️ 찜하기</button> -->
						<input type="submit" class = "wishlist_btn" value="❤️ 찜하기">
					</div>
				</form>
			</div> <!-- option_div -->
		
		
		</div> <!-- top_area -->
		
		
		
		<div class="bottom_area" >
			<hr>
				<div style=" display: flex; margin-bottom: 30px;" >
					<img alt="info_icon" src="./image/tour/t_info_icon.png" style="margin-left: auto; margin-right: 10px;" width="32px;"><h2 style="margin: auto auto auto 0;">여행 정보</h2>
				</div>
			<!--  -->	
			
			<div class="tab">
  				<button class="tablinks" onclick="openTab(event, 'meeting_div')">집합 장소</button>
  				<button class="tablinks" onclick="openTab(event, 'tour_spot')">투어 코스</button>
  				<button class="tablinks" onclick="openTab(event, 'tour_info_div')">투어 소개</button>
			</div>

			<div id="meeting_div" class="tabcontent">
	
				<div class="meeting_div" >
					<div class="map_div" id="map_div" >
						<!--지도 -->
					</div>
					<div class="meeting-info" >
						<div class="meeting_spot" style="">
							<label><img alt="" src="./image/tour/spot.png"> <strong>집합 장소</strong> </label>
							<div style="margin-left: 20px;"><%=g.getM_spot() %></div>
						</div>
					
						<div class="meeting_time" >
							<label>
								<img alt="time" src="./image/tour/time.png">
								<strong>집합 시간</strong>
							</label>
							<div style="margin-left: 20px;"><%=g.getD_time() %></div>
						</div>
					</div> <!-- meeting-info -->
				</div> <!-- meeting_div class -->

			</div> <!-- tabcontent -->

			<div id="tour_spot" class="tabcontent">
				<div class="tour_spot_div" >
					<h3 style="text-align: center;">투어 코스</h3>
						<div class="tour_spot" style="display: flex;">
							<%-- <%= g.getT_spot1() %>, <%= g.getT_spot2() %>, <%= g.getT_spot3() %> --%>
							<div class="spot1_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
								<div class="spot1_map" id="spot1_map" style="width: 260px; height: 230px; margin-bottom: 15px;">
									<!-- 지도 -->
								</div>
								<%=g.getT_spot1() %>
							</div> 
							<% if(g.getT_spot2() != null) { %>	
								<div class="spot2_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
									<div class="spot2_map" id="spot2_map"  style="width: 260px; height: 230px; margin-bottom: 15px;">
										<!-- 지도 -->									
									</div>
									<%=g.getT_spot2() %>
								</div>
								
								<%if(g.getT_spot3() != null) { %>
									<div class="spot3_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
										<div class="spot3_map" id="spot3_map" style="width: 260px; height: 230px; margin-bottom: 15px; ">
											<!-- 지도 -->
										</div>
										<%=g.getT_spot3() %>
									</div>
							<% } } %>

						</div> <!-- tour_spot -->
				</div> <!-- tour_spot_div -->
			</div> <!-- tour_spot id -->

			<div id="tour_info_div" class="tabcontent">
				<div class="tour_info_div" >
					<div style="display: flex;">
						<img alt="icon" src="./image/tour/travel_guide_icon.png" style="margin-left: auto; margin-right: 10px;" width="50px;">
						<h3 style="margin: auto auto auto 0;">투어 소개</h3>
					</div>
						<div class="tour_info" id="tour_info">						
							<%= g.getT_info() %>
						</div>

				</div>
			</div>
			
			<div class="guide_introduce_div" style="margin-top: 20px;">
				<h3 style="text-align: center; margin-bottom: 10px;">담당 가이드</h3>
				<div class="guide_introduce" >
					<%
						String g_id = g.getG_id();
					ArrayList<g_getset> a2 = id.g2(g_id);
					%>
            		<% for (g_getset gg : a2) { %>
            		<div class="table-container" >
						<div class="guide-table">
        					<div class="guide-row">
            					<div class="image-cell">
                					<a href="g_info.jsp?g_id=<%=gg.getG_id()%>"><img alt="가이드 사진" src="<%=gg.getImg()%>" ></a>
            					</div>
            					<div style="display: block; ">
									<div class="guide_info_div">
										<div class="guide_name_div" >
											<div class="label-cell">
												<strong>이름</strong>
											</div>
											<div class="data-cell">
												<a href="g_info.jsp?g_id=<%=gg.getG_id()%>"><%=gg.getName()%></a>
											</div>
										</div>
										<div class="guide_contact" style="display: flex;">
											<div class="label-cell">
												<strong>연락처</strong>
											</div>
											<div class="data-cell">
												<%=gg.getEmail()%>
											</div>
										</div>
										<div class="guide_item">
											<div class="label-cell">
												<strong>다른 상품</strong>
											</div>
											<% ArrayList<t_getset> a3 = id.t2(g_id);
												for (int i = 0; i < a3.size(); i++) {
												t_getset tn = a3.get(i);
											%>
											<div class="data-cell">
												<a href="t_info.jsp?t_id=<%=tn.getT_id()%>"><div class="t_name2"><%=tn.getT_name()%></div></a>
    											<% if (i < a3.size() - 1) { %> <span>, </span>
												<% } %>
											</div>
											<% } %>
										</div>	<!-- guide_item -->
									</div>		<!-- guide_info_div -->										
								</div>
							</div> <!-- guide-row -->

						</div> <!-- guide-table -->

					</div> <!-- table-container -->
					<%} %>
				</div> <!-- guide_introduce -->
							
			</div>	<!-- guide_introduce_div -->		 
			<!--  -->
		</div> <!-- bottom_area -->
		
		<hr>
		
		<div class="rating-div" style="margin-bottom: 30px;">
			<form name="rating_comment" id="rating_comment" action="./tour_review_process.jsp" method="post" >
<!--  -->
				<div class="review-form-container">
					<fieldset style="display: flex;">
    					<div class="star-div" >				
							<input type="radio" name="reviewStar" value="5" id="rate1">
							<label for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2">
							<label for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3">
							<label for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4">
							<label for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5">
							<label for="rate5">★</label>
						</div>
							
						<div class="text-bold" style="margin-right: 50px;">
							별점을 남겨주세요!
						</div>
							
						<div class="tour-rating-star" id="tour-rating-star" style="flex;">
	        				<% String t_id_avg = g.getT_id();
    	    					ArrayList<t_r_getset> rv1 = id.t7(t_id_avg);  
        						for (t_r_getset tr : rv1) {
        					%>
        					<div >평점     
        						<span> <%= tr.getT_rating() %> </span> 
        					</div>
        					<% } %>
    					</div>						
					</fieldset>
    				<div class="form-group">
        				<textarea class="form-control" id="reviewContents" name="review_content" placeholder="리뷰를 남겨주세요!!" rows="4"></textarea>
        				<div id="charCount" style="float: right;">0 / 255</div>
    				</div>
    				<div class="form-group">
        				<input type="hidden" value="<%=g.getT_id()%>" name="t_id">
        				<input type="submit" value="등록하기" class="review-write-btn">
    				</div>
				</div> <!-- review-form-container -->
			</form>	 
			<!--  -->
			
			<div class="t_review_div">
				<table class="review-table">
					<tr id="review_top">
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>날짜</th>
						<th>평점</th>
					</tr>
				<%
					ArrayList<t_r_getset> rv = id.t6(t_id); 
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 원하는 포맷 설정
					
					int count = rv.size(); // 댓글의 총 개수를 사용해서 초기 번호를 설정
                   
					int itemsPerPage = 10; // 한 페이지당 아이템 개수
					int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // 페이지 번호를 받음

					int startIndex = (currentPage - 1) * itemsPerPage;
					int endIndex = Math.min(startIndex + itemsPerPage, count);

					for (int i = startIndex; i < endIndex; i++) {
						t_r_getset tr = rv.get(i);
						String reviewDateString = tr.getReview_date();
						Timestamp reviewTimestamp = Timestamp.valueOf(reviewDateString);
						Date reviewDate = new Date(reviewTimestamp.getTime());
				%>
					<tr>
						<td style="text-align: center;"><%= count - i %></td> <!-- 업데이트된 부분 -->
						<td style="text-align: center;"><%= tr.getM_id() %></td>
						<td><%= tr.getT_review() %></td>
						<td style="text-align: center;"><%= sdf1.format(reviewDate) %></td>
						<td style="text-align: center;"> 
							<div class="star-rating">
								<%
									int ratingStr = tr.getT_rating();
										try {
											int rating = ratingStr;
											for (int j = 0; j < rating; j++) {
								%>
												<i class="fas fa-star" style="color: rgba(250, 208, 0, 0.99);"></i>
										<%
											} } 
												catch (NumberFormatException e) {
                        						// 숫자로 파싱할 수 없는 경우에 대한 예외 처리
													}
										%>
							</div> <!-- star-rating -->
						</td>
					</tr>
					<% } %>
    			</table> <!-- review-table -->
    
    <!-- 이전 페이지와 다음 페이지로 이동하는 버튼 -->
				<div class="pagination-container">
					<%
						int totalPages = (int) Math.ceil((double) count / itemsPerPage);
						if (currentPage > 1) {
					%>
						<a href="t_info.jsp?t_id=<%= t_id %>&page=<%= currentPage - 1 %>" onclick="scrollToReviewTable()">이전 페이지</a>
					<% 
						} for (int i = 1; i <= totalPages; i++) {
					%>
						<a href="t_info.jsp?t_id=<%= t_id %>&page=<%= i %>" <%if (i == currentPage) {%>class="current-page"<%} %>>
							<%= i %>
						</a>
	    			<% } if (currentPage < totalPages) {
					%>
						<a href="t_info.jsp?t_id=<%= t_id %>&page=<%= currentPage + 1 %>" onclick="scrollToReviewTable()">다음 페이지</a>
					<% } %>
				</div>

			</div><!-- t_review_div -->
		</div> <!-- rating-div -->

<!-- 호텔광고 -->
		<div class = "hotel_ad_div">
   	 		<div style="display: flex; align-items: center;">
   	 			<img alt="sleep" src="./image/tour/bed1.png" width="64px;" style="margin-left: auto; margin-right: 10px;">
   	 			<h2 style="margin: 0; margin-right: auto;">호텔을 찾고 계시나요?!?</h2>
   	 		</div>

	   	 	<div class="hotel-container" style="display: flex; margin-top: 20px;">
    			<%
	   		 		String h_country = g.getCountry_eng();
   		 			ArrayList<H_getset> hc = id.h3(h_country);
   	 				// 호텔 목록 무작위
	   	 			Collections.shuffle(hc);
		   	 		// 호텔 4개 선택
   			 		List<H_getset> randomHotels = hc.subList(0, 4);
   	 			%>
	   	 		<div class="hotel-list" style="display: flex;">
    	    	<%
        	    	for (H_getset hotel : randomHotels) {
        		%>
        			<div class="hotel-card">
            			<div class="hotel-img">
            				<a href="information.hotel?uname=<%=hotel.getH_name_eng()%>"><img alt="hotel" src="./image/hotel/h_image/<%= hotel.getH_pho() %>" width="100%" height="180px"></a>
	            		</div>
    	        		<div class="hotel-info">
        	    			<label><%= hotel.getCountry_ko() %>, <%= hotel.getCity_ko() %></label><br>
            				<div class="star-rating">
            				<%
                				String ratingStr = hotel.getH_grade();
                				try {
                            		int rating = Integer.parseInt(ratingStr);
                            		for (int j = 0; j < rating; j++) {
                    		%>
                            	<i class="fas fa-star" style="color: #FFBB00;"></i>
                            	<%
	                            }} catch (NumberFormatException e) {
    	                        // 숫자로 파싱할 수 없는 경우에 대한 예외 처리
        	                	}
            	        		%>
            				</div> <!-- star-rating -->
                		<br>
							<%!
    							String addCommasForHotel(int number) {
	        					return String.format("%,d", number);
    							}
							%>
            				<label><a href="information.hotel?uname=<%=hotel.getH_name_eng()%>"><span class="hotel-name"><%= hotel.getH_name_ko() %></span></a></label> <br>
                			<label>가격: ₩ <span class="h_price"><%= addCommasForHotel(hotel.getH_roompri()) %></span> ~</label>
	
			            </div> <!-- hotel-info -->
        			</div> <!--hotel-card  -->
        		<%
        	   		}
        		%>
	    		</div> <!-- hotel-list  -->
			</div> <!-- hotel-container -->

		</div> <!-- hotel_ad_div -->

	</div> <!-- 전체 content -->

	
</body>
		<footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer>
		
		<!-- google map -->
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

    initMap(); // initMap 함수 호출
</script>

<script>
  // Google 지도를 생성하고 spot1_map에 표시하는 코드
  function initSpot1Map() {
    var mapOptions = {
      center: { lat: <%=g.getSpot1_x() %>, lng: <%=g.getSpot1_y() %> },
      zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('spot1_map'), mapOptions);

    // 마커를 추가할 위치의 위도와 경도
    var markerLatLng = { lat: <%=g.getSpot1_x() %>, lng: <%=g.getSpot1_y() %> };

    // 마커 생성
    var marker = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: '<%=g.getT_spot1() %>'
    });
  }

  initSpot1Map(); // initSpot1Map 함수 호출
</script>

<script>
  // Google 지도를 생성하고 spot2_map에 표시하는 코드
  function initSpot2Map() {
    var mapOptions = {
      center: { lat: <%=g.getSpot2_x() %>, lng: <%=g.getSpot2_y() %> },
      zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('spot2_map'), mapOptions);

    // 마커를 추가할 위치의 위도와 경도
    var markerLatLng = { lat: <%=g.getSpot2_x() %>, lng: <%=g.getSpot2_y() %> };

    // 마커 생성
    var marker = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: '<%=g.getT_spot2() %>'
    });
  }

  initSpot2Map(); // initSpot2Map 함수 호출
</script>

<script>
  // Google 지도를 생성하고 spot3_map에 표시하는 코드
  function initSpot3Map() {
    var mapOptions = {
      center: { lat: <%=g.getSpot3_x() %>, lng: <%=g.getSpot3_y() %> },
      zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('spot3_map'), mapOptions);

    // 마커를 추가할 위치의 위도와 경도
    var markerLatLng = { lat: <%=g.getSpot3_x() %>, lng: <%=g.getSpot3_y() %> };

    // 마커 생성
    var marker = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: '<%=g.getT_spot3() %>'
    });
  }

  initSpot3Map(); // initSpot3Map 함수 호출
</script>

<!-- 이미지 슬라이드  -->
<script>
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

        // 이미지를 전환할 때마다 top_area의 크기를 고정 값으로 설정
        var topArea = document.querySelector(".top_area");
        topArea.style.height = "400px"; // 위에서 지정한 높이로 설정
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

<script>

function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}

</script>

<script>
  let currentCount = 1; // 초기 인원 수
  let tPrice = '<%= g.getT_price() %>'; // 상품 가격 
  // 숫자 포맷 함수
  function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }
  // 초기 가격에 대한 포맷 적용
  tPrice = formatNumberWithCommas(parseInt(tPrice));

  document.addEventListener('DOMContentLoaded', function() {
    // 페이지가 로드될 때 초기 가격과 합계 가격에 대한 포맷 적용
    document.getElementById('totalPrice').innerText = tPrice;
    
  });


  function updateCount(change) {
	  currentCount += change;
	  // 최소 1명, 최대 10명으로 제한
	  currentCount = Math.min(Math.max(currentCount, 1), 10);

	  // 결과 업데이트
	  document.getElementById('result').innerText = currentCount;

	  // "total_people" 입력 필드 업데이트
	  document.getElementById('totalPeopleInput').value = currentCount;

	  // 가격 계산 및 업데이트
	  const totalPrice = currentCount * parseInt('<%= g.getT_price() %>'); // 현재 수량에 가격을 곱함
	  const formattedTotalPrice = formatNumberWithCommas(totalPrice); // 컴마가 붙은 숫자
	  document.getElementById('totalPrice').innerText = formattedTotalPrice;

	  // "total_price" 입력 필드 업데이트
	  document.getElementById('total_price').value = totalPrice;
	}
  
</script>


<script> /* db 출력 텍스트에 <br> 적용 */
  document.addEventListener('DOMContentLoaded', function() {
    const tourInfoElement = document.querySelector('.tour_info'); // tour_info 클래스를 가진 요소를 선택합니다.

    if (tourInfoElement) {
      const originalText = tourInfoElement.innerHTML;
      const modifiedText = originalText.replace(/\\n/g, '<br>').replace(/\\r/g, '<br>'); // 문자열에서 \n 또는 \r을 <br>로 변환.
      tourInfoElement.innerHTML = modifiedText; // 변환된 문자열을 요소에 적용합니다.
    }
  });
</script>


<script>
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 첫 번째 탭 활성화
    openTab(event, 'meeting_div'); 
});

function openTab(evt, tabName) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>


<script>
function validateForm() {
    // 선택한 날짜 가져오기
    var selectedDate = document.getElementById("trip-start").value;

    // 날짜가 선택되었는지 확인
    if (selectedDate === "") {
        alert("날짜를 선택해주세요.");
        return false; // 폼 전송을 막습니다.
    }

    // 세션 ID의 존재 여부 확인
    var sessionID = "<%= session.getAttribute("id") %>";
    console.log(sessionID);
    if (!sessionID) {
        alert("로그인이 필요합니다.");
        return false; // 폼 전송을 막습니다.
    }

    // 날짜가 선택되었고 세션 ID가 존재하면 폼을 제출합니다.
    return true;
}
</script>

<script>
    function formatNumberWithCommas(number) {
        // 가격에 컴마 추가
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    // 페이지 로드 후 실행
    document.addEventListener('DOMContentLoaded', function() {
        var priceElement = document.getElementById('formattedPrice');
        var price = parseInt('<%= g.getT_price() %>'); // 가격을 숫자로 파싱
        priceElement.textContent = formatNumberWithCommas(price) + ' 원';
    });
</script>

<script>
  // 텍스트 박스와 글자 수 표시 요소를 가져옵니다.
  const reviewContents = document.getElementById("reviewContents");
  const charCount = document.getElementById("charCount");

  // 텍스트 박스에 입력 내용이 변경될 때마다 글자 수를 업데이트합니다.
  reviewContents.addEventListener("input", function () {
    const text = reviewContents.value;
    const textLength = text.length;
    const maxLength = 255; // 최대 글자 수

    // 글자 수 표시를 업데이트합니다.
    charCount.textContent = textLength + " / " + maxLength;

    // 최대 글자 수를 초과하면 입력을 제한합니다.
    
      // 입력을 최대 글자 수로 자릅니다.
      if (textLength > maxLength) {
      reviewContents.value = text.slice(0, maxLength);
      charCount.textContent = maxLength + " / " + maxLength;
    }
  });
</script>

<script>
// 달력  특정 날짜만 선택 되게 하는 코드 
    // 월요일, 수요일, 금요일에 해당하는 요일 값
    const validDays = [1, 3, 5];

    // date 요소 선택
    const dateInput = document.getElementById('trip-start');

    // 이벤트 리스너 추가
    dateInput.addEventListener('change', function() {
        // 입력된 날짜 값 가져오기
        const selectedDate = new Date(dateInput.value);

        // 선택한 날짜의 요일 가져오기 (0: 일요일, 1: 월요일, 2: 화요일, ...)
        const dayOfWeek = selectedDate.getDay();

        // 선택한 날짜가 월요일, 수요일, 금요일 중 하나가 아니라면 경고 메시지를 표시하고 입력 값을 초기화
        if (!validDays.includes(dayOfWeek)) {
            alert('월요일, 수요일, 금요일 중 하나를 선택해주세요.');
            dateInput.value = ''; // 입력 값을 초기화
        }
    });
</script>




<%} %> <!-- for문 종료 -->
<!--  -->

</jsp:useBean>
<!--  -->

</html>