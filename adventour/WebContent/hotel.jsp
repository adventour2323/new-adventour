<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="getset.H_getset"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>호텔 메인</title>
<link rel="stylesheet" type="text/css" href="css/hotel.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/hotel.js"></script>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>



<body>

	<header>
	
		<%
if (session.getAttribute("id") == null) {
%>
		<!-- header.html import -->
		<div id="header"></div>
		<%
} else {
%>
		<jsp:include page="header_login.jsp"></jsp:include>
		<%
}
%>
	</header>

<form name="h_main_sch_form" action="mainsch.hotel?uname=hotelSearch" method="post" >
	<div class="busmain">
		<img class="busmainpic" src="image/img/hotel01.jpg">
		<div class="b_piccont">
			<h2 class="busmaintit">원하는 여정의 호텔을 검색해 보세요.</h2>

			<div class="b_picti">
				<p class="sch1">원하는 지역이 어디신가요?</p>
				<p class="sch2">체크인</p>
				<p class="sch3">체크아웃</p>
				<p class="sch4">인원수</p>
			</div>

			<div class="b_picsch">

				<select id="h_mainde" class="h_mainde" name="h_mainde" placeholder="나라 선택">
					<option value="">나라 선택</option>
					<option value="uk">영국</option>
					<option value="italy">이탈리아</option>
					<option value="france">프랑스</option>
					<option value="spain">스페인</option>
				</select> 
				<select id="h_maincity" class="h_maincity" name="h_maincity" placeholder="도시 선택">
					<option value="">도시 선택</option>
					<option value="all">어디든지</option>
					<option value="london">런던</option>
					<option value="liverpool">리버풀</option>
					<option value="edinburgh">에든버러</option>
					<option value="rome">로마</option>
					<option value="venice">베네치아</option>
					<option value="milano">밀라노</option>
					<option value="paris">파리</option>
					<option value="marseille">마르세유</option>
					<option value="monaco">모나코</option>
					<option value="madrid">마드리드</option>
					<option value="barcelona">바르셀로나</option>
					<option value="sevilla">세비야</option>
				</select> 
				<select id="h_indateY" class="h_indateY" name="h_indateY" placeholder="체크인">
					<option vlaue="">년</option>
					<option vlaue="2023">2023</option>
					<option vlaue="2024">2024</option>
				</select> 
				<select id="h_indateM" class="h_indateM" name="h_indateM" placeholder="체크인">
					<option vlaue="">월</option>
					<option vlaue="1">1</option>
					<option vlaue="2">2</option>
					<option vlaue="3">3</option>
					<option vlaue="4">4</option>
					<option vlaue="5">5</option>
					<option vlaue="6">6</option>
					<option vlaue="7">7</option>
					<option vlaue="8">8</option>
					<option vlaue="9">9</option>
					<option vlaue="10">10</option>
					<option vlaue="11">11</option>
					<option vlaue="12">12</option>

				</select> 
				<select id="h_indateD" class="h_indateD" name="h_indateD" placeholder="체크인">
					<option vlaue="">일</option>

				</select> 
				<select id="h_outdateY" class="h_outdateY" name="h_outdateY" placeholder="체크아웃">
					<option vlaue="">년</option>
					<option vlaue="2023">2023</option>
					<option vlaue="2024">2024</option>
				</select>
				 <select id="h_outdateM" class="h_outdateM" name="h_outdateM" placeholder="체크아웃">
					<option vlaue="">월</option>
					<option vlaue="1">1</option>
					<option vlaue="2">2</option>
					<option vlaue="3">3</option>
					<option vlaue="4">4</option>
					<option vlaue="4">5</option>
					<option vlaue="4">6</option>
					<option vlaue="4">7</option>
					<option vlaue="8">8</option>
					<option vlaue="9">9</option>
					<option vlaue="10">10</option>
					<option vlaue="11">11</option>
					<option vlaue="12">12</option>

				</select> 
				<select id="h_outdateD" class="h_outdateD" name="h_outdateD" placeholder="체크아웃">
					<option vlaue="">일</option>

				</select>
				
				 <select id="h_mainpeo" class="h_maintpeo" name="h_mainpeo" placeholder="총 인원수">
				    <option vlaue="1">1</option>
					<option vlaue="2">2</option>
					<option vlaue="3">3</option>
					<option vlaue="4">4</option>
				</select>

				
			<input type="hidden" id="night_time" class="night_time" name="night_time">
			   <input type="submit" class="b_maintbtn"  name="bsch_btn" value="검색하기">
			    
			</div>
			<!--b_picsch-->
		</div>
		<!--b_piccont-->
	</div>
	<!--busmain-->

