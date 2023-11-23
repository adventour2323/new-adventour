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
    <link rel="stylesheet" href="./css/main_index.css">
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
               <div class="visualSearchBox" style="margin-top: 100px;">
    <strong>
        <em>어떤 곳으로 떠날까요?</em>
    </strong>
    <div class="visual-res">
        <ul class="visual-sel-tab">
            <li class="on" onclick="showTab('tour')" data-tab="tour">투어</li>
            <li onclick="showTab('hotel')" data-tab="hotel">호텔</li>
            <li onclick="showTab('bus')" data-tab="bus">버스</li>            
        </ul>
        <!-- 검색 탭 -->
        <ul class="visual-res-tab">
            <!-- 투어탭 -->
            <li id="tourTab" class="res-tab-pack on">
                <div>
                    <input type="text" id="whereToGoInput" placeholder="어디로 떠나세요?" onclick="toggleDestinationList()">
  					<div class="where-to-travel" id="destinationList">
                        <div class="where-to-uk">
                            <ul>
                                <li onclick="selectDestination('영국')">영국</li>
                                <li onclick="selectDestination('런던')">런던</li>
                                <li onclick="selectDestination('리버풀')">리버풀</li>
                                <li onclick="selectDestination('에딘버러')">에딘버러</li> 
                            </ul>
                        </div>
                        <div class="where-to-france">
                            <ul>
                                <li onclick="selectDestination('프랑스')">프랑스</li>
                                <li onclick="selectDestination('파리')">파리</li>
                                <li onclick="selectDestination('마르세유')">마르세유</li>
                                <li onclick="selectDestination('모나코')">모나코</li>
                            </ul>
                        </div>
                        <div class="where-to-spain">
                            <ul>
                                <li onclick="selectDestination('스페인')">스페인</li>
                                <li onclick="selectDestination('마드리드')">마드리드</li>
                                <li onclick="selectDestination('바르셀로나')">바르셀로나</li>
                                <li onclick="selectDestination('세비야')">세비야</li>
                            </ul>
                        </div>
                        <div class="where-to-italy">
                            <ul>
                                <li onclick="selectDestination('이탈리아')">이탈리아</li>
                                <li onclick="selectDestination('로마')">로마</li>
                                <li onclick="selectDestination('베네치아')">베네치아</li>
                                <li onclick="selectDestination('밀라노')">밀라노</li>
                            </ul>
                        </div>
                    </div>
                    
                    <a href="main.tour?tour=main"><button class="res-tab-submit">투어 검색</button></a>
                </div>
            </li>
            <!-- 호텔 탭 -->
            <li id="hotelTab" class="res-tab-hotel">
                <div>
                    <input type="text" name="" id="" class="whereToGo" placeholder="어디로 떠나세요?" onclick="showWhereToTravel()">
                    <div class="where-to-hotel">
                        <div class="where-to-uk">
                            <ul>
                                <li>영국</li>
                                <li>런던</li>
                                <li>리버풀</li>
                                <li>에딘버러</li> 
                            </ul>
                        </div>
                        <div class="where-to-france">
                            <ul>
                                <li>프랑스</li>
                                <li>파리</li>
                                <li>마르세유</li>
                                <li>모나코</li>
                            </ul>
                        </div>
                        <div class="where-to-spain">
                            <ul>
                                <li>스페인</li>
                                <li>마드리드</li>
                                <li>바르셀로나</li>
                                <li>세비야</li>
                            </ul>
                        </div>
                        <div class="where-to-italy">
                            <ul>
                                <li>이탈리아</li>
                                <li>로마</li>
                                <li>베네치아</li>
                                <li>밀라노</li>
                            </ul>
                        </div>
                    </div>
                    <div class="depart-start">
                        <button class="start-travel-date" style="margin-right: 10px">
                            <i class="xi-calendar"></i><span>여행시작일 선택</span>
                        </button>
                        <div class="startTravelCalendarStart">
                            <table class="Calendar_Start">
                                <thead>
                                    <tr>
                                        <td style="cursor:pointer;">&#60;
                                        </td>
                                        <td colspan="5">
                                            <span id="calYear_Start"></span>년
                                            <span id="calMonth_Start"></span>월
                                        </td>
                                        <td style="cursor:pointer;">&#62;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>일</td>
                                        <td>월</td>
                                        <td>화</td>
                                        <td>수</td>
                                        <td>목</td>
                                        <td>금</td>
                                        <td>토</td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <button class="end-travel-date">
                            <i class="xi-calendar"></i><span>여행종료일 선택</span>
                        </button>
                        <div class="startTravelCalendarEnd">
                            <table class="Calendar_End">
                                <thead>
                                    <tr>
                                        <td style="cursor:pointer;">&#60;
                                        </td>
                                        <td colspan="5">
                                            <span id="calYear_End"></span>년
                                            <span id="calMonth_End"></span>월
                                        </td>
                                        <td style="cursor:pointer;">&#62;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>일</td>
                                        <td>월</td>
                                        <td>화</td>
                                        <td>수</td>
                                        <td>목</td>
                                        <td>금</td>
                                        <td>토</td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <button class="hotel-choose">
                        <i class="xi-user-o"></i><span>객실 1 / 성인 2명 / 아동 0명</span>
                    </button>
                    <div class="hotel-choose-box">
                        <ul class="hotel-choose-list">
                            <li><i class="xi-close"></i></li>
                            <li class="roomCount">
                                <div>객실 <i class="xi-hotel"></i></div>
                                <div><em> - </em><span>1</span><em> + </em></div>
                            </li>
                            <li class="adultCount">
                                <div>성인 <i class="xi-user"></i></div>
                                <div><em> - </em><span>2</span><em> + </em></div>
                            </li>
                            <li class="childCount">
                                <div>객실 <i class="xi-hotel"></i></div>
                                <div><em> - </em><span>0</span><em> + </em></div>
                            </li>
                            <li><b class="hotel-option-submit">설정</b></li>
                        </ul>
                    </div>
                    <a href="hotel_login.jsp"><button class="res-tab-submit">숙소 검색</button></a>
                </div>
            </li>
            <!-- 버스 탭 -->
            <li id="busTab" class="res-tab-bus">
                <div>
                    <input type="text" name="" id="" class="howToGo" placeholder="출발 도시를 선택해주세요">
                    <div class="how-to-go">
                        <div class="where-to-uk">
                            <ul>
                                <li>영국</li>
                                <li>런던</li>
                                <li>리버풀</li>
                                <li>에딘버러</li> 
                            </ul>
                        </div>
                        <div class="where-to-france">
                            <ul>
                                <li>프랑스</li>
                                <li>파리</li>
                                <li>마르세유</li>
                                <li>모나코</li>
                            </ul>
                        </div>
                        <div class="where-to-spain">
                            <ul>
                                <li>스페인</li>
                                <li>마드리드</li>
                                <li>바르셀로나</li>
                                <li>세비야</li>
                            </ul>
                        </div>
                        <div class="where-to-italy">
                            <ul>
                                <li>이탈리아</li>
                                <li>로마</li>
                                <li>베네치아</li>
                                <li>밀라노</li>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <input type="text" name="" id="" class="howToGo" placeholder="도착 도시를 선택해주세요" style="margin-top: 10px;">
                        <div class="how-to-go">
                            <div class="where-to-uk">
                                <ul>
                                    <li>영국</li>
                                    <li>런던</li>
                                    <li>리버풀</li>
                                    <li>에딘버러</li> 
                                </ul>
                            </div>
                            <div class="where-to-france">
                                <ul>
                                    <li>프랑스</li>
                                    <li>파리</li>
                                    <li>마르세유</li>
                                    <li>모나코</li>
                                </ul>
                            </div>
                            <div class="where-to-spain">
                                <ul>
                                    <li>스페인</li>
                                    <li>마드리드</li>
                                    <li>바르셀로나</li>
                                    <li>세비야</li>
                                </ul>
                            </div>
                            <div class="where-to-italy">
                                <ul>
                                    <li>이탈리아</li>
                                    <li>로마</li>
                                    <li>베네치아</li>
                                    <li>밀라노</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="depart-start">
                        <button class="start-travel-date">
                            <i class="xi-calendar"></i><span>여행시작일 선택</span>
                        </button>
                        <div class="startTravelCalendarAir">
                            <table class="Calendar_Air">
                                <thead>
                                    <tr>
                                        <td style="cursor:pointer;">&#60;
                                        </td>
                                        <td colspan="5">
                                            <span id="calYear_Air"></span>년
                                            <span id="calMonth_Air"></span>월
                                        </td>
                                        <td style="cursor:pointer;">&#62;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>일</td>
                                        <td>월</td>
                                        <td>화</td>
                                        <td>수</td>
                                        <td>목</td>
                                        <td>금</td>
                                        <td>토</td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <a href="bus.html"><button class="res-tab-submit">버스 검색</button></a>
                </div>
            </li>
        </ul>
    </div>
