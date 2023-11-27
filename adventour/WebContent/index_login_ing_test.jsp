<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_rating_getset"%>
<%@ page import="getset.tourlist_gs"%>
<%@ page import="getset.H_getset" %>
<!DOCTYPE html>
<html>
    
<head>
   <meta charset="UTF-8">
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- <link rel="stylesheet" href="./css/main_reset.css"> -->
    <!-- <link rel="stylesheet" href="./css/main_index.css">  -->
    <link rel="stylesheet" href="./css/main_index_2.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="./js/main_index.js"></script>
    <script src="./js/main_index_2.js"></script>    

    <title>ADVENTOUR</title>
    
</head>

<body>

		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<div id="header"></div>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>

		<%
			List<tourlist_gs> a1 = (List<tourlist_gs>) request.getAttribute("list");
		%>


        <section id="visual" class="main-visual">
            <div class="inner">
                <div class="visualSearchBox" >
                    <strong>
                        <em>어떤 곳으로 떠날까요?</em>
                    </strong>
                    <div class="tab_list">
    <input id="tab1" type="radio" name="tabs" checked>
    <label class="tab_menu" for="tab1">투어</label>
    <input id="tab2" type="radio" name="tabs">
    <label class="tab_menu" for="tab2">호텔</label>
    <input id="tab3" type="radio" name="tabs">
    <label class="tab_menu" for="tab3">버스</label>

    <div class="content" id="res-tab-tour">
        <div class="container">
            <!--  -->
<div class="t_flag">
        <div id="flag_1" class="flag_row">
          <div id="ukimg" class="country_name" style="margin-right: 25px; text-align: center;">
			<a href="t_list_country.jsp?country_eng=uk">
            	<img class="uk_flag" id="flag" src="image/img/uk.png">
            	<h3>영국</h3>
			</a>            
          </div>
          
          <div id="fraimg" class="country_name"style="margin-left: 25px; text-align: center;">
			<a href="t_list_country.jsp?country_eng=france">
            	<img class="fr_flag" id="flag" src="image/img/fra.png">
            	<h3>프랑스</h3>
			</a>
          </div>
		</div >
		<div id="flag_2" class="flag_row">
          <div id="spaimg" class="country_name" style="margin-right: 25px; text-align: center;">
          	<a href="t_list_country.jsp?country_eng=spain">
            	<img class="es_flag" id="flag" src="image/img/spain.png">
            	<h3>스페인</h3>
            </a>
          </div>
          
          <div id="itaimg" class="country_name" style="margin-left: 25px; text-align: center;">
          	<a href="t_list_country.jsp?country_eng=italy">
            	<img class="ita_flag" id="flag" src="image/img/ity.png">
            	<h3>이탈리아</h3>
            </a>
          </div>
		</div>
        </div>
            
            <!--  -->
        </div>
    </div>

    <div class="content" id="res-tab-hotel">
        <div class="container">
    <select id="countrySelect" class="whereToHotel" placeholder="국가 선택">
      <option value="" disabled selected>국가 선택</option>
      <option value="영국">영국</option>
      <option value="프랑스">프랑스</option>
      <option value="스페인">스페인</option>
      <option value="이탈리아">이탈리아</option>
    </select>

    <select id="citySelect" class="whereToHotel" placeholder="도시 선택">
      <option value="" disabled selected>도시 선택</option>
    </select>

    <div class="where-to-hotel">
      <div class="where-to-uk">
        <ul>
          <li>런던</li>
          <li>리버풀</li>
          <li>에딘버러</li>
        </ul>
      </div>
      <div class="where-to-france">
        <ul>
          <li>파리</li>
          <li>마르세유</li>
          <li>모나코</li>
        </ul>
      </div>
      <div class="where-to-spain">
        <ul>
          <li>마드리드</li>
          <li>바르셀로나</li>
          <li>세비야</li>
        </ul>
      </div>
      <div class="where-to-italy">
        <ul>
          <li>로마</li>
          <li>베네치아</li>
          <li>밀라노</li>
        </ul>
      </div>
    </div>

    <!-- 호텔 숙박 검색 탭 여기까지 // -->
    <div class="depart-start">
      <input type="text" id="datepicker" class="start-travel-date" placeholder="여행 시작일">
      <input type="text" id="datepicker2" class="end-travel-date" placeholder="여행 종료일">
    </div>
  <script>
    $(document).ready(function () {
      $(".start-travel-date").datepicker();
      $(".end-travel-date").datepicker();
    });
  </script>
    <div class="hotel-choose">
      <label> <span id="peopleCount"></span></label>
    </div>
    <div class="hotel-choose-box">
      <ul>
        <li class="adultCount">
          <label>성인</label>
          <div class="count-change">
            <button class="decrement" data-type="adult">-</button>
            <span id="adultNumber" class="countResult">1</span>
            <button class="increment" data-type="adult">+</button>
          </div>
        </li>
        <li class="childCount">
          <label>아동</label>
          <div class="count-change">
            <button class="decrement" data-type="child">-</button>
            <span id="childNumber" class="countResult">0</span>
            <button class="increment" data-type="child">+</button>
          </div>
        </li>
      </ul>
      <button class="complete">완료</button>
    </div>
    <a href="hotel_login.jsp"><button class="res-tab-submit">숙소 검색</button></a>
        </div>
    </div>

    <div class="content" id="res-tab-bus">
        <div class="container">
            bus bus
        </div>
    </div>
