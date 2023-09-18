<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>

<meta charset="UTF-8">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="./css/main_reset.css">
    <link rel="stylesheet" href="./css/main_index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
     <meta name="msapplication-TileColor" content="#ffffff">

    <meta name="msapplication-TileImage" content="images/header/fabi/ms-icon-144x144.png">
    <meta name="msapplication-TileImage" content="images/logo/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <title>ADVENTOUR</title>
</head>

<body>

 <p id="skipNav"><a href="#content">본문바로가기</a></p>

    <div id="wrap">
        <header id="header">
            <div class="top-menu-bg">
                <div class="container">
                    <ul class="top-menu">
                    <li>
                    <%
						if(session.getAttribute("id") == null) {
					%>
					<% response.sendRedirect("g_logout.jsp"); %>
					<%
						}
					%>
					<%= session.getAttribute("id") %>님 안녕하세요.
					
					</li>
                        <li><a href="index_login_ing.jsp">홈</a></li>
                        <li><a href="./g_logout.jsp">로그아웃</a></li>
                        <li><a href="./member_pjs.html">회원가입</a></li>
                        <li><a href="#">고객문의</a></li>
                    </ul>
                </div>
            </div>
            <div class="container">
                <div class="logo">
                    <a href="index_login_ing.jsp"><img src="./image/share/main_logo_T_G.png" alt="ADVENTOUR">
                    
                    </a>
                </div>
                <ul class="gnb">
                    <li><a href="tour_login.jsp">투어</a></li>
                    <li><a href="./bus_login.jsp">버스</a></li>
                    <li><a href="hotel.html">호텔</a></li>
                    <li><a href="shop_index.html">쇼핑몰</a></li>
                    <li><a href="community.html">고객센터</a></li>
                </ul>
                <div class="more-menu">
                    <li><i class="xi-search"></i><span>검색</span></li>
                    <li><i class="xi-group"></i><span>단체</span></li>
                    <li><i class="xi-network-company"></i><span>기업체</span></li>
                    <li><i class="xi-market"></i><span>상품몰</span></li>
                </div>
            </div>
            <div class="openDiv">
                <div class="openDivInner">
                    <div class="openingHours">
                        <span class="date">날짜칸</span>
                        <p>고객센터</p>
                        <strong>운영시간</strong><br><br>
                        <strong>시간</strong>
                    </div>
                    <ul class="sub-menu">
                        <a href="package.html">
                            <li>투어<i class="xi-angle-right"></i></li>
                        </a>
                    </ul>
                    <ul class="sub-menu">
                        <a href="airport.html">
                            <li>버스<i class="xi-angle-right"></i></li>
                        </a>
                        <!-- <a href="hotel.html">
                            <li>호텔<i class="xi-angle-right"></i></li>
                        </a>
                        <a href="rent.html">
                            <li>렌터카<i class="xi-angle-right"></i></li>
                        </a> -->
                    </ul>
                    <ul class="sub-menu">
                        <a href="active.html">
                            <li>호텔<i class="xi-angle-right"></i></li>
                        </a>
                        <!-- <a href="museum.html">
                            <li>공원/전시/박물관<i class="xi-angle-right"></i></li>
                        </a>
                        <a href="food.html">
                            <li>Restaurant<i class="xi-angle-right"></i></li> -->
                        </a>
                    </ul>
                    <ul class="sub-menu">
                        <a href="promotion.html">
                            <li>쇼핑몰<i class="xi-angle-right"></i></li>
                        </a>
                        <a href="#">
                            <li>제휴/멤버십<i class="xi-angle-right"></i></li>
                        </a>
                    </ul>
                    <ul class="sub-menu">
                        <a href="notice.html">
                            <li>공지사항<i class="xi-angle-right"></i></li>
                        </a>
                        <a href="qna.html">
                            <li>자주 묻는 질문<i class="xi-angle-right"></i></li>
                        </a>
                    </ul>
                    <a href="#">
                        <div class="openDivBanner">
                            <strong><em>앱 다운로드</em>로<br>더 스마트하고<br>편리하게!</strong>
                            <img src=" " alt="googleplay">
                        </div>
                    </a>
                </div>
            </div>
        </header>

        <section id="visual" class="main-visual">
            <div class="inner">
                <div class="visualSearchBox">
                    <strong>
                        <em>어떤 곳으로 떠날까요?</em>
                    </strong>
                    <div class="visual-res">
                        <ul class="visual-sel-tab">
                            <li class="on">투어</li>
                            <li>버스</li>
                            <li>호텔</li>
                        </ul>
                        <!-- 검색 탭 -->
                        <ul class="visual-res-tab">
                            
                            <!-- 투어탭 -->

                            <li class="res-tab-pack on">

                                <div>
                                    <input type="text" name="" id="" class="whereToGo" placeholder="어디로 떠나세요?">
                                    <div class="where-to-travel">
                                        
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
                                        

                                        <button class="start-travel-date">
                                            <i class="xi-calendar"></i><span>여행시작일 선택</span>
                                        </button>
                                        <div class="startTravelCalendar">
                                            <table class="Calendar">
                                                <thead>
                                                    <tr>
                                                        <td style="cursor:pointer;">&#60;
                                                        </td>
                                                        <td colspan="5">
                                                            <span id="calYear"></span>년
                                                            <span id="calMonth"></span>월
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
                                   
                                    <a href="tour_login.jsp"><button class="res-tab-submit">투어 검색</button></a>
                                </div>
                            </li>

                            <!-- 버스 탭 -->
                            <!-- <li class="res-tab-air"> -->
                                <li class="res-tab-bus">
                                <div>
                                    <input type="text" name="" id="" class="howToGo" placeholder="출발 도시를 선택해주세요">

                                    <div class="how-to-go">
                                        
                                        <!--  -->
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
                                        <!--  -->
                                        
                                    </div>
                                    <!-- 도착 도시 -->
                                    <div>
                                        <!-- 수정 필요 -->
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


                                    <!--  -->
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

                            <!-- 호텔 -->
                            <li class="res-tab-hotel">
                                <div>
                                    <input type="text" name="" id="" class="whereToHotel" placeholder="어디로 떠나세요?">
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
                                    <!-- 호텔 숙박 검색 탭 여기까지 // -->
                                    
                                    <div class="depart-start">
                                        <button class="start-travel-date">
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
                                    <a href="hotel.html"><button class="res-tab-submit">숙소 검색</button></a>
                                </div>
                            </li>
                        </ul>
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
                                                <strong>이베로스타 셀렉션 파세오 데 그라시아</strong>
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
                <div class="con-box discount-package recommend">
                   
                    <div class="inner">
                        <a href="" >
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

        <footer id="footer">
            <div class="footerInner">
                <div class="info">
                    <div class="infoText">
                        <span>footer</span>
                        <!-- <span><a href="#">회사소개</a></span>
                        <span><a href="#">이용약관</a></span>
                        <span><a href="#">여행약관개인정보처리방침</a></span>
                        <span><a href="#">해외여행자보험</a></span>
                        <span><a href="#">마케팅제휴</a></span>
                        <span><a href="#">공식인증예약센터 검색</a></span><br>
                        <span><strong>(주)이젠제주투어</strong></span>
                        <span><strong>대표</strong> 김하진</span>
                        <span><strong>주소</strong> (00000) 인천광역시 부평구 청천동 0길 00</span><br>
                        <span><strong>사업자등록번호</strong> 102-81-00000</span>
                        <span><strong>통신판매업신고번호</strong> 부평01-1806호</span>
                        <span><strong>관광사업자 등록번호</strong> 제1993-000006호</span><br>
                        <span><strong>개인정보 보호책임자</strong> 전준형</span>
                        <span><strong>가입팩스</strong> 02-734-0392</span>
                        <span><strong>이메일</strong> ezenacd@jeju.com</span><br>
                        <span><strong>고객센터</strong> 1577-0000</span>
                        <span><strong>항공권문의</strong> 1899-0000</span><br><br>
                        <span><strong>※ 부득이한 사정에 의해 여행일정이 변경되는 경우 사전 동의를 받습니다.</strong></span><br><br>
                        <span><strong>※ 이젠제주투어는 개별 항공권, 단품 및 일부 여행상품에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해
                                책임을 지지
                                않습니다.</strong></span><br><br>
                        <span><strong>COPYRIGHTⓒ EZENJEJUTOUR SERVICE INC. ALL RIGHTS RESERVED</strong></span> -->
                    </div>
                    <div class="infoSns">
                        <div class="infoSnsItem">
                            <a href="#"><img src="images/footer/icon/instagram.png" alt="인스타그램"></a>
                            <a href="#"><img src="images/footer/icon/facebook.png" alt="페이스북"></a>
                            <a href="#"><img src="images/footer/icon/naverblog.png" alt="네이버 블로그"></a>
                            <a href="#"><img src="images/footer/icon/youtube.png" alt="유튜브"></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- // footer -->
    </div>
    
    <!-- <script src="./js/main_index.js"></script> -->


</body>
<script src="./js/main_index.js"></script>
</html>