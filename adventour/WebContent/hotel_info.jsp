<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔스케쥴</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_info.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_info.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 


        <script defer src="googlemap_API/index.js"></script>
        <script
          defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"
        ></script>
   
  </head>

<body>

     <header>
		<!-- header.html import-->
    	<div id="header"></div>
	</header>

  <div class="pagename">
    <h1 class="pagename1">HOTEL</h1>
  </div><!--htitle-->

  <div class="schnav"> <!--검색 네비 = sch -->

    <div class="sch1">
      <h5 class="sch_title">☆ 지역</h5>
      <input type="text" class="sch_city" name="sch_city" placeholder="지역" >
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" class="sch_indate" name="sch_indate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" class="sch_outdate" name="sch_outdate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      성인 : <input type="text" class="sch_adult" name="sch_adult" placeholder="성인"></br>
      유아 : <input type="text" class="sch_kid" name="sch_kid" placeholder="유/소아"></br>
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격">
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="checkbox" class="h_twin"  name="h_twin" value="1">트윈</br>
      <input type="checkbox" class="h_double"  name="h_double" value="1">더블</br>
      <input type="checkbox" class="h_queen"  name="h_queen" value="1">퀸</br>
    </div>


    <div class="sch13">
      <button class="sch_btn" type="button" name="sch_btn">검색하기</button>
    </div>

    </div><!--schnav-->
  
  <div class="content">

    <div class="h_map"> <!--왼쪽 지도-->
      <div id="map" style="height: 290px;"> </div>

    <div class="rinav"> <!--장바구니 등 -->

      <button class="eur" type="button">고객센터</button>
      <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button>
      
    </div>


    </div>

    <div id="hotel_info">

      <div id="hotel_info_phos">

        <div id="hotel_info_pho1">
        <img class="h_info_title_pho1" name="h_info_title_pho1" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho2">
          <img class="h_info_title_pho2" name="h_info_title_pho2" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho3">
          <img class="h_info_title_pho3" name="h_info_title_pho3" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho4">
          <img class="h_info_title_pho4" name="h_info_title_pho4" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho5">
          <img class="h_info_title_pho5" name="h_info_title_pho5" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho6">
          <img class="h_info_title_pho6" name="h_info_title_pho6" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
        <div id="hotel_info_pho7">
          <img class="h_info_title_pho7" name="h_info_title_pho7" src="image/hotel/h_image/h_atolon.PNG" >
        </div>
      
    </div><!--hotel_info_phos-->


    <div id="hotel_info_engname">
      <h2 name="hotel_info_engname ">호텔이름 영문으로 가져와</h2>
    </div>

    <div id="hotel_info_koname">
      <h3 name="hotel_info_koname">(호텔이름 한글로 가져와)</h3>
    </div>

    <div id="hotel_info_addr">
      <h4 name="hotel_info_addr"> 주소 : 주소 가져와 </h4>
    </div>

    <div id="hotel_info_tel">
      <h4 name="hotel_info_tel"> TEL : 전화번호 가져와 </h4>
    </div>

    <div id="hotel_info_options">

      <div id="hotel_info_breakfast">
        <h4 name="hotel_info_breakfast">조식 (y =가능)</h4>
      </div><!--hotel_info_options-->
      
      <div id="hotel_info_pool">
        <h4 name="hotel_info_pool">수영장  (y =있음)</h4>
      </div><!--hotel_info_options-->
      
      <div id="hotel_info_rooftop">
        <h4 name="hotel_info_rooftop">루프탑  (y =있음)</h4>
      </div><!--hotel_info_options-->
    
    </div><!--hotel_info_options-->

    <div id="hotel_room_info">
      <h2 id="hotel_room_type" name="hotel_room_type">double room</h2>
        <div id="h_room_pho" >
          <img id="h_room_phoi" name="h_room_phoi" src="">
        </div>
        <div id="h_room_options1" >
          <h4 name="h_room_peo"> 최대 가능인원 : 4명</h4>
          <h4 name="h_room_bed"> 베드 타입 : 슈퍼 싱글, 2개</h4>
          <h4 name="h_room_breakfast"> 조식 제공 안함</h4>
          <h4 name="h_room_canael"> 취소 가능 여부 : 불가</h4>
          <h4 name="h_room_window"> 창문 있음</h4>
          <h4 name="h_room_smoke"> 금연 </h4>
        </div><!--h_room_options1-->

        <div id="h_room_options2" >
          <h4 name="h_room_paynow"> 결제 : 즉시결제</h4>
          <h4 name="h_room_intime"> 체크인 : 13:00 </h4>
          <h4 name="h_room_outtime"> 체크아웃 : 12:00 </h4>
          <h2 id="h_room_price" name="h_room_price"> 100000 </h2>
          <input id="roompay_btn" type="button" name="roompay_btn" value="결제하기"/>
        </div><!--h_room_options2-->


    </div>



   
  
  
  
  
  
  
  
  
  
  </div><!--hotel_info-->

  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>