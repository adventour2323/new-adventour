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

    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
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
      <input type="text" class="sch_city" class="sch_city" placeholder="지역" >
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" class="sch_indate" class="sch_indate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" class="sch_outdate" class="sch_outdate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      성인 : <input type="text" class="sch_adult" class="sch_adult" placeholder="성인"></br>
      유아 : <input type="text" class="sch_kid" class="sch_kid" placeholder="유/소아"></br>
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" class="sch_minpri" placeholder="최소가격">
      ~  <input type="text" class="sch_maxpri" class="sch_maxpri" placeholder="최대가격">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="checkbox" class="h_twin"  class="h_twin" value="1">트윈</br>
      <input type="checkbox" class="h_double"  class="h_double" value="1">더블</br>
      <input type="checkbox" class="h_queen"  class="h_queen" value="1">퀸</br>
    </div>


    <div class="sch13">
      <button class="sch_btn" type="button" class="sch_btn">검색하기</button>
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

    <div id="hotel_infos">
<%  List<H_getset> top_list = (List<H_getset>) request.getAttribute("top_list"); 
if (top_list != null) {
	

	
	for (int i = 0; i <1; i++) {
	    H_getset aaa = top_list.get(i);

%>
 
      <div id="hotel_info_phos">

        <div id="hotel_info_pho1">
        <img class="h_info_title_pho1" class="h_info_title_pho1" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho2">
          <img class="h_info_title_pho2" class="h_info_title_pho2" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho3">
          <img class="h_info_title_pho3" class="h_info_title_pho3" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho4">
          <img class="h_info_title_pho4" class="h_info_title_pho4" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho5">
          <img class="h_info_title_pho5" class="h_info_title_pho5" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho6">
          <img class="h_info_title_pho6" class="h_info_title_pho6" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho7">
          <img class="h_info_title_pho7" class="h_info_title_pho7" src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
      
    </div><!--hotel_info_phos-->


    <div id="hotel_info_engname1">
      <h2 class="hotel_info_engname" ><%= aaa.getH_name_eng()%></h2>
    </div>

    <div id="hotel_info_koname">
      <h3 class="hotel_info_koname">(<%= aaa.getH_name_ko()%>)</h3>
    </div>

    <div id="hotel_info_addr">
      <h4 class="hotel_info_addr"> 주소 : <%= aaa.getH_addr()%> </h4>
    </div>

    <div id="hotel_info_tel">
      <h4 class="hotel_info_tel"> TEL : <%= aaa.getH_tel()%> </h4>
    </div>

    <div id="hotel_info_options">

      <div id="hotel_info_breakfast">
             <h4 class="hotel_info_breakfast">   
            조식 
            <% if (aaa.getH_breakfast().equals("y")) { %>
                가능
            <% } else { %>
                불가능
            <% } %>
        </h4>
    </div>
    <div id="hotel_info_pool">
        <h4 class="hotel_info_pool">
            수영장 
            <% if (aaa.getH_pool().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h4>
    </div>
    <div id="hotel_info_rooftop">
        <h4 class="hotel_info_rooftop">
            루프탑 
            <% if (aaa.getH_rooftop().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h4>
    </div>
      
    
    </div><!--hotel_info_options-->
    
<%	
for (int ii = 0; i < top_list.size(); i++) {
    H_getset bbb = top_list.get(i); 
 %>

    <div id="hotel_room_info">
      <h2 id="hotel_room_type" class="hotel_room_type"><%=  bbb.getH_roomtype()%> room</h2>
        <div id="h_room_pho" >
          <img id="h_room_phoi" class="h_room_phoi" src="image/hotel/h_image/<%=  bbb.getH_pho() %>">
        </div>
        <div id="h_room_options1" >
          <h4 class="h_room_peo"> 최대 가능인원 : <%=  bbb.getH_roompeo()%>명</h4>
          <h4 class="h_room_bed"> 베드 타입 : <%=  bbb.getH_room_bed()%>, <%=  bbb.getH_room_bedc()%>개</h4>
          <h4 class="h_room_breakfast"> 조식 <%=  bbb.getH_room_breakfast()%></h4>
          <h4 class="h_room_canael"> 취소 가능 여부 : <%=  bbb.getH_room_cancel()%></h4>
          <h4 class="h_room_window"> 창문 <%=  bbb.getH_room_window()%></h4>
          <h4 class="h_room_smoke"> <%=  bbb.getH_room_smoke()%> </h4>

        <div id="h_room_options2" >
          <h4 class="h_room_paynow"> 결제 : <%=  bbb.getH_room_paynow()%></h4>
          <h4 class="h_room_intime"> 체크인 : <%=  bbb.getH_room_intime()%> </h4>
          <h4 class="h_room_outtime"> 체크아웃 : <%=  bbb.getH_room_outime()%> </h4>
          <h2 id="h_room_price" class="h_room_price"> <%=  bbb.getH_roompri()%> </h2>
          <input id="roompay_btn" type="button" class="roompay_btn" value="결제하기"/>
        </div><!--h_room_options2-->


    </div>
      </div><!--hotel_info-->
<%  
}
}
}else{
	out.println("null data");
}
%>


  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>