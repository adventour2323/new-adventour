<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <div class="header">

      <div class="header1">
        <<img id="logo" width="210px" height="30px" src="image/img/logo123.png" onclick="location.href='./index_login_ing.jsp'" style="cursor: pointer">
  
       
        <div class="home">
          <ul class="homeli">
          <li class="home1">
          			<%
						if(session.getAttribute("id") == null) {
					%>
					<% response.sendRedirect("index_login_ing.jsp"); %>
					<%
						}
					%>
					<%= session.getAttribute("id") %>님 안녕하세요.
					</li>
            <li class="home11" onclick="location.href='./index_login_ing.jsp'" style="cursor: pointer">홈</li>
            <li class="home1" onclick="location.href='./g_logout.jsp'" style="cursor: pointer">로그아웃</li>
            <li class="home1">장바구니</li>
            <li class="home11">메뉴</li>
          </ul>
        </div><!--home-->
  
      </div><!--header1-->
  
      <div class="menu">
        <ul class="menuli">
          <li class="menu1"><button class="movet" onclick = "location.href = 'tour_login.jsp' "><p>투어</p></button> </li>
          <li class="menu2"><button class="moveb" onclick = "location.href = 'bus_login.jsp' "><p>버스</p> </li>
            <li class="menu3"><button class="moveh" onclick = "location.href = 'hotel_login.jsp' "><p>호텔</p></button> </li>
          <li class="menu4"><button class="moves" onclick = "location.href = 'shop_login.jsp' "><p>쇼핑</p></button> </li>
          <li class="menu5"><button class="movec" onclick = "location.href = 'shop_login.jsp' "><p>고객센터</p></button> </li>
          <li class="menu6"><button class="movem" onclick = "location.href = 'shop_login.jsp' "><p>마이페이지</p></button> </li>
        </ul>
      </div><!--menu-->
    </div><!--header-->
  
    <div class="schtop">
   
      <div class="uk_top">
      <ul class="h_cityli1">
        <li class="ukli"> <영국></li>
        <li class="h_lond"><button class="move_lon" onclick = "location.href = 'hotel_sc.html' ">런던</button> </li>
        <li class="h_liverp"><button class="move_liverp" onclick = "location.href = 'hotel_sc.html' ">리버풀</button> </li>
        <li class="h_Edinb"><button class="move_Edinb" onclick = "location.href = 'hotel_sc.html' ">에든버러</button> </li>
      </ul>
      </div>
  
      <div class="ity_top">
      <ul class="h_cityli2">
        <li class="ityli"> <이탈리아></li>
        <li class="h_roma"><button class="move_roma" onclick = "location.href = 'hotel_sc.html' ">로마</button> </li>
        <li class="h_vene"><button class="move_vene" onclick = "location.href = 'hotel_sc.html' ">베네치아</button> </li>
        <li class="h_mila"><button class="move_mila" onclick = "location.href = 'hotel_sc.html' ">밀라노</button> </li>
      </ul>
    </div>
  
  <div class="fra_top">
      <ul class="h_cityli3">
        <li class="frali"> <프랑스></li>
        <li class="h_paris"><button class="move_paris" onclick = "location.href = 'hotel_sc.html' ">파리</button> </li>
        <li class="h_marc"><button class="move_marc" onclick = "location.href = 'hotel_sc.html' ">마르세유</button> </li>
        <li class="h_mona"><button class="move_mona" onclick = "location.href = 'hotel_sc.html' ">모나코</button> </li>
      </ul>
      </div>
  
      <div class="spain_top">
      <ul class="h_cityli4">
        <li class="spainli"> <스페인></li>
        <li class="h_mard"><button class="move_mard" onclick = "location.href = 'hotel_sc.html' ">마드리드</button> </li>
        <li class="h_barc"><button class="move_barc" onclick = "location.href = 'hotel_sc.html' ">바르셀로나</button> </li>
        <li class="h_sev"><button class="move_sev" onclick = "location.href = 'hotel_sc.html' ">세비야</button> </li>
      </ul>
    </div>
  </div><!--schtop-->
  
  
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
        </div><!--b_picsch-->
      </div><!--b_piccont-->
    </div><!--busmain-->

    
  <div  class="h_eventban">

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

    <h2 class="h_retitle"> 추천 인기호텔 TOP10</h2>

    <section class="awards"> <!--이미지스위퍼 -->
      <div class="inner">
        <div class="swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img class="top1" src="image/img/h_top1.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img  class="top2" src="image/img/h_top2.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img class="top3" src="image/img/h_top3.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img  class="top4" src="image/img/h_top4.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img class="top5" src="image/img/h_top5.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img  class="top6" src="image/img/h_top6.jpg" alt="" />
            </div>
            <div class="swiper-slide">
              <img class="top7" src="image/img/eden.jpeg" alt="" />
            </div>
            <div class="swiper-slide">
              <img  class="top8" src="image/img/mona.jpeg" alt="" />
            </div>
            <div class="swiper-slide">
              <img class="top9" src="image/img/eden.jpeg" alt="" />
            </div>
            <div class="swiper-slide">
              <img  class="top10" src="image/img/mona.jpeg" alt="" />
            </div>

          </div>
        </div>
      </div> 
      
      <div class="swiper-buttons">
        <button class="swiper-prev"> < </button> <!--이전버튼-->
        <button class="swiper-next"> > </button> <!-- 다음 버튼-->
      </div>

    </section><!--이미지스위퍼 끝-->
    
    </div> <!--h_retop10 끝 -->
  

    <div class="h_recity">

      <h2 class="h_retitle"> 나라별 검색하기</h2>
        
        <div class="h_recityimgs" >
          <div class="ukimg">
            <img class="h_recityimg1" src="image/img/uk.png">
            <div class="ukname"><h2 > 영국</h2></div>
          </div>

          <div class="ityimg">
            <img class="h_recityimg2" src="image/img/ity.png">
            <h2 class="ityname"> 이탈리아</h2>
          </div>

          <div class="fraimg">
            <img class="h_recityimg3" src="image/img/fra.png">
            <h2 class="franame"> 프랑스</h2>
          </div>

          <div class="spaimg">
            <img class="h_recityimg4" src="image/img/spain.png">
            <h2 class="spaname"> 스페인</h2>
          </div>

          
        </div>

    </div><!--h_recity-->

  </div><!--content-->

  <div class="h_packages">
    <h2> 투어와 함께하는 숙소를 추천해드려요.</h2>

    <div class="h_package">
     
      <div class="package1">
        <div class="package1_img">
          <img src="image/img/pack1.jpeg">
        </div>
        <div class="package1_con">
          <ul class="package1_ul">
             <li class="pack_title">런던 호텔  + 브릿지투어</li>
             <li class="pack_con1">조명이 가득한 브릿지 투어와</li>
             <li class="pack_con2">편안한 호텔을 함께 즐겨보세요.</li>
             <li class="pack_pri">349,000~</li>
          </ul>
        </div>
      </div><!--package1-->

      <div class="package2">
        <div class="package1_img">
          <img src="image/img/pack2.jpeg">
        </div>
        <div class="package1_con">
          <ul class="package1_ul">
            <li class="pack_title">로마 호텔  + 산텔리아 성당투어</li>
            <li class="pack_con1">로마의 향기가 가득한 투어와</li>
            <li class="pack_con2">편안한 호텔을 함께 즐겨보세요.</li>
            <li class="pack_pri">499,000~</li>
         </ul>
        </div>
      </div>

      <div class="package3">
        <div class="package1_img">
          <img src="image/img/pack3.jpeg">
        </div>
        <div class="package1_con">
          <ul class="package1_ul">
            <li class="pack_title">파리 호텔  + 에펠탑 포토투어</li>
            <li class="pack_con1">야경 맛집 에펠탑에서 인생샷과 </li>
            <li class="pack_con2">편안한 호텔을 함께 즐겨보세요.</li>
            <li class="pack_pri">449,000~</li>
         </ul>
        </div>
      </div>

      <div class="package4">
        <div class="package1_img">
          <img src="image/img/pack4.jpeg">
        </div>
        <div class="package1_con">
          <ul class="package1_ul">
            <li class="pack_title">로마 호텔  + 버킹엄투어</li>
            <li class="pack_con1">뷰맛집! 버킹엄 광장과</li>
            <li class="pack_con2">편안한 호텔을 함께 즐겨보세요.</li>
            <li class="pack_pri">349,000~</li>
         </ul>
        </div>
      </div>

    </div>






  </div>

  <footer>
    <div class="footerB">
        <!-- 푸터 네비박스-->
        <div class="fNvB">
            <!--푸터 네비 왼쪽 마진때문에 쩔 수 없이 만든 div임 -->
            <div></div>
            <nav><a href="tour_login.jsp">가이드투어</a></nav>
            <nav><a href="bus_login.jsp">버스</a></nav>
            <nav><a href="hotel_login.jsp">호텔</a></nav>
            <nav><a href="shop_login.jsp">쇼핑몰</a></nav>
            <nav><a href="">고객센터</a></nav>
            <nav><a href="">게시판</a></nav>
            <nav><a href="">장바구니</a></nav>
            <nav><a href="mypage_index.html">마이페이지</a></nav>
            <nav><a href="member_pjs.html">회원가입</a></nav>
            <nav><a href="login_merge_form.jsp">로그인</a></nav>
        </div>
        <!-- 푸터 회사 정보 박스-->
        <div class="fInfoB">
            <span><a><img src="img/logo123.png" title="logo"></a></span>
            <span>
                <p><a>회사주소</br></br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br>
                    </a></p>
            </span>
            <span>
                <p><a>회사 정보</br></br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br>
                    </a></p>
            </span>
        </div>
    </div>
</footer><!---->


</body>
</html>