</form>

	<div class="h_eventban">

		<div class="h_event1">
			<div class="event1_img">
				<img src="image/img/event1.jpeg" width="1100px" height="300px">
			</div>
			<div class="event1_con">
				<h2>스페인</h2>
				<h2>바르셀로나</h2>
				<h3>지금 바르셀로나 여행을 떠나보세요!</h3>
			</div>
		</div>

	</div>

	<div class="content">

		<div class="h_retop10">

			<h2 class="h_retitle">추천 인기호텔 TOP10</h2>

			<section class="awards">
				<!-- 이미지 스와이퍼 -->
				<div class="inner">
					<div class="swiper">
						<div class="swiper-wrapper">
							<%
                List<H_getset> list = (List<H_getset>) request.getAttribute("list");
                if (list != null) {
                    for (int i = 0; i < list.size(); i++) {
                        H_getset aaa = list.get(i);
                       
                %>
							<div class="swiper-slide">
								<a name="<%= aaa.getH_name_eng() %>" href="information.hotel?uname=hotelinfom&hotelname=<%= aaa.getH_name_eng() %>">
									<img class="top<%= i + 1 %>"
									src="image/hotel/h_image/<%= aaa.getH_pho() %>" alt="" />
									<p class="top_contry"><%= aaa.getCountry_ko() %>
										-
										<%= aaa.getCity_ko() %></p>
									<p class="top_name"><%= aaa.getH_name_ko() %></p>
								</a>
							</div>
							<%
                    }
                } else {
                    out.println("null data");
                }
                %>
						</div>
					</div>
				</div>

				<div class="swiper-buttons">
					<button class="swiper-prev"><</button>
					<!--이전버튼-->
					<button class="swiper-next">></button>
					<!-- 다음 버튼-->
				</div>

			</section>
			<!--이미지스위퍼 끝-->

		</div>
		<!--h_retop10 끝 -->


		<div class="h_recity">

			<h2 class="h_retitle">나라별 검색하기</h2>

			<div class="h_recityimgs">

				<a href="main.hotel?uname=uk">
					<div class="ukimg">
						<img class="h_recityimg1" src="image/img/uk.png">
						<div class="ukname">
							<h2>영국</h2>
						</div>
					</div>
				</a> <a href="main.hotel?uname=italy">
					<div class="ityimg">
						<img class="h_recityimg2" src="image/img/ity.png">
						<h2 class="ityname">이탈리아</h2>
					</div>
				</a> <a href="main.hotel?uname=france">
					<div class="fraimg"">
						<img class="h_recityimg3" src="image/img/fra.png">
						<h2 class="franame">프랑스</h2>
					</div>
				</a> <a href="main.hotel?uname=spain">
					<div class="spaimg">
						<img class="h_recityimg4" src="image/img/spain.png">
						<h2 class="spaname">스페인</h2>
					</div>
				</a>


			</div>

		</div>
		<!--h_recity-->

	</div>
	<!--content-->

	<div class="h_packages">
		<h2>투어와 함께하는 숙소를 추천해드려요.</h2>

		<div class="h_package">

			<jsp:useBean id="prac" class="adventour.C_dbsave" />
			<% 
          ArrayList<H_getset> h_PList = prac.h_PackageShow();
         for (int i = 0; i < 4; i++) {       	 
         H_getset obj =  h_PList.get(i);
    %>
			<div class="package<%= i+1 %>">
				<div class="package1_img">
					<img src="image/img/<%= obj.getP_pho() %>">
				</div>
				<div class="package1_con">
					<ul class="package1_ul">
						<li class="pack_title"><%= obj.getP_name_ko() %></li>
						<li class="pack_con1"><%= obj.getP_title1() %></li>
						<li class="pack_con2"><%= obj.getP_title2() %></li>
						<li class="pack_pri"><%= obj.getP_price() %>원 ~</li>
					</ul>
				</div>
			</div>
			<!--package1-->

			<%
    }

%>
		</div>
	</div>

	<!-- footer.html import-->
	<div id="footer"></div>



</body>

<script>

	$(".b_maintbtn").on("click", function(){

	    var h_mainde = document.getElementById("h_mainde").value;
	    var h_maincity = document.getElementById("h_maincity").value;
	    var h_indateY = document.getElementById("h_indateY").value;
	    var h_indateM = document.getElementById("h_indateM").value;
	    var h_indateD = document.getElementById("h_indateD").value;
	    var h_outdateY = document.getElementById("h_outdateY").value;
	    var h_outdateM = document.getElementById("h_outdateM").value;
	    var h_outdateD = document.getElementById("h_outdateD").value;
	    var h_mainpeo = document.getElementById("h_mainpeo").value;
	   
	    alert("1번" + h_outdateD);
	    
	    var h_indate11 = h_indateY+"-"+h_indateM+"-"+h_indateD;
	    var h_outdate11 = h_outdateY+"-"+h_outdateM+"-"+h_outdateD;

	  

	    alert("2번" +  h_indate11);

	    // 날짜를 Date 객체로 변환
	    var checkInDate11 = new Date(h_indate11);
	    var checkOutDate11 = new Date(h_outdate11);

	    // 두 날짜 사이의 밤 수 계산
	    var timeDifference11 = checkOutDate11 - checkInDate11;
	    var night_time = Math.floor(timeDifference11 / (1000 * 60 * 60 * 24));

	   

	    // 쿠키 만료 날짜를 설정 -  현재 세션이 종료되면
	  var expirationDate = new Date();
	expirationDate.setDate(expirationDate.getDate() + 1);

	    // 각 데이터를 쿠키에 저장
	    document.cookie = "h_mainde=" + h_mainde + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_maincity=" + h_maincity + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_indateY=" + h_indateY + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_indateM=" + h_indateM + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_indateD=" + h_indateD + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_outdateY=" + h_outdateY + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_outdateM=" + h_outdateM + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_outdateD=" + h_outdateD + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "h_mainpeo=" + h_mainpeo + "; expires=" + expirationDate.toUTCString();
	    document.cookie = "night_time=" + night_time + "; expires=" + expirationDate.toUTCString();

	    alert("3번 메인검색"+h_outdateD);
	    alert("4번 night_time"+night_time);
	});

</script>
</html>
