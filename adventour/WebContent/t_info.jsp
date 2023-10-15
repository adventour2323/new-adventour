<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="java.util.*"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
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
				<form id="purchaseForm" action="t_payment.jsp" method="post" onsubmit="return validateForm();">
					<div class="date_select" >
						<label style="margin-right: 10px;"><h5>날짜</h5></label>

						<!-- <input type="date" id="start" name="trip-start"  min="2023-01-01" max="2024-12-31" required> -->
					<%
						// 오늘 날짜를 가져오고, yyyy-MM-dd 형식으로 포맷
						Date today = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String formattedDate = sdf.format(today);
					%>
						 <input type="date" id="trip-start" name="trip-start" value="<%= formattedDate %>" min="<%= formattedDate %>" required>
						
					</div>
				
					<div class="t_price_info" >
						<label style="margin-right: 10px;"><h5>가격</h5></label>
						<label style="margin-right: 10px;"><%= g.getT_price() %> 원</label>
						<input type="hidden" id="tour_price" name="tour_price" value="<%= g.getT_price() %>">
					</div>
				
					<div class="people_num" >
    					<label style="margin-right: 10px;"><h5>인원</h5></label>
    					<input type='button' onclick='updateCount(-1)' value='-' style="border: none; cursor: pointer;">
    					<div id='result'>1</div>
    					<input type='button' onclick='updateCount(1)' value='+' style="border: none; cursor: pointer;">
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
						<div class="tour_spot">
							<%-- <%= g.getT_spot1() %>, <%= g.getT_spot2() %>, <%= g.getT_spot3() %> --%>
							<%=g.getT_spot1() %> 
							<% if(g.getT_spot2() != null) {
								out.println(", "+g.getT_spot2());
								if(g.getT_spot3()!=null){
									out.println(", "+g.getT_spot3());
								}
							}
									%>
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
			
			<!--  -->
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
			
			<table>
				<tr id="review_top">
					<td>번호</td>
					<td>내용</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>평점</td>
				</tr>
			
			</table>
		
		</div>


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



<!-- <script> 
function validateForm() {
    // 선택한 날짜 가져오기
    var selectedDate = document.getElementById("trip-start").value;
    
    // 날짜가 선택되었는지 확인
    if (selectedDate === "") {
        alert("날짜를 선택해주세요.");
        return false; // 폼 전송을 막습니다.
    }
    
    // 날짜가 선택되었다면 폼을 제출합니다.
    return true;
}
</script> -->

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



<%} %> <!-- for문 종료 -->
<!--  -->

</jsp:useBean>
<!--  -->

</html>