</div>


<script>
document.addEventListener('DOMContentLoaded', function() {
    var whereToTravel = document.getElementById('destinationList');
    whereToTravel.classList.add('active');
});

function toggleDestinationList() {
    console.log("toggleDestinationList 함수 호출됨");
    var whereToTravel = document.getElementById('destinationList');

    // 하위 li 요소들을 가져옴
    var destinationItems = document.querySelectorAll('.where-to-travel li');

    if (whereToTravel.style.display === 'none' || whereToTravel.style.display === '') {
        whereToTravel.style.display = 'flex';

        // 하위 li 요소들을 보이게 함
        destinationItems.forEach(function(item) {
            item.style.display = 'list-item'; // 기본 값인 list-item으로 변경
        });
    } else {
        whereToTravel.style.display = 'none';
    }
}




  function selectDestination(destination) {
    document.getElementById('whereToGoInput').value = destination;
    toggleDestinationList(); // 선택 후에는 목록을 숨깁니다
  }


function showTab(tabName) {
    var whereToTravel = document.querySelector('.where-to-travel');
    whereToTravel.style.display = 'none';

    document.querySelectorAll('.visual-res-tab li').forEach(function (tab) {
        tab.style.display = 'none';
    });

    document.getElementById(tabName + 'Tab').style.display = 'block';

    document.querySelectorAll('.visual-sel-tab li').forEach(function (tabButton) {
        tabButton.classList.remove('on');
    });

    var selectedTabButton = document.querySelector('.visual-sel-tab li[data-tab="' + tabName + '"]');
    if (selectedTabButton) {
        selectedTabButton.classList.add('on');
    }
}


    
</script>



                <div class="visualBanner">
                    <ul class="mainVisualBanner">
                        <li>
                            <a href="main.hotel?uname=hmain">
                                <!-- <img src="images/main/visual/hotel_event_banner1.png" alt="마이파사드 애월점"> -->
                                <img src="./image/main_index/banner/hotel_event_banner1.png" alt="호텔 행사">
                            </a>
                        </li>
                        <li>
                            <a href="main.tour?tour=main">
                                <img src="./image/main_index/banner/september_event.jpg" alt="9월 행사">
                            </a>
                        </li>
                        <li>
                            <a href="main.tour?tour=main">
                                <img src="./image/main_index/banner/september_event_banner2.png" alt="추석">
                            </a>
                        </li>
                        <li>
                            <a href="t_list_country.jsp?country_eng=spain">
                                <img src="./image/main_index/banner/spain_right_banner.png" alt="스페인">
                            </a>
                        </li>
                        <li>
                            <a href="main.tour?tour=main">
                                <img src="./image/main_index/banner/tour_right_banner.png" alt="홍보">
                            </a>
                        </li>
                        <li>
                            <a href="main.tour?tour=main">
                                <img src="./image/main_index/banner/promo_right_banner.png" alt="행사">
                            </a>
                        </li>
                        <li>
                            <a href="t_info.jsp?t_id=f_p_tour">
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
                   <script>
						document.addEventListener("DOMContentLoaded", function() {
							var slideIndex = 0;
							var slides = document.querySelectorAll('.main-visual .visualBanner .mainVisualBanner li');
							var totalSlides = slides.length;
							var slideInterval = 2000; // 3초 간격

							function showSlides() {
								slides[slideIndex].style.display = 'none';
								slideIndex = (slideIndex + 1) % totalSlides;
								slides[slideIndex].style.display = 'flex';

								// 페이지 수 업데이트
								var currentPage = slideIndex + 1;
								document.querySelector('.currentPage').textContent = currentPage + ' / ' + totalSlides;
							}

							var slideTimer = setInterval(showSlides, slideInterval);

							// 이전 버튼 동작
						document.querySelector('.visualPrev').addEventListener('click', function() {
							clearInterval(slideTimer);
							slides[slideIndex].style.display = 'none';
							slideIndex = (slideIndex - 1 + totalSlides) % totalSlides;
							slides[slideIndex].style.display = 'flex';

							// 페이지 수 업데이트
							var currentPage = slideIndex + 1;
							document.querySelector('.currentPage').textContent = currentPage + ' / ' + totalSlides;
							slideTimer = setInterval(showSlides, slideInterval);
						});

						// 다음 버튼 동작
  						document.querySelector('.visualNext').addEventListener('click', function() {
  							clearInterval(slideTimer);
  							slides[slideIndex].style.display = 'none';
  							slideIndex = (slideIndex + 1) % totalSlides;
  							slides[slideIndex].style.display = 'flex';

  							// 페이지 수 업데이트
							var currentPage = slideIndex + 1;
							document.querySelector('.currentPage').textContent = currentPage + ' / ' + totalSlides;
							slideTimer = setInterval(showSlides, slideInterval);
						});

						// 일시 정지 버튼 동작
						document.querySelector('.xi-pause').addEventListener('click', function() {
							clearInterval(slideTimer);
						});
					});
				</script>
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
                                <a href="main.tour?tour=main">
                                    <div class="discount-pack1">
                                        
                                        <div class="imgcover1"><img src="./image/main_index/md/london_tour1.png" alt="런던 투어"></div>
                                                <strong>런던 야경 도보 투어</strong>
                                                <span>런던핵심 스팟 가이드와 야경투어 가보자!</span>
                                                <p class="price">10,900<em>원~</em></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="main.tour?tour=main">
                                    <div class="discount-pack2">
                                        <div class="imgcover1"><img src="./image/main_index/md/louvre.png" alt="루브르 투어"></div>
                                                <strong>루브르 박물관 가이드 투어</strong>
                                                <span>경력 10년의 가이드와 함께하는 루브르 박물관 투어 </span>
                                                <p class="price">19,900<em>원~</em></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="main.tour?tour=main">
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
                                <a href="main.tour?tour=main">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
                                        <div class="free-travel-package">
                                            <div class="imgcover2"><img src="./image/main_index/package/barca_hotel1.png" alt="이베로스타 셀렉션 파세오 데 그라시아">
                                            </div>
                                            <div class="pack3-txt">
                                                <strong style=" overflow: hidden; white-space: nowrap; max-width: 100%; text-overflow: ellipsis;">이베로스타 셀렉션 파세오 데 그라시아</strong>
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
                                    <a href="main.hotel?uname=hmain">
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
<!-- jQuery 로드 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 자바스크립트 코드 -->
<script>
  $(document).ready(function () {
    // 이전 버튼 클릭 시
    $(".free-travel-prev").click(function () {
      // 가장 마지막 이미지를 첫 번째로 이동
      $(".free-travel-list").prepend($(".free-travel-list li:last"));
    });

    // 다음 버튼 클릭 시
    $(".free-travel-next").click(function () {
      // 첫 번째 이미지를 마지막으로 이동
      $(".free-travel-list").append($(".free-travel-list li:first"));
    });
  });
