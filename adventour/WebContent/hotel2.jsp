<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="getset.H_getset"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- JSTL 태그 라이브러리 추가 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>호텔 메인</title>
    <link rel="stylesheet" type="text/css" href="css/hotel.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/hotel.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
    <header>
        <!-- header.html import-->
        <div id="header"></div>
    </header>
    <div class="busmain">
        <img class="busmainpic" src="image/img/hotel01.jpg">
        <div class="b_piccont">
            <h2 class="busmaintit">원하는 여정의 호텔을 검색해 보세요.</h2>
            <div class="b_picti">
                <p class="sch1">원하는 지역이 어디신가요?</p>
                <p class="sch2">체크인</p>
                <p class="sch4">체크아웃</p>
                <p class="sch3">인원수</p>
            </div>
            <div class="b_picsch">
                <input type="text" class="b_mainde" name="b_mainde" placeholder="지역">
                <input type="text" class="b_mainarr" name="b_mainarr" placeholder="체크인">
                <input type="text" class="b_maintime" name="b_maintime" placeholder="체크아웃">
                <input type="text" class="b_maintpeo" name="b_mainpeo" placeholder="총 인원수">
                <button class="b_maintbtn" type="button" name="bsch_btn">검색하기</button>
            </div>
            <!--b_picsch-->
        </div>
        <!--b_piccont-->
    </div>
    <!--busmain-->
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
                            <c:forEach var="aaa" items="${list}">
                                <div class="swiper-slide">
                                    <a href="<c:url value='information.hotel' ><c:param name='uname' value='${aaa.h_name_eng}'/></c:url>">
                                        <img class="top${status.index + 1}" src="image/hotel/h_image/${aaa.h_pho}" alt="" />
                                        <p class="top_contry">${aaa.country_ko} - ${aaa.city_ko}</p>
                                        <p class="top_name">${aaa.h_name_ko}</p>
                                    </a>
                                </div>
                            </c:forEach>
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
                </a>
                <a href="main.hotel?uname=italy">
                    <div class="ityimg">
                        <img class="h_recityimg2" src="image/img/ity.png">
                        <h2 class="ityname">이탈리아</h2>
                    </div>
                </a>
                <a href="main.hotel?uname=france">
                    <div class="fraimg">
                        <img class="h_recityimg3" src="image/img/fra.png">
                        <h2 class="franame">프랑스</h2>
                    </div>
                </a>
                <a href="main.hotel?uname=spain">
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
            <c:forEach var="obj" items="${h_PList}" varStatus="status" begin="0" end="3">
                <div class="package${status.index + 1}">
                    <div class="package1_img">
                        <img src="image/img/${obj.p_pho}">
                    </div>
                    <div class="package1_con">
                        <ul class="package1_ul">
                            <li class="pack_title">${obj.p_name_ko}</li>
                            <li class="pack_con1">${obj.p_title1}</li>
                            <li class="pack_con2">${obj.p_title2}</li>
                            <li class="pack_pri">${obj.p_price}원 ~</li>
                        </ul>
                    </div>
                </div>
                <!--package1-->
            </c:forEach>
        </div>
    </div>
    <!-- footer.html import-->
    <div id="footer"></div>
</body>
</html>
