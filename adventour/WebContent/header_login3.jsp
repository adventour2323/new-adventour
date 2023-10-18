<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<link rel="stylesheet" href="css/header.css">
<script src="js/commonF.js"></script>
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
        <li class="menu1"><a class="movet" href="main.tour?tour=main">투어</a></li>
        <li class="menu2"><a class="moveb" href="bus_login.jsp">버스</a></li>
        <li class="menu3"><a class="moveh" href="main.hotel?uname=hmain">호텔</a></li>
    <!--     <li class="menu4"><a class="moves" href="shop_login.jsp">쇼핑</a></li>--> 
        <li class="menu5 "><a class="movec" href = "community_list2.jsp">게시판</a></li>
        <li class="menu6 "><a class="movem" href = "mypage_index.jsp">마이페이지</a></li>
      </ul>
    </div><!--menu--> 
  </div><!--header-->

 	<div class="schtop">
		<div class="schtop_margin_box">
			<div class="uk_top">
				<ul class="h_cityli1">
					<li class="ukli"><a href="main.hotel?uname=uk"> &lt;영국&gt;</a> </li>
					<li class="h_lond"><a class="move_lon" href="hotel_sc.html">런던</a></li>
					<li class="h_liverp"><a class="move_liverp" href="hotel_sc.html">리버풀</a></li>
					<li class="h_Edinb"><a class="move_Edinb" href="hotel_sc.html">에든버러</a></li>
				</ul>
			</div>
			
			<div class="ity_top">
				<ul class="h_cityli2">
					<li class="ityli"><a href="main.hotel?uname=italy"> &lt;이탈리아&gt;</a> </li>
					<li class="h_roma"><a class="move_roma" href="hotel_sc.html">로마</a></li>
					<li class="h_vene"><a class="move_vene" href="hotel_sc.html">베네치아</a></li>
					<li class="h_mila"><a class="move_mila" href="hotel_sc.html">밀라노</a></li>
				</ul>
			</div>

			
			<div class="fra_top">
				<ul class="h_cityli3">
					<li class="frali"> <a href="main.hotel?uname=france">&lt;프랑스&gt; </a></li>
					<li class="h_paris"><a class="move_paris" href="hotel_sc.html">파리</a></li>
					<li class="h_marc"><a class="move_marc" href="hotel_sc.html">마르세유</a></li>
					<li class="h_mona"><a class="move_mona" href="hotel_sc.html">모나코</a></li>
				</ul>
			</div>
			
			<div class="spain_top">
				<ul class="h_cityli4">
					<li class="spainli"><a href="main.hotel?uname=spain"> &lt;스페인&gt;</a> </li>
					<li class="h_mard"><a class="move_mard" href="hotel_sc.html">마드리드</a></li>
					<li class="h_barc"><a class="move_barc" href="hotel_sc.html">바르셀로나</a></li>
					<li class="h_sev"><a class="move_sev" href="hotel_sc.html">세비야</a></li>
				</ul>
			</div>
	</div>
</div><!--schtop-->