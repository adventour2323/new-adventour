<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
        
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
  </head>


<body>

 

<div  id="info_SCH">

<%  List<H_getset> infoshc_list = (List<H_getset>) request.getAttribute("infoshc_list"); 
if ( infoshc_list != null) {
  for (int s = 0; s < infoshc_list.size(); s++) {
      H_getset bbb = infoshc_list .get(s); 
 %>

    <div id="hotel_room_info">
      <h2 id="hotel_room_type" class="hotel_room_type"><%=  bbb.getH_roomtype()%> room</h2>
        <div id="h_room_pho" >
          <img id="h_room_phoi" class="h_room_phoi" src="image/hotel/h_image/<%=  bbb.getH_roompho() %>">
        </div>
        <div id="h_room_options1" >
        <div class="h_room_options11"><img class="h_room_peo_img" src="image/hotel/h_image/person.png"/><div class="h_room_peo"><h4 >최대 가능인원 : <%=  bbb.getH_roompeo()%>명</h4></div></div>  
        <div class="h_room_options12">   <img class="h_room_bed_img" src="image/hotel/h_image/qeen_bed.png"> <div class="h_room_bed"><h4>베드 타입 : <%=  bbb.getH_room_bed()%>, <%=  bbb.getH_room_bedc()%>개</h4></div></div>
        <div class="h_room_options13"><img class="h_room_breakfast_img" src="image/hotel/h_image/meal.png"><div class="h_room_breakfast"> <h4>조식 <%=  bbb.getH_room_breakfast()%></h4></div></div>
        <div class="h_room_options14"> <img class="h_room_canael_img" src="image/hotel/h_image/pay_card.png"> <div class="h_room_canael"><h4> 취소 가능 여부 : <%=  bbb.getH_room_cancel()%></h4></div></div>
        <div class="h_room_options15"><img class="h_room_window_img" src="image/hotel/h_image/window.png"> <div class="h_room_window">  <h4>창문 <%=  bbb.getH_room_window()%></h4></div></div>
        <div class="h_room_options16"> <img class="h_room_smoke_img" src="image/hotel/h_image/no_smoking.png"><div class="h_room_smoke"><h4> <%=  bbb.getH_room_smoke()%> </h4></div></div>

        <div id="h_room_options2" >
          <h4 class="h_room_paynow"> 결제 : <%=  bbb.getH_room_paynow()%></h4>
          <h4 class="h_room_intime"> 체크인 : <%=  bbb.getH_room_intime()%> </h4>
          <h4 class="h_room_outtime"> 체크아웃 : <%=  bbb.getH_room_outime()%> </h4>
          <h2 id="h_room_price" class="h_room_price"> &#8361;<%=  bbb.getH_roompri()%>  / 1박</h2>
          <input id="roompay_btn" type="button" class="roompay_btn" value="결제하기"/>
        </div><!--h_room_options2-->


    </div><!-- h_room_options1 -->
      </div>
     
<%  
}
}
%>
</div>  <!-- info_SCH -->



</body>

</html>