</script>

                    
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
    <li class="on" data-category="hotel"><span>호텔</span></li>
    <li class="" data-category="tour"><span>투어</span></li>
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
                            <li class="goods-tour">
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
                            
                        </ul>

                    </div>
                </div>
<script >
document.addEventListener('DOMContentLoaded', function () {
    // 페이지가 로드되면 실행되는 부분
    // 초기에 호텔 상품 목록을 보여줍니다.
    showGoods('hotel');

    // 이벤트 리스너를 설정합니다.
    document.querySelectorAll('.goods-nav li').forEach(function (item) {
        item.addEventListener('click', function () {
            var category = this.getAttribute('data-category');
            showGoods(category);

            // 현재 클릭한 요소에 'on' 클래스를 추가하고 나머지에서는 제거합니다.
            document.querySelectorAll('.goods-nav li').forEach(function (item) {
                item.classList.remove('on');
            });
            this.classList.add('on');
        });
    });
});

function showGoods(category) {
    // 모든 목록을 숨깁니다.
    document.querySelectorAll('.goods-view > li').forEach(function (item) {
        item.style.display = 'none';
    });

    // 선택한 카테고리에 해당하는 목록을 보여줍니다.
    document.querySelectorAll('.goods-view > li.goods-' + category).forEach(function (item) {
        item.style.display = 'flex';
    });
}
 


</script>
                

            </section>
        </main>
        <!-- // main -->

		<footer>
			<!-- <div id="footer"></div> -->
			<jsp:include page="footer.html"></jsp:include>
		</footer>
        <!-- // footer -->
    <!-- </div> -->
    
    <!-- <script src="./js/main_index.js"></script> -->


</body>

</html>