</div>
                </div>

                <div class="visualBanner">
                    <ul class="mainVisualBanner">
                        <li>
                            <a href="hotel.html">
                                <!-- <img src="images/main/visual/hotel_event_banner1.png" alt="마이파사드 애월점"> -->
                                <img src="./image/main_index/banner/hotel_event_banner1.png" alt="호텔 행사">
                            </a>
                        </li>
                        <li>
                            <a href="hotel.html">
                                <img src="./image/main_index/banner/hotel_event_banner1.png" alt="호텔 행사">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/september_event.jpg" alt="9월 행사">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/september_event_banner2.png" alt="추석">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/spain_right_banner.png" alt="스페인">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/tour_right_banner.png" alt="홍보">
                            </a>
                        </li>
                        <li>
                            <a href="index.html">
                                <img src="./image/main_index/banner/promo_right_banner.png" alt="행사">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/paris_tour_banner_1.png" alt="파리">
                            </a>
                        </li>
                        <li>
                            <a href="tour.html">
                                <img src="./image/main_index/banner/paris_tour_banner_1.png" alt="파리">
                            </a>
                        </li>
                    </ul>
                    <div class="visualNavBox">
                        <p class="visualNav">
                            <span class="currentPage">1 / 7</span>
                            <button class="btn visualPrev"><i class="xi-angle-left"></i></button>
                            <button class="btn visualNext"><i class="xi-angle-right"></i></button>
                        </p>
                        <p class="visualNavPlay">
                            <button><i class="xi-pause"></i></button>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- // visual -->

        <main id="container" class="main">
            <section id="content">
                <div class="con-box discount-package package1">
                    <div class="inner">
                        <h3>지금 놓치면 후회할 ✨추천상품✨ 모음집!!</h3>
                        <ul>
                            <li>
                                <a href="airport.html">
                                    <div class="discount-pack1">
                                        
                                        <div class="imgcover1"><img src="./image/main_index/md/london_tour1.png" alt="런던 투어"></div>
                                                <strong>런던 야경 도보 투어</strong>
                                                <span>런던핵심 스팟 가이드와 야경투어 가보자!</span>
                                                <p class="price">10,900<em>원~</em></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="airport.html">
                                    <div class="discount-pack2">
                                        <div class="imgcover1"><img src="./image/main_index/md/louvre.png" alt="루브르 투어"></div>
                                                <strong>루브르 박물관 가이드 투어</strong>
                                                <span>경력 10년의 가이드와 함께하는 루브르 박물관 투어 </span>
                                                <p class="price">19,900<em>원~</em></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="package.html">
                                    <div class="discount-pack3">
                                        <div class="imgcover1"><img src="./image/main_index/md/sagrada.jpg" alt="사그라다 파밀리아">
                                        </div>
                                        <strong>가우디 핵심 투어</strong>
                                        <span>반나절만에 구경하는 가우디 투어!</span>
                                        <p class="price">34,000<em>원~</em></p>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="package.html">
                                    <div class="discount-pack4">
                                        <div class="imgcover1"><img src="./image/main_index/md/rome.png" alt="48시간 제주여행 올-패스">
                                        </div>
                                        <strong>로마 역사 투어</strong>
                                        <span>콜로세움, 포로 로마노, 팔라티노 언덕 가이드 </span>
                                        <p class="price">15,900<em>원~</em></p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="con-box discount-package package2">
                    <div class="inner">
                        <h2>호텔과 투어를 한번에!</h2>
                        <div class="free-travel-flow">
                            <ul class="free-travel-list">
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            
                                                <div class="imgcover2"><img src="./image/main_index/package/paris_hotel1.png">
                                                    alt="풀먼 파리 투르 에펠"></div>
                                            <div class="pack3-txt">
                                                <strong>풀먼 파리 투르 에펠</strong>
                                                <span>파리의 랜드마크 투어와 5성급 호텔 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/barca_hotel1.png" alt="이베로스타 셀렉션 파세오 데 그라시아">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong style="    overflow: hidden;
    white-space: nowrap;
    max-width: 100%;
    text-overflow: ellipsis;">이베로스타 셀렉션 파세오 데 그라시아</strong>
                                                <span>가우디 핵심 투어 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/sevilla_hotel1.png" alt="호텔 페르난도 III">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>호텔 페르난도 III</strong>
                                                <span>플라멩코 공연 + 석식 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/paris_disney_hotel1.jpg" alt="파리 디즈니 호텔 산타 페">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>파리 디즈니 호텔 산타 페</strong>
                                                <span>디즈니랜드 입장권 2매 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/london_hotel1.png"
                                                    alt="스트랜드 팰리스 호텔 런던">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>스트랜드 팰리스 호텔 런던</strong>
                                                <span>토트넘 경기 직관과 4성급 호텔에서의 2박</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/liverpool_hotel1.png"
                                                    alt="스테이브리지 스위트 리버풀">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>스테이브리지 스위트 리버풀</strong>
                                                <span>비틀즈 투어 + 숙박 2박3일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/pac_main6.jpg" alt="호텔샬롬">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>호텔샬롬</strong>
                                                <span>런던 핵심 랜드마크 투어 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/pac_main15.jpg" alt="토스카나">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>토스카나</strong>
                                                <span>스톤헨지 + 바스 투어와 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                               
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/milan_hotel1.png"
                                                    alt="이비스 밀라노 센트로">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>이비스 밀라노 센트로</strong>
                                                <span>밀라노 대성당 가이드 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/edinburgh_hotel1.png"
                                                    alt="노보텔 에든버러 파크">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>노보텔 에든버러 파크</strong>
                                                <span>위스키 양조장 투어 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/benezia_hotel1.png" alt="루치니 팰리스 호텔">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>루치니 팰리스 호텔</strong>
                                                <span>부라노 섬 가이드 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="package.html">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/monaco_hotel1.png"
                                                    alt="호텔 콜럼버스 몬테 카를로">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong>호텔 콜럼버스 몬테 카를로</strong>
                                                <span>모나코 가이드와 걸어서 한바퀴 + 숙박 1박2일</span>
                                                <button class="more">더보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <button class="btn free-travel-prev"><i class="xi-angle-left"></i></button>
                        <button class="btn free-travel-next"><i class="xi-angle-right"></i></button>
                    </div>
                </div>
                <!-- 배너 -->
                <div class="con-box discount-package recommend" style="height: 320px;">
                   
                    <div class="inner">
                        <a href="t_list_country.jsp?country_eng=uk" >
                        <img src="./image/main_index/contents/london-tour-banner6.png" >

                        </a>
                    </div>
                </div>
                <!--  -->

                <div class="con-box best-goods" >
                    <div class="inner">
                        <h3>BEST 인기상품</h3>
                        <!-- 이미지는 css에 연결해놓았음// best 인기상품 사진 검색하면 나옴  -->
                        <ul class="goods-nav">
                            <li class="on"><span>호텔</span></li>
                            <li class=""><span>투어</span></li>
                            <li class=""><span>쇼핑몰</span></li>
                        </ul>
                        <ul class="goods-view">
                            <li class="goods-hotel on">
                                <a href="hotel.html">
                                    <div class="first">
                                        <div class="badge">
                                            <span>TOP</span>
                                            <em>1</em>
                                        </div>
                                        <p>
                                            <strong>파리 디즈니 호텔 산타 페</strong>
                                            <strong>341,000원~</strong>
                                        </p>
                                    </div>
                                </a>
                                <div class="view-right">
                                    <a href="hotel.html">
                                        <div class="second">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>2</em>
                                            </div>
                                            <p>
                                                <strong>시타딘 투르 에펠 파리</strong>
                                                <strong>296,000원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                    <a href="hotel.html">
                                        <div class="third">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>3</em>
                                            </div>
                                            <p>
                                                <strong>바르셀로나 H10 카사 미모사</strong>
                                                <strong>522,000원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="goods-rentcar">
                                <a href="tour.html">
                                    <div class="first">
                                        <div class="badge">
                                            <span>TOP</span>
                                            <em>1</em>
                                        </div>
                                        <p>
                                            <strong>베르사유 궁전 가이드 투어</strong>
                                            <strong>39,000원~</strong>
                                        </p>
                                    </div>
                                </a>
                                <div class="view-right">
                                    <a href="tour.html">
                                        <div class="second">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>2</em>
                                            </div>
                                            <p>
                                                <strong>리버풀 비틀즈 투어</strong>
                                                <strong>24,700원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                    <a href="tour.html">
                                        <div class="third">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>3</em>
                                            </div>
                                            <p>
                                                <strong>세비야 플라멩코 투어</strong>
                                                <strong>35,000원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="goods-place">
                                <a href="shop_index.html">
                                    <div class="first">
                                        <div class="badge">
                                            <span>TOP</span>
                                            <em>1</em>
                                        </div>
                                        <p>
                                            <strong>유럽 4G SIM card</strong>
                                            <strong>16,990원~</strong>
                                        </p>
                                    </div>
                                </a>
                                <div class="view-right">
                                    <a href="shop_index.html">
                                        <div class="second">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>2</em>
                                            </div>
                                            <p>
                                                <strong>뮤지엄 패스</strong>
                                                <strong>92,000원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                    <a href="shop_index.html">
                                        <div class="third">
                                            <div class="badge">
                                                <span>TOP</span>
                                                <em>3</em>
                                            </div>
                                            <p>
                                                <strong>파리 디즈니랜드 입장권</strong>
                                                <strong>88,500원~</strong>
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>

                

            </section>
        </main>
        <!-- // main -->

		<%-- <footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer> --%>
        <!-- // footer -->

 
 
