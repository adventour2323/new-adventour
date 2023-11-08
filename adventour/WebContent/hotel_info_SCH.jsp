<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="adventour.C_dbsave" %>
<%@ page import="adventour.C_getset" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 상세</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_info.css">
  <script src="js/hotel_info.js"></script>

    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
        
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
  </head>



<body>

<form name="info_to_reserv" action="toreservation.hotel?uname=toreserv"   method="post" >
 <%
 	request.setCharacterEncoding("UTF-8"); 
      String h_name_eng = request.getParameter("h_name_eng"); // 입력된 검색어 가져오기
      String h_indate = request.getParameter("h_indate"); // 입력된 검색어 가져오기
      String h_outdate = request.getParameter("h_outdate"); // 입력된 검색어 가져오기
      String night_time = request.getParameter("night_time"); // 입력된 검색어 가져오기
      String h_roompeo1 = request.getParameter("h_roompeo"); // 입력된 검색어 가져오기
     
      System.out.println(h_name_eng);
      System.out.println(h_indate);
      System.out.println( night_time);
      System.out.println(h_outdate);   
      System.out.println( h_roompeo1);
      

      int h_roompeo;

      if (h_roompeo1 != null && !h_roompeo1.isEmpty()) {
          h_roompeo = Integer.parseInt(h_roompeo1);
      } else {
      	 h_roompeo = 1;
      }
      System.out.println( h_roompeo);

   C_dbsave h_sch1 = new  C_dbsave();
   ArrayList<adventour.C_getset> searchResults =  h_sch1. h_info_search(h_name_eng,  h_roompeo, h_indate,h_outdate ); // 검색 수행
     
  if ( searchResults != null) {
    for (int s = 0; s < searchResults.size(); s++) {
        C_getset bbb = searchResults.get(s); 
        System.out.println(bbb.getH_roomtype());
 %>
 <input type="hidden" name="h_info_search_nameeng" value="<%=h_name_eng%>">
 <input type="hidden" name="sch_indate" value="<%=h_indate%>">
 <input type="hidden" name="sch_outdate" value="<%=h_outdate%>">
 <input type="hidden" name="night_time" value="<%=night_time%>"> <!-- 랙문으로 받아오는 값 X 수정 필요 -->
 <input type="hidden" name="sch_peo" value="<%=h_roompeo1 %>">
 <input type="hidden" name="h_room_num"  value="<%= bbb.getH_roomnum() %>">
 
 
<div id="info_SCH">
       <div id="hotel_room_info">
      <h2 id="hotel_room_type" class="hotel_room_type"><%= bbb.getH_roomtype()%> room</h2>
      <div id="img_div">
     <div class="prevButton"><button id="prevButton">&lt;</button></div>  
         <div id="imageSlider" class="image-slider">
          <img id="h_room_phoi" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho() %>">
          <img id="h_room_phoi1" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho1() %>">
          <img id="h_room_phoi2" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho2() %>">
          <img id="h_room_phoi3" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho3() %>">
          <img id="h_room_phoi4" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho4() %>">
          <img id="h_room_phoi5" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho5() %>">
          <img id="h_room_phoi6" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho6() %>">
        </div>
   <div class="nextButton">   <button id="nextButton"> &gt; </button></div>  
   <p id="slideNumber"></p>
      </div><!-- img_div -->


        <div id="h_room_options1" >
        <div class="h_room_options11"><img class="h_room_peo_img" src="image/hotel/h_image/person.png"/><div class="h_room_peo"><h4 >최대 가능인원 : <%=  bbb.getH_roompeo()%>명</h4></div></div>  
        <div class="h_room_options12">   <img class="h_room_bed_img" src="image/hotel/h_image/qeen_bed.png"> <div class="h_room_bed"><h4>베드 타입 : <%=  bbb.getH_room_bed()%>, <%=  bbb.getH_room_bedc()%>개</h4></div></div>
        <div class="h_room_options13"><img class="h_room_breakfast_img" src="image/hotel/h_image/meal.png"><div class="h_room_breakfast"> <h4>조식 <%=  bbb.getH_room_breakfast()%></h4></div></div>
        <div class="h_room_options14"> <img class="h_room_canael_img" src="image/hotel/h_image/pay_card.png"> <div class="h_room_canael"><h4> 취소 가능 여부 : <%=  bbb.getH_room_canael()%></h4></div></div>
        <div class="h_room_options15"><img class="h_room_window_img" src="image/hotel/h_image/window.png"> <div class="h_room_window">  <h4>창문 <%=  bbb.getH_room_window()%></h4></div></div>
        <div class="h_room_options16"> <img class="h_room_smoke_img" src="image/hotel/h_image/no_smoking.png"><div class="h_room_smoke"><h4> <%=  bbb.getH_room_somke() %> </h4></div></div>

        <div id="h_room_options2" >
          <h4 class="h_room_paynow"> 결제 : <%=  bbb.getH_room_paynow()%></h4>
          <h4 class="h_room_intime"> 체크인 : <%=  bbb.getH_room_intime()%> </h4>
          <h4 class="h_room_outtime"> 체크아웃 : <%=  bbb.getH_room_outime()%> </h4>
          <h2 id="h_room_price" class="h_room_price"> &#8361;<%=  bbb.getH_roompri()%>  / 1박</h2>
          <input id="roompay_btn" type="submit" class="roompay_btn" value="결제하기"/>
        </div><!--h_room_options2-->


    </div><!-- h_room_options1 -->
    </div>
     
<%  
}
}
%>
</div>
</form>

