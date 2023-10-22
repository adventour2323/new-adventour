<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
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


<%-- 			<%
                String t_id = request.getParameter("t_id");
            %>
			
			<%
                List<t_getset> a1 = (List<t_getset>) request.getAttribute("list");
                for (t_getset g : a1) {
            %> --%>
            
<body>

		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
			
		</header>
			

	<div class="content"   > <!-- 전체 content -->
		
		
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
				<div>
					<button class="wishlist_btn" onclick="location.href='t_wishlist.jsp'">❤️ 찜하기</button>
				</div>
			</div> <!-- option_div -->
		
		
		</div> <!-- top_area -->
		
		
		
		<div class="bottom_area" >
			<hr>
				<div style=" text-align: center; margin-bottom: 30px;" >
					<h3 style="text-align: center;">여행 정보</h3>
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
							<label><img alt="" src="./image/tour/time.png"><strong>집합 시간</strong> </label>
							<div style="margin-left: 20px;"><%=g.getD_time() %></div>
						</div>
					</div> <!-- meeting-info -->
				</div>

			</div>

			<div id="tour_spot" class="tabcontent">
				<div class="tour_spot_div" >
					<h3 style="text-align: center;">투어 코스</h3>
						<div class="tour_spot" style="display: flex;">
							<%-- <%= g.getT_spot1() %>, <%= g.getT_spot2() %>, <%= g.getT_spot3() %> --%>
							<div class="spot1_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
								<div class="spot1_map" id="spot1_map" style="width: 260px; height: 230px; margin-bottom: 15px;">
								</div>
								<%=g.getT_spot1() %>
							</div> 
							<% if(g.getT_spot2() != null) { %>	
								<div class="spot2_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
									<div class="spot2_map" id="spot2_map"  style="width: 260px; height: 230px; margin-bottom: 15px;">
									</div>
									<%=g.getT_spot2() %>
								</div>
								
								<%if(g.getT_spot3() != null) { %>
									<div class="spot3_map_div" style="text-align: center; margin-right: auto; margin-left: auto;">
										<div class="spot3_map" id="spot3_map" style="width: 260px; height: 230px; margin-bottom: 15px; ">
										</div>
										<%=g.getT_spot3() %>
									</div>
							<% } } %>
							 

						</div>
					</div>
			</div>

			<div id="tour_info_div" class="tabcontent">
				<div class="tour_info_div" >
					<h3 style="text-align: center;">투어 소개</h3>
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
            									<div class="label-cell" style="margin-right: auto; margin-left: auto;">
            										<strong>이름</strong>
        		    							</div>
		            						<div class="data-cell" style="margin-right: auto; margin-left: auto;">
	                							<a href="g_info.jsp?g_id=<%=gg.getG_id()%>"><%=gg.getName()%></a>
            								</div>
											<div class="label-cell" style="margin-right: auto; margin-left: auto;">
												<strong>연락처</strong>
											</div>
		            						<div class="data-cell" style="margin-right: auto; margin-left: auto;">
            									<%=gg.getEmail()%>
            								</div>
            								</div>
        								</div>

									</div>

								</div>
            					<%} %>
							</div>
							
						</div>			
			<!--  -->
			
		
		</div> <!-- bottom_area -->
		
		<hr>
		
		<div class="rating-div" style="margin-bottom: 30px;">
			<form name="rating_comment" id="rating_comment" action="./tour_review_process.jsp" method="post" >

				<div class="review-form-container">
					<fieldset>
						<span class="text-bold">별점을 남겨주세요</span>
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
					</fieldset>
    				<div class="form-group">
        				<textarea class="form-control" id="reviewContents" name="review_content" placeholder="리뷰를 남겨주세요!" rows="4"></textarea>
    				</div>
    				<div class="form-group">
        				<input type="hidden" value="<%=g.getT_id()%>" name="t_id">
        				<input type="submit" value="등록하기" class="review-write-btn">
    				</div>
				</div>
			</form>	 
			
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

					for (t_r_getset tr : rv) {
						String reviewDateString = tr.getReview_date(); // String 형식의 날짜를 가져옴

						// String을 Timestamp로 변환
					    Timestamp reviewTimestamp = Timestamp.valueOf(reviewDateString);

						Date reviewDate = new Date(reviewTimestamp.getTime());
				%>
					<tr>
    					<td><%= count %></td>
    					<td><%= tr.getM_id() %></td>
    					<td><%= tr.getT_review() %></td>
    					<td><%= sdf1.format(reviewDate) %></td>
    					<%-- <td><%= tr.getT_rating() %></td> --%>
<td>
  <div class="star-rating">
    <%
    int ratingStr = tr.getT_rating(); // 이미 문자열로 가져옴
    try {
        int rating = ratingStr; // 숫자로 변환
        for (int i = 0; i < rating; i++) {
    %>
      <i class="fas fa-star" style="color: rgba(250, 208, 0, 0.99);"></i> <!-- 노란색 별 아이콘 사용 -->
    <%
        }
    } catch (NumberFormatException e) {
        // 숫자로 파싱할 수 없는 경우에 대한 예외 처리
    }
    %>
  </div>
</td>


					</tr>
					<%  count--; // 번호를 감소시켜 역순으로 만듭니다. 
					} %>

				</table>		
			</div> <!-- t_review_div -->
		 	
		</div> <!-- rating-div -->


	</div> <!-- 전체 content -->
	
</body>
		<footer>
			<!-- <div id="footer"></div> -->
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
</script>

<script>
    initMap(); // initMap 함수 호출
</script>
<!--  -->
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


<!--  -->

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

/*   function updateCount(change) {
    currentCount += change;
    // 최소 1명, 최대 10명으로 제한
    currentCount = Math.min(Math.max(currentCount, 1), 10);
    // 결과 업데이트
    document.getElementById('result').innerText = currentCount;
    // 가격 업데이트
    const totalPrice = parseInt(tPrice.replace(/,/g, '')) * currentCount; // 컴마 제거 후 계산
    const formattedTotalPrice = formatNumberWithCommas(totalPrice); // 컴마가 붙은 숫자
    document.getElementById('totalPrice').innerText = formattedTotalPrice ;
  } */
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



<%} %> <!-- for문 종료 -->
<!--  -->

</jsp:useBean>
<!--  -->

</html>