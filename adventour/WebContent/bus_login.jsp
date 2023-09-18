<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>버스메인</title>
  <link rel="stylesheet" type="text/css" href="css/bus.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/bus.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  </head>
<body>

<div class="header">

    <div class="header1">
    <img id="logo" width="210px" height="30px" src="image/img/logo123.png" onclick="location.href = './index_login_ing.jsp'" style="cursor: pointer;">
     <!--<img id="logo" width="210px" height="30px" src="C:\Users\1\Desktop\adventour-master\adventour-master\adventour\WebContent\img\logo123.png">-->

     
      <div class="home">
        <ul class="homeli">
        		<li>
          			<%
						if(session.getAttribute("id") == null) {
					%>
					<% response.sendRedirect("index_login_ing.jsp"); %>
					<%
						}
					%>
					<%= session.getAttribute("id") %>님 안녕하세요.
					</li>
					
          <li class="home11">메뉴</li>
          <li class="home1">장바구니</li>
          <li class="home1" onclick="location.href='./g_logout.jsp'" style="cursor: pointer">로그아웃</li>
          <li class="home11" onclick="location.href='./index_login_ing.jsp'" style="cursor: pointer"> 홈</li> 
        </ul> 
      </div><!--home-->

    </div><!--header1-->

    <div class="menu">
      <ul class="menuli">
        <li class="menu1"><button class="movet" onclick = "location.href = './tour_login.jsp' "><p>투어</p></button> </li>
        <li class="menu2"><button class="moveb" ><p>버스</p> </li>
          <li class="menu3"><button class="moveh" onclick = "location.href = 'hotel.html' "><p>호텔</p></button> </li>
        <li class="menu4"><button class="moves" onclick = "location.href = 'shop_index.html' "><p>쇼핑</p></button> </li>
        <li class="menu5"><button class="movec" onclick = "location.href = 'shop_index.html' "><p>고객센터</p></button> </li>
        <li class="menu6"><button class="movem" onclick = "location.href = 'shop_index.html' "><p>마이페이지</p></button> </li>
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
        <img class="busmainpic" src="image/img/bus1.jpeg">
    <div class="b_piccont">
      <h2 class="busmaintit">원하는 여정의 버스를 검색해 보세요.</h2>

      <div class="b_picti">
      <p class="sch1">어디에서 출발하나요?</p>
      <p class="sch2">출발시간</p>
      <p class="sch3">인원수</p>  
      </div>

      <div class="b_picsch">
        <input type="text" class="b_mainde" name="b_mainde" placeholder="출발지">
        <input type="text" class="b_mainarr" name="b_mainarr" placeholder="도착지">
        <input type="text" class="b_maintime" name="b_maintime" placeholder="출발시간">
        <input type="text" class="b_maintpeo" name="b_mainpeo" placeholder="총 인원수">
        <button class="b_maintbtn" type="button" name="bsch_btn">검색하기</button>
      </div><!--b_picsch-->
    </div><!--b_piccont-->
  </div><!--busmain-->

  <div class="content">

    <div class="b_de">
    <h2 class="btitle1"> 원하는 버스노선의 출발지를 선택하세요.</h2>

    <div class="busUK">
      <h3>영국</h3>
      <div class="londonimg">
        <img class="bLonimg" src="image/img/london.jpeg" onclick = "location.href = 'bus_sc.html'">
        <h1 class="londonname" onclick = "location.href = 'bus_sc.html'">런던</h1>
      </div>
      <div class="liverimg">
        <img class="bLiverimg" src="image/img/liverpool.jpeg">
        <h1 class="livername">리버풀</h1>
      </div>
    </div><!--busUK-->
 
    <div class="busItaly">
      <h3>이탈리아</h3>
      <div class="romaimg">
        <img class="bRomaimg" src="image/img/roma.jpeg">
        <h1 class="romaname">로마</h1>
      </div>
      <div class="veneimg">
        <img class="bVeneimg" src="image/img/vene.jpeg">
        <h1 class="venename"> 베네치아</h1>
      </div>
    </div><!--busItaly-->

    <div class="busFrance">
      <h3>프랑스</h3>

      <div class="parisimg">
        <img class="bParisimg" src="image/img/paris.jpeg">
        <h1 class="parisname"> 파리</h1>
      </div>

      <div class="monaimg">
        <img class="bMonaimg" src="image/img/mona.jpeg">
        <h1 class="monaname"> 모나코</h1>
      </div>
    
    </div><!--busFrance-->

    <div class="busSpain">
      <h3>스페인</h3>

      <div class="mardimg">
        <img class="bMardimg" src="image/img/mard.jpeg">
        <h1 class="mariname"> 마드리드</h1>
      </div>

      <div class="barceimg">
        <img class="bBarceimg" src="image/img/barce.jpeg">
        <h1 class="barcename"> 바르셀로나</h1>
      </div>
    
    </div><!--busFrance-->
  </div> 
  

  <div class="b_pop">
    <h1 class="pop_title">아직 여행지를 고르지 못하셨나요?</h1>
    <h2 class="pop_title1">인기 있는 노선을 추천 받아보세요!</h2>
     <div class="pop1">
   
        <ul class="pop11">
          <li class="popcity1">런던</li>
          <li class="arrow">-></li>
          <li class="popcity2">에든버러</li>
        </ul> 

        <img class="pop1_pic1" src="image/img/poplon.jpeg">
        <img class="pop1_pic2" src="image/img/popeden.jpeg">
     </div>

     <div class="pop2">
      <ul class="pop11">
        <li class="popcity1">에든버러</li>
        <li class="arrow">-></li>
        <li class="popcity2">런던</li>
      </ul> 

      <img class="pop1_pic1" src="image/img/popeden.jpeg">
        <img class="pop1_pic2" src="image/img/poplon.jpeg">
     </div>

     <div class="pop3">
      <ul class="pop11">
        <li class="popcity1">세비야</li>
        <li class="arrow">-></li>
        <li class="popcity2">바르셀로나</li>
      </ul> 

      <img class="pop1_pic1" src="image/img/popsev.jpeg">
        <img class="pop1_pic2" src="image/img/popbar.jpeg">
     </div>

     <div class="pop4">
      <ul class="pop11">
        <li class="popcity1">마드리드</li>
        <li class="arrow">-></li>
        <li class="popcity2">런던</li>
      </ul> 

        <img class="pop1_pic1" src="image/img/popmard.jpeg">
        <img class="pop1_pic2" src="image/img/poplon.jpeg">
     </div>

  </div><!--pop-->

