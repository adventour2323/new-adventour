<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<link rel="stylesheet" href="css/header.css">
<script src="js/header.js"></script>
<div class="header">

    <div class="header1">
    <a href="./index_login_ing.jsp"><img id="logo" width="210px" height="30px" src="image/img/logo123.png"></a>
     <!--<img id="logo" width="210px" height="30px" src="C:\Users\1\Desktop\adventour-master\adventour-master\adventour\WebContent\img\logo123.png">-->

     
      <div class="home">
        <ul class="homeli">
        	<%
				if(session.getAttribute("id") == null) {
					response.sendRedirect("g_logout.jsp"); }
			%>
			<li > <%= session.getAttribute("id") %> 님 안녕하세요.</li>
			
        <li class="home11" onclick = "location.href = 'index_login_ing.jsp'" style="cursor: pointer"> 홈</li> 
           <li class="home1" onclick = "location.href = 'g_logout.jsp'" style="cursor: pointer">로그아웃</li>
            <li class="home1" style="cursor: pointer">장바구니</li>
          <li class="home11" style="cursor: pointer">메뉴</li>
        </ul> 
      </div><!--home-->

    </div><!--header1-->

    <div class="menu">
      <ul class="menuli">
        <li class="menu1"><a class="movet" href="tour_jsp.jsp">투어</a> </li>
        <li class="menu2"><a class="moveb" href="bus_login.jsp">버스</a></li>
        <li class="menu3"><a class="moveh" href="hotel_login.jsp">호텔</a></li>
        <li class="menu4"><a class="moves" href="shop_login.jsp">쇼핑</a></li>
        <li class="menu5 "><a class="movec" href = "community_list.jsp">게시판</a></li>
        <li class="menu6 "><a class="movem" href = "mypage_index.html">마이페이지</a></li>
      </ul>
    </div><!--menu--> 
  </div><!--header-->

  <div class="schtop">
   <div class="schtop_margin_box">
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
  </div>
</div><!--schtop-->