</body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
  $(document).ready(function () {
    var countrySelect = document.getElementById("countrySelect");
    var citySelect = document.getElementById("citySelect");

    // 국가 선택 상자 변경 이벤트 처리
    countrySelect.addEventListener("change", function () {
      var selectedCountry = countrySelect.value;
      updateCityOptions(selectedCountry);
    });

    // 초기에도 도시 목록 업데이트
    updateCityOptions(countrySelect.value);

    // 도시 옵션 업데이트 함수
    function updateCityOptions(country) {
      var citySelect = document.getElementById("citySelect");
      citySelect.innerHTML = '<option value="" disabled selected>도시 선택</option>';

      var cities = getCitiesByCountry(country);
      cities.forEach(function (city) {
        var option = document.createElement("option");
        option.value = city;
        option.text = city;
        citySelect.add(option);
      });
    }

    // 국가에 따른 도시 목록 반환 함수
    function getCitiesByCountry(country) {
      switch (country) {
        case "영국":
          return ["런던", "리버풀", "에딘버러"];
        case "프랑스":
          return ["파리", "마르세유", "모나코"];
        case "스페인":
          return ["마드리드", "바르셀로나", "세비야"];
        case "이탈리아":
          return ["로마", "베네치아", "밀라노"];
        default:
          return [];
      }
    }

    // Datepicker 초기화
    $(".start-travel-date, .end-travel-date").datepicker();

    // 페이지 로드 시 초기값 설정
    updateCounts();

    $(".hotel-choose").click(function () {
      $(".hotel-choose-box").toggleClass("show");
    });

    $(".count-change button").click(function () {
      const type = $(this).data("type");
      const $countElement = $("#" + type + "Number");

      let countValue = parseInt($countElement.text());

      if ($(this).hasClass("increment")) {
        if (type === "adult" && countValue >= 4) {
          return; // 최대값을 초과하지 않도록 방지
        } else if (type === "child" && countValue >= 4) {
          return; // 최대값을 초과하지 않도록 방지
        }
        countValue++;
      } else if ($(this).hasClass("decrement")) {
        if (type === "adult" && countValue <= 1) {
          return; // 최소값 이하로는 감소하지 않도록 방지
        } else if (type === "child" && countValue <= 0) {
          return; // 최소값 이하로는 감소하지 않도록 방지
        }
        countValue--;
      }

      $countElement.text(countValue);
      updateCounts(); // updateCounts 함수 호출 추가
    });

    $(".complete").click(function () {
      $(".hotel-choose-box").removeClass("show");
      updateCounts();
    });

    function updateCounts() {
      const adultCount = parseInt($("#adultNumber").text());
      const childCount = parseInt($("#childNumber").text());

      console.log(adultCount, childCount); // 변수 값 로그에 출력

      $("#peopleCount").text(`성인 ${adultCount}명 / 아동 ${childCount}명`);
    }
  });
</script>



</html>