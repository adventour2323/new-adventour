<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_rating_getset"%>
<%@ page import="getset.guide_gs"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>ADVENTOUR - TOUR</title>
<link rel="stylesheet" type="text/css" href="./css/tour_index.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="./js/tour_incomplete.js"></script>
<script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
</head>
<body>
 
	<%-- <jsp:useBean id="id" class="adventour.g_list_print"> --%>
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

		<%
			List<guide_gs> a1 = (List<guide_gs>) request.getAttribute("list");
				
			/* ArrayList<g_getset> a1 = id.g1(); */
			/* ArrayList<t_getset> a2 = id.t1(); */
		%>
		<!-- 본문  -->

		<div class="content">

			<div id="guide_of_the_month">
				<div class="gom_ment" style="margin-bottom: 20px;">
					<div class="gom_title">
						<img alt="guide icon1" src="./image/tour/guide_icon1.png" style="margin-left: auto;">
						<h1 class="gom_comment" style="margin: auto 10px; ">인기 가이드</h1>
						<img alt="guide icon2" src="./image/tour/guide_icon2.png" style="margin-right: auto;">
					</div>
				</div>


				<div class="tab_list"  style=" height: 300px; background-color: #f5f5f5">
					<input id="tab1" type="radio" name="tabs" checked>
					<!--디폴트 메뉴-->
					<label class="g_label" for="tab1">영국</label> 
					<input id="tab2" type="radio" name="tabs"> 
						<label class="g_label" for="tab2">프랑스</label> 
					<input id="tab3" type="radio" name="tabs">
						<label class="g_label" for="tab3">스페인</label> 
					<input id="tab4" type="radio" name="tabs"> 
						<label class="g_label" for="tab4">이탈리아</label>
					<div style="float: right; cursor: pointer; margin-top: auto;"
						onclick="location.href='./g_list.jsp'">전체보기</div>

					<section id="guide_uk">
						<!--  -->
						<%
							for (int i = 0; i < a1.size(); i++) {
																guide_gs g = a1.get(i);
																	if (g.getG_country().equals("영국") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;">
										<a href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img()%>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<%
							}}
						%>
						<!--  -->
					</section>

					<section id="guide_fr">
						<%
							for (int i = 0; i < a1.size(); i++) {
																guide_gs g = a1.get(i);
																	if (g.getG_country().equals("프랑스") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<%-- <% out.println("<img src='" + g.getG_img() + "' width='200px' alt='img'>"); %> --%>
													<img alt="img" src=" <%=g.getG_img()%>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>
						<%
							}}
						%>
					</section>

					<section id="guide_es">
						<%
							for (int i = 0; i < a1.size(); i++) {
																guide_gs g = a1.get(i);
																	if (g.getG_country().equals("스페인") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img()%>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>

						<%
							}}
						%>
					</section>

					<section id="guide_ita">
						<%
							for (int i = 0; i < a1.size(); i++) {
																guide_gs g = a1.get(i);
																	if (g.getG_country().equals("이탈리아") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img()%>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>

						<%
							}}
						%>
					</section>

				</div>
			</div>



	<jsp:useBean id="id" class="adventour.g_list_print">
			<!--  -->

    <div class="t_country" >
	
	<div> 
	<h1 style="float: left;"> 국가별 투어</h1>
	<div style="float: right; cursor: pointer;" onclick="location.href='main.tour?tour=tourlist'">전체보기</div> 
	<br><br><hr>
	</div>
	
        <div class="t_flag">
        
          <div id="ukimg" class="country_name">
			<a href="t_list_country.jsp?country_eng=uk">
            	<img id="uk_flag" class="flag" src="image/img/uk.png">
            	<h2 >영국</h2>
			</a>            
          </div>
          
          <div id="fraimg" class="country_name">
			<a href="t_list_country.jsp?country_eng=france">
            	<img id="fr_flag" class="flag" src="image/img/fra.png">
            	<h2 >프랑스</h2>
			</a>
          </div>

          <div id="spaimg" class="country_name">
          	<a href="t_list_country.jsp?country_eng=spain">
            	<img id="es_flag" class="flag" src="image/img/spain.png">
            	<h2 >스페인</h2>
            </a>
          </div>
          
          <div id="ityimg" class="country_name">
          	<a href="t_list_country.jsp?country_eng=italy">
            	<img id="ita_flag" class="flag" src="image/img/ity.png">
            	<h2 >이탈리아</h2>
            </a>
          </div>

        </div>

    </div><!--h_recity-->
    			
			
			
			<div class="tour_banner" style="margin-top: 30px;">
				<div class="Slidesbackground"
					style="margin-top: 50px; margin-bottom: 50px; text-align: center;">

					<div name="test">
						<!-- 배너 사진 -->
					
						<% 
						/*  */
						ArrayList<t_getset> a2 = id.t1();
						/*  */
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("p_e_tour") == true) {
						%>
					
						<div class="slidetext fade">
							<a href="t_info.jsp?t_id=p_e_tour">
								<img alt="1" src="<%=t.getT_logo()%>">
							</a>
						</div>
						<% } } %>
				


						<%
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("r_v_tour") == true) {
						%>

						<div class="slidetext fade">
							<a href="t_info.jsp?t_id=r_v_tour">
								<img alt="2" src="<%=t.getT_logo()%>">
							</a>
						</div>
				<% } } %>

						<%
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("m_g_tour1") == true) {
						%>

						<div class="slidetext fade">
							<a href="t_info.jsp?t_id=m_g_tour1">
								<img alt="3" src="<%=t.getT_logo()%>">
							</a>
						</div>
				<% } } %>
					</div>

				</div>
			</div>
			
			
			<div class="popular_tour_div">
				<div class="popular_tour">
					<img alt="hot" src="./image/tour/hot.png" style="margin-left: auto;" >
					<h1>이번 주에 가장 사랑받은 여행이에요</h1>
					<img alt="hot" src="./image/tour/hot.png" style="margin-right: auto;">
				</div>

				<div class="recommend_city">
					<%
					ArrayList<t_rating_getset> r = id.t8();
						for (int i = 0; i < r.size(); i++) {
						t_rating_getset rating = r.get(i);
					%>
					<div class="recommend_city1">
						<!-- tour-img -->
						<a href="t_info.jsp?t_id=<%=rating.getT_id()%>">
							<div class="r_c_1_img">
								<img src="<%=rating.getT_img1()%>" style="width: 100%; " alt="추천도시 1">
								<% if (i == 0) { %>
								<img src="./image/tour/1st.png" alt="메달" style="position: absolute; bottom: 5px; right: 0px; width: 96px; height: 96px;">
								<% } else if (i == 1) { %>
								<img src="./image/tour/2nd.png" alt="메달" style="position: absolute; bottom: 5px; right: 0px; width: 72px; height: 72px;">
								<% } else if (i == 2) { %>
								<img src="./image/tour/3rd.png" alt="메달" style="position: absolute; bottom: 5px; right: 5px; width: 48px; height: 48px;">
								<% } %>
	    					</div>
						</a>
						<div class="tour-info">
		 					<div class="tour_location_div">
		 						<label class="tour_location">
		 						
		 							<%= rating.getCountry() %>, <%= rating.getCity() %>
		 						
		 						</label>
		 					</div>

		 					<div class="tour_title_div" >
		 						<h2 class="rocommend_1_title">
		 							<a href="t_info.jsp?t_id=<%=rating.getT_id() %>">
                    					<%=rating.getT_name()%>
                					</a>
		 						</h2>
		 					</div>
		 				
		
							<div class="recommend_price" id="formattedPrice<%=rating.getT_price()%>"> <!-- 가격 -->
								<strong> <%=rating.getT_price()%></strong>
							</div>
						
						<script>
							function formatNumberWithCommas(number) {
								// 가격에 컴마 추가
							return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							}
							document.addEventListener('DOMContentLoaded', function() {
								var priceElement = document.getElementById('formattedPrice<%=rating.getT_price()%>');
								var priceText = priceElement.textContent;
								var price = parseInt(priceText.replace(/[^\d]/g, '')); // 가격을 숫자로 파싱
								priceElement.textContent = '₩ ' + formatNumberWithCommas(price) + ' 원';
							});
						</script>     
				
			
							<div class="appraisal" id="appraisal">			
								<div class="rating_num">
									<strong>평점</strong>
									<div class="star-rating">
    									<div class="star-rating" style="color: rgba(250, 208, 0, 0.99);">
       										<span class="star" data-rating="<%=rating.getAvg_rating() %>"></span>
    									</div>										
									</div>
								</div>
								<div class="review_num">
									<strong>리뷰 수 </strong> <%=rating.getReview_count() %>							
								</div>
					
							</div> 
						</div> <!-- tour-info -->
					</div> <!-- recommend_city1 -->
        				<% } %>
    			</div> <!-- recommend_city -->
			</div> <!-- popular_tour_div -->

			<div class="recommend_ticket" style="margin-bottom: 50px;">
			<div style="display: flex;" >
				<div style="margin-right: 10px;">
    				<img alt="hotel title icon" src="./image/tour/hotel_title.png">
    			</div>
    			<div>
    				<h1 style="text-align: center; margin-bottom: 15px;">추천 호텔</h1>
    			</div>
    		</div>
    <div class="hotel-container">
        <div class="hotel-div">
       <%
        ArrayList<H_getset> a3 = id.h1();
        ArrayList<H_getset> allHotels = new ArrayList<>();

        
        allHotels.addAll(a3);

        
        Collections.shuffle(allHotels);

        H_getset selectedUkHotel = null;
        H_getset selectedFranceHotel = null;
        H_getset selectedSpainHotel = null;
        H_getset selectedItalyHotel = null;

        for (H_getset h : allHotels) {
            if (selectedUkHotel == null && "uk".equals(h.getCountry_eng())) {
                selectedUkHotel = h;
            } else if (selectedFranceHotel == null && "france".equals(h.getCountry_eng())) {
                selectedFranceHotel = h;
            } else if (selectedSpainHotel == null && "spain".equals(h.getCountry_eng())) {
                selectedSpainHotel = h;
            } else if (selectedItalyHotel == null && "italy".equals(h.getCountry_eng())) {
                selectedItalyHotel = h;
            }

            if (selectedUkHotel != null && selectedFranceHotel != null && selectedSpainHotel != null && selectedItalyHotel != null) {
                break;
            }
        }
    %>
				
				<!-- 영국 호텔  -->
				<div class="recommend_hotel" id="recommend_hotel_uk">
					<div style="display: flex;"><img alt="ukflag" src="./image/tour/ukflag.png" height="30px;" style="margin-left: auto; "><h3 style="margin: auto auto auto 0;">영국</h3></div>
    				<div class="recommend_img">
        				<a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedUkHotel.getH_name_eng() %>"><img src="./image/hotel/h_image/<%= selectedUkHotel.getH_pho() %>"  alt="추천 호텔 1"></a>
    				</div>
    				<div style="text-align: center; margin-top: 15px;">
        				<div class="hotel_info" >
            				<div>
                				<%= selectedUkHotel.getCountry_ko() %>, <%= selectedUkHotel.getCity_ko() %>
            				</div>
            				<div>
                				★ <%= selectedUkHotel.getH_grade() %> 성급
            				</div>
        				</div>
        				<div style="height: 40px; margin-top: auto; margin-bottom: auto;">
            				<h3 class="hotel_name"><a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedUkHotel.getH_name_eng() %>"><%= selectedUkHotel.getH_name_ko() %></a></h3>
        				</div>
    				</div>
				</div>

				<!-- 프랑스 호텔  -->
				<div class="recommend_hotel" id="recommend_hotel_france">
					<div style="display: flex;"><img alt="frflag" src="./image/tour/frflag.png" height="30px;" style="margin-left: auto; "><h3 style="margin: auto auto auto 0;">프랑스</h3></div>
    				<div class="recommend_img">
        				<a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedFranceHotel.getH_name_eng() %>"><img src="./image/hotel/h_image/<%= selectedFranceHotel.getH_pho() %>"  alt="추천 호텔 1"></a>
    				</div>
    				<div style="text-align: center; margin-top: 15px;">
        				<div class="hotel_info" >
            				<div>
                				<%= selectedFranceHotel.getCountry_ko() %>, <%= selectedFranceHotel.getCity_ko() %>
            				</div>
            				<div>
                				★ <%= selectedFranceHotel.getH_grade() %> 성급
            				</div>
        				</div>
        				<div style="height: 40px; margin-top: auto; margin-bottom: auto;">
				            <h3 class="hotel_name"><a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedFranceHotel.getH_name_eng() %>"><%= selectedFranceHotel.getH_name_ko() %></a></h3>
        				</div>				
    				</div>
				</div>

				<!-- 스페인 호텔  -->
				<div class="recommend_hotel" id="recommend_hotel_spain">
					<div style="display: flex;"><img alt="esflag" src="./image/tour/esflag.png" height="30px;" style="margin-left: auto; "><h3 style="margin: auto auto auto 0;">스페인</h3></div>
    				<div class="recommend_img">
        				<a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedSpainHotel.getH_name_eng() %>"><img src="./image/hotel/h_image/<%= selectedSpainHotel.getH_pho() %>"  alt="추천 호텔 1"></a>
    				</div>
    				<div style="text-align: center; margin-top: 15px;">
        				<div class="hotel_info" >
            				<div>
                				<%= selectedSpainHotel.getCountry_ko() %>, <%= selectedSpainHotel.getCity_ko() %>
				            </div>
            				<div>
                				★ <%= selectedSpainHotel.getH_grade() %> 성급
            				</div>
        				</div>
        				<div style="height: 40px; margin-top: auto; margin-bottom: auto;">
            				<h3 class="hotel_name"><a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedSpainHotel.getH_name_eng() %>"><%= selectedSpainHotel.getH_name_ko() %></a></h3>
        				</div>
    				</div>
				</div>
				
				<!-- 이탈리아 호텔  -->
				<div class="recommend_hotel" id="recommend_hotel_italy">
					<div style="display: flex;"><img alt="itaflag" src="./image/tour/itaflag.png" height="30px;" style="margin-left: auto; "><h3 style="margin: auto auto auto 0;">이탈리아</h3></div>
				    <div class="recommend_img">
        				<a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedItalyHotel.getH_name_eng() %>"><img src="./image/hotel/h_image/<%= selectedItalyHotel.getH_pho() %>" alt="추천 호텔 1"></a>
    				</div>
    				<div style="text-align: center; margin-top: 15px;">
        				<div class="hotel_info" >
            				<div>
                				<%= selectedItalyHotel.getCountry_ko() %>, <%= selectedItalyHotel.getCity_ko() %>
            				</div>
            				<div>
                				★ <%= selectedItalyHotel.getH_grade() %> 성급
            				</div>
        				</div>
        				<div style="height: 40px; margin-top: auto; margin-bottom: auto;">
            				<h3 class="hotel_name"><a href="information.hotel?uname=hotelinfom&hotelname=<%= selectedItalyHotel.getH_name_eng() %>"><%= selectedItalyHotel.getH_name_ko() %></a></h3>
        				</div>
    				</div>
				</div>
				
        </div> <!--hotel-div  -->
        
    </div> <!--hotel-container  -->

    
			</div> <!-- recommend_ticket -->



	</jsp:useBean>
		</div>  <!--content-->

		<footer>
			<div id="footer"></div>
		</footer>

	
</body>

<script>
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";

		setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
	}
</script>

<script>
	var slideIndextext = 0;
	showSlidestext();

	function showSlidestext() {
		var i;
		var slidetext = document.getElementsByClassName("slidetext");

		for (i = 0; i < slidetext.length; i++) {
			slidetext[i].style.display = "none";
		}
		slideIndextext++;
		if (slideIndextext > slidetext.length) {
			slideIndextext = 1
		}
		slidetext[slideIndextext - 1].style.display = "block";

		setTimeout(showSlidestext, 2000); // 2초마다 이미지가 체인지됩니다
	}
</script>
  

    <!-- 별점 -->
    <script>
const starElements = document.querySelectorAll(".star");

starElements.forEach(function(star) {
    const rating = parseFloat(star.getAttribute("data-rating"));
    const roundedRating = Math.round(rating); // 반올림한 숫자를 가져옵니다.

    for (let i = 1; i <= 5; i++) {
        const starItem = document.createElement("span");
        starItem.className = "star-item";

        if (i <= roundedRating) {
            starItem.innerHTML = "★"; // 별 표시
        } else {
            starItem.innerHTML = "☆"; // 별 표시하지 않음
        }

        star.appendChild(starItem);
    }
});

</script>
</html>