</body>
<script>
 
	// 세 자리마다 콤마를 추가하는 함수
	function addCommasToNumber(numberString) {
	  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	$(document).ready(function() {
	    const slides = $('.slide'); // 슬라이드 이미지 요소들
	    const prevButton = $('#prevButton'); // 이전 버튼
	    const nextButton = $('#nextButton'); // 다음 버튼
	    const slideNumber = $('#slideNumber'); // 순번을 표시할 요소
	    let currentIndex = 0; // 현재 슬라이드의 인덱스

	    // 초기에 첫 번째 슬라이드 이미지와 순번 표시
	    slides.eq(currentIndex).show();
	    slideNumber.text(`${currentIndex + 1} / ${slides.length}`);

	    // 다음 슬라이드로 이동
	    nextButton.click(function() {
	        // 현재 슬라이드 숨기기
	        slides.eq(currentIndex).hide();

	        // 다음 슬라이드로 이동 (순환 처리)
	        currentIndex = (currentIndex + 1) % slides.length;

	        // 다음 슬라이드 표시
	        slides.eq(currentIndex).show();

	        // 순번 업데이트
	        slideNumber.text(`${currentIndex + 1} / ${slides.length}`);
	    });

	    // 이전 슬라이드로 이동
	    prevButton.click(function() {
	        // 현재 슬라이드 숨기기
	        slides.eq(currentIndex).hide();

	        // 이전 슬라이드로 이동 (순환 처리)
	        currentIndex = (currentIndex - 1 + slides.length) % slides.length;

	        // 이전 슬라이드 표시
	        slides.eq(currentIndex).show();

	        // 순번 업데이트
	       alert("currentIndex after prevButton click: " + currentIndex);
	  
	        slideNumber.text(`${currentIndex + 1} /7`);
	    });
	});
	// 날짜계산    
	$(document).ready(function() { 
	    const schIndate = document.getElementById("sch_indate");
	    const schOutdate = document.getElementById("sch_outdate");
	    const nightTime = document.querySelector("#night_time");
	    
	    function updateNightTime() {
	        const checkinDate = new Date(schIndate.value);
	        const checkoutDate = new Date(schOutdate.value);
	        
	        if (!isNaN(checkinDate) && !isNaN(checkoutDate)) {
	            const timeDifference = checkoutDate - checkinDate;
	            const nightCount = Math.floor(timeDifference / (1000 * 3600 * 24)); 

	            if (nightCount >= 1) {
	                nightTime.value = nightCount.toString(); // 정수로 변환하여 문자열로 표시
	            } else {
	                nightTime.value = "체크아웃 - 체크인";
	            }
	        } else {
	            nightTime.value = ""; 
	        }
	    }
	    
	    updateNightTime();
	});
	


	</script>
</html>