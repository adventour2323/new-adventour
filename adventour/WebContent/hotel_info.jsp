<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 상세</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_info.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_info.js"></script>

    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 

        <script 
        defer
        src="https://maps.googleapis.com/maps/api/js?
        key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap">
        </script>
        
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
  </head>

<body>

 <header>
<%
if (session.getAttribute("id") == null) {
%>
    <!-- header.html import -->
    <div id="header"></div>
<%
} else {
%>
    <jsp:include page="header_login.jsp"></jsp:include>
<%
}
%>
</header>

<!--  검색창 부분 삭제  
  <div class="pagename">
    <h1 class="pagename1">HOTEL</h1>
  </div>

  <div class="schnav"> 

   <div class="sch1">
      <h5 class="sch_title">☆ 나라</h5>
      <input type="text" class="sch_country" name="sch_country" placeholder="나라" >
    </div>
    
     <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      <input type="text" class="sch_city" name="sch_city" placeholder="도시" >
    </div>
    

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" id="sch_indate" class="datepicker" name="sch_indate"placeholder="YYYY-MM_DD">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      성인 : <input type="text" class="sch_adult" class="sch_adult" placeholder="성인"></br>

    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격">
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격">
    </div>

    <div class="sch123">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="checkbox" class="h_twin"  name="h_twin" value="트윈">트윈</br>
      <input type="checkbox" class="h_double"  name="h_double" value="슈퍼싱글">더블</br>
      <input type="checkbox" class="h_queen"  name="h_queen" value="퀸">퀸</br>
    </div>


    <div class="sch13">
      <button class="sch_btn" type="button" class="sch_btn">검색하기</button>
    </div>

    </div>
 --> 
  <div class="content">

  <!-- 지도부분 삭제   
  <div class="h_map">
      <div id="map" style="height: 290px;"> </div>

    <div class="rinav"> 

      <button class="eur" type="button">고객센터</button>
      <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button>
      
    </div>


  
    </div>
   -->

    <div id="hotel_infos">
<%  List<H_getset> top_list = (List<H_getset>) request.getAttribute("top_list"); 
if (top_list != null) {
	

	
	for (int i = 0; i <1; i++) {
	    H_getset aaa = top_list.get(i); 

%>
 
      <div id="hotel_info_phos">

        <div id="hotel_info_pho1">
        <img class="h_info_title_pho1" class="h_info_title_pho1" 
        src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        </div>
        <div id="hotel_info_pho2">
          <img class="h_info_title_pho2" class="h_info_title_pho2" src="image/hotel/h_image/<%= aaa.getH_pho1() %>" >
        </div>
        <div id="hotel_info_pho3">
          <img class="h_info_title_pho3" class="h_info_title_pho3" src="image/hotel/h_image/<%= aaa.getH_pho2() %>" >
        </div>
        <div id="hotel_info_pho4">
          <img class="h_info_title_pho4" class="h_info_title_pho4" src="image/hotel/h_image/<%= aaa.getH_pho3() %>"  >
        </div>
        <div id="hotel_info_pho5">
          <img class="h_info_title_pho5" class="h_info_title_pho5" src="image/hotel/h_image/<%= aaa.getH_pho4() %>"  >
        </div>
        <div id="hotel_info_pho6">
          <img class="h_info_title_pho6" class="h_info_title_pho6" src="image/hotel/h_image/<%= aaa.getH_pho5() %>"  >
        </div>
        <div id="hotel_info_pho7">
          <img class="h_info_title_pho7" class="h_info_title_pho7" src="image/hotel/h_image/<%= aaa.getH_pho6() %>" >
        </div>
      
    </div><!--hotel_info_phos-->


    <div id="hotel_info_engname1">
      <h1 class="hotel_info_engname" ><%= aaa.getH_name_eng()%></h1>
    </div>

    <div id="hotel_info_koname">
      <h1 class="hotel_info_koname">(<%= aaa.getH_name_ko()%>)</h1>
    </div>
    
    <div id="hotel_info_grade">
       <%
    int starCount = Integer.parseInt(aaa.getH_grade()); // 별 갯수 가져오기
    for (int ii = 0; ii < starCount; ii++) {
    %>
    <img id="grade_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %>
    </div>

    <div id="hotel_info_addr">
      <h3 class="hotel_info_addr"> 주소 : <%= aaa.getH_addr()%> </h3>
    </div>

    <div id="hotel_info_tel">
      <h3 class="hotel_info_tel"> TEL : <%= aaa.getH_tel()%> </h3>
    </div>

    <div id="hotel_info_options">

      <div id="hotel_info_breakfast">
             <h3 class="hotel_info_breakfast">   
            조식 
            <% if (aaa.getH_breakfast().equals("y")) { %>
                가능
            <% } else { %>
                불가능
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_pool">
        <h3 class="hotel_info_pool">
            수영장 
            <% if (aaa.getH_pool().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_rooftop">
        <h3 class="hotel_info_rooftop">
            루프탑 
            <% if (aaa.getH_rooftop().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
      
    
    </div><!--hotel_info_options-->
    
 <div id="map" style="width: 950px; height: 400px;" > 
 <!-- <input type="button" class="h_mapbtn" type="button" name="h_mapbtn" value="지도보기" onclick="showMap(<%= aaa.getH_lat()%>, <%= aaa.getH_lon()%>)"> -->

 
 </div>
 <input type="hidden" class="hh_lat" name="hh_lat" value="<%= aaa.getH_lat()%>" />
 <input type="hidden" class="hh_lng" name="hh_lng" value="<%= aaa.getH_lon()%>" />
    
<%	
for (int ii = 0; i < top_list.size(); i++) {
    H_getset bbb = top_list.get(i); 
 %>

    <div id="hotel_room_info">
      <h2 id="hotel_room_type" class="hotel_room_type"><%=  bbb.getH_roomtype()%> room</h2>
        <div id="h_room_pho" >
          <img id="h_room_phoi" class="h_room_phoi" src="image/hotel/h_image/<%=  bbb.getH_roompho() %>">
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
          <h2 id="h_room_price" class="h_room_price"> &#8361;<%=  bbb.getH_roompri()%> </h2>
          <input id="roompay_btn" type="button" class="roompay_btn" value="결제하기"/>
        </div><!--h_room_options2-->


    </div>
      </div>
<%  
}
}
}else{
	out.println("null data");
}
%>
<div class="modal">
  <span class="close">&times;</span>
  <img class="modal_content" id="img01">
</div>
</div><!--hotel_info-->

  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>