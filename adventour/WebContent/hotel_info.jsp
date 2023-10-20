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

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
        
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


  <div class="content">


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
            조식</h3><br>
            <h3>
            <% if (aaa.getH_breakfast().equals("y")) { %>
                가능
            <% } else { %>
                불가능
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_pool">
        <h3 class="hotel_info_pool">
            수영장 </h3><br>
            <h3>
            <% if (aaa.getH_pool().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_rooftop">
        <h3 class="hotel_info_rooftop">
            루프탑 </h3><br>
            <h3>
            <% if (aaa.getH_rooftop().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
      
    
    </div><!--hotel_info_options-->
    
 <div id="map" style="width: 950px; height: 400px;" > </div>
 <input type="hidden" class="hh_lat" name="hh_lat" value="<%= aaa.getH_lat()%>" />
 <input type="hidden" class="hh_lng" name="hh_lng" value="<%= aaa.getH_lon()%>" />
    
    <div class="hotel_info_cont">
    
    <h1> 호텔  설명</h1>
    <h2><%= aaa.getH_name_ko() %></h2>
    <h5>빌리지 호텔 에든버러에서는 바쁜 일정 후 휴식시간을 보낼 수 있는 편안한 객실이 마련되어 있습니다.</h5>
   <h5> 빌리지 호텔 에든버러 객실은 여행객과 비즈니스 출장객 모두에게 에든버러에서 편안하게 지낼 수 있는 공간입니다.</h5>
    <h5> 호텔은 헤이마켓 기차역에서 약 4km 정도 거리에 있고, 에든버러공항에서는 약 12km 정도 거리에 있어 호텔까지 편리하게 이동할 수 있습니다.</h5>
     <h5>주변에 칼턴 힐, 스카치 위스키 체험관, 에든버러 대학 등 유명 관광지들이 많이 있어 특별한 여행을 즐기실 수 있습니다.</h5>
   <h5> 호텔 시설을 이용하여 하루 동안의 피로를 말끔히 푸실 수 있습니다. 호텔에서는 주차 공간을 제공합니다.</h5>

    </div>
 </div><!--hotel_info-->
  
 <div class="yes_reserv_room">
 <h2> 현재 예약 가능한 객실 </h2>
 </div>   
    
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



<div class="h_more_info">
<h1>유용한 정보 </h1>
 <table >
        <tr>
            <td id="td1" class="td1"><h2>침대 추가</h2></td>
            <td id="td12" ><h3>2세 이하 무료</h3> <h4>각 객실유/소아 1명은 침대를 무료로 함께 사용할 수 있습니다.</h4></td>
        </tr>
        <tr>
            <td id="td2" class="td1"><h2>반려동물 </h2></td>
            <td id="td22" ><h3>반려동물 동반 불가</h3></td>
        </tr>
          <tr>
            <td  id="td3" class="td1"><h2>조식 </h2></td>
            <td id="td32" ><h3>조식 이용 가능</h3>
            <h4>조식 종류 : 서양식 조식</h4>
            <h4>조식 가격 : 한화 약 2만원</h4>
            </td>
        </tr>
          <tr>
            <td  id="td4" class="td1"><h2>호텔관련 주요정보  </h2></td>
            <td id="td42" ><h4>
현재 이 숙소는 코로나19(COVID-19)에 대응하기 위해 추가 안전 및 위생 조치를 실시하고 있습니다. 
It is essential to pre-book a table in the restaurant and bar prior to arrival. 
The property will contact guests after receiving booking confirmation with additional details related to their stay. Check-in and check-out is done at the self-service kiosks. 
Please note that Village Hotels do not accept cash payments or cheques. 
The credit or debit card used to make the booking must be available on check in at the hotel. 
Entrance fee to the Health & Fitness Club is GBP 5.00 per room per night. A towel charge may apply. 
Please note that children’s swim times apply. Please indicate the number of baby cots needed.
All requests for cots must be confirmed by the property as not all rooms can accommodate cots. 
Please note that over the festive period, there will be limited dining available at the hotel due to private functions.
For more information, guests are advised to contact the hotel before arrival, contact details can be found on the booking confirmation.</h4>
</td>
        </tr>
        <tr>
            <td  id="td5" class="td1"><h2>가능한 결제 방법 </h2></td>
            <td id="td52"><h3>호텔 요금은 다음의 방법으로 결제하실 수 있습니다:</h3>
            <h4>AMEX, VISA, MASTER</h4>
            </td>
        </tr>
    </table>

</div>

 
 </div><!--content 전체 부분-->

 



  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>