<div class="b_sale">
  <div class="bsale_title">
    <h2>마감임박 노선!</h2>
    <h3> ' lastseat ' 으로 비용을 절감해 보세요!</h3>
  </div><!--bsale_title-->

  <section class="awards"> <!--이미지스위퍼 -->
    <div class="inner">
      <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img class="top1" src="image/img/h_top1.jpg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->에든버러</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul> 
          </div>
          <div class="swiper-slide">
            <img  class="top2" src="image/img/h_top2.jpg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">에든버러->런던</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img class="top3" src="image/img/h_top3.jpg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">마르세유->런던</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img  class="top4" src="image/img/h_top4.jpg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->파리</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img class="top5" src="image/img/h_top5.jpg" alt="" />.
            <ul class="sale1_ul">
              <li class="sale1_rote">모나코->파리</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img  class="top6" src="image/img/h_top6.jpg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">바르셀로나->에든버러</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img class="top7" src="image/img/eden.jpeg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->마드리드</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img  class="top8" src="image/img/mona.jpeg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->마드리드</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img class="top9" src="image/img/eden.jpeg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->마드리드</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>
          <div class="swiper-slide">
            <img  class="top10" src="image/img/mona.jpeg" alt="" />
            <ul class="sale1_ul">
              <li class="sale1_rote">런던->마드리드</li>
              <li class="sale1_time">1:30</li>
              <li class="sale1_pri">20,000</li>
              <li class="sale1_spri">15,000</li>
            </ul>
          </div>

        </div>
      </div>
    </div> 
    
    <div class="swiper-buttons">
      <button class="swiper-prev"> < </button> <!--이전버튼-->
      <button class="swiper-next"> > </button> <!-- 다음 버튼-->
    </div>

  </section><!--이미지스위퍼 끝-->
  
 

 
 
  </div> <!-- b_sale 끝 -->


 



  </div><!--content-->

  <footer>
    <div class="footerB">
        <!-- 푸터 네비박스-->
        <div class="fNvB">
            <!--푸터 네비 왼쪽 마진때문에 쩔 수 없이 만든 div임 -->
            <div></div>
            <nav><a href="tour_login.jsp">가이드투어</a></nav>
            <nav><a href="bus_login.jsp">버스</a></nav>
            <nav><a href="hotel.css">호텔</a></nav>
            <nav><a href="shop_index.html">쇼핑몰</a></nav>
            <nav><a href="">고객센터</a></nav>
            <nav><a href="">게시판</a></nav>
            <nav><a href="">장바구니</a></nav>
            <nav><a href="mypage_index.html">마이페이지</a></nav>
            <nav><a href="">회원가입</a></nav>
            <nav><a href="">로그인</a></nav>
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