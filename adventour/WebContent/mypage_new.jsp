<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지</title>
  <link rel="stylesheet" type="text/css" href="css/mypage_new.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/mypage_new.js"></script>
    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
</head>
<script >
$(document).ready(function() {

	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
	

    
});


</script>
<header>
		<%
if (session.getAttribute("id") != null) {
%>
		<jsp:include page="header_login.jsp"></jsp:include>
		<%
}else{ %>
	<di id="header"></div>
<%
}
%>
</header>

<body>


<div id="content_all">

   
   <!-- 왼쪽 메뉴바-->
	<div id="content_left">
	<div id="content_list">
	<h2 id="content_list_title">마이페이지</h2>
	<ul id="m_menu_ul">
	<li>예약내역</li>
	<li>찜</li>
	<li>1 : 1 문의</li>
	<li>자주 찾는 질문</li>
	<li>나의 리뷰</li>
	<li>나의 게시글</li>	
	</ul>
	</div>  <!-- content_list -->
	</div>	<!-- content_left -->
	
	

    <!--  마이페이지 메뉴  -->
	<div id="content">
     <div id="content_title"><h1> <예약 내역 확인> </h1></div>
     <div id="content_main">
     
        <div id="content_hotel">
         <div id="content_hotel_title"><h1> 호텔 예약 내역 </h1></div>
         <div id="content_hotel_info">
         <div id="content_hotel_img">
         <img id="hotel_img" >
         </div><!-- content_hotel_img -->   
         <div id="content_hotel_info1">
         <h3  id="h_reserv_num" name="h_reserv_num">예약 번호 : 240204Hatolon101</h3>
         <h4  id="user_name" name="user_name">예약자명 : suzy bea (총 인원 : 3명 )</h4> 
         <ul id="hotel_info_ul">
         <li class="li" id="hotel_name_eng" name="hotel_name_eng">호텔영어이름</li>
         <li class="li" id="hotel_name_ko" name="hotel_name_ko">(호텔한국이름)</li>
         <li class="li" id="city" name="hotel_name_ko">영국, 런던</li>
         <li class="li" id="hotel_name_indate" name="hotel_name_indate">체크인 : 2024-02-04 15:00 ~</li>
         <li class="li" id="hotel_name_outdate" name="hotel_name_outdate">체크아웃 : 2024-02-06 12:00</li>
         <li class="li" id="total_price" name="total_price">결제 금액 : 950,000원</li>        
         </ul><!--hotel_info_ul-->     
         
         <div id="content_hotel_review">
         <input type="button" id="review_btn" value="리뷰작성">
         
         
         </div><!--content_hotel_review-->   
         
             
         </div><!--content_hotel_info1-->   
         
         </div><!-- content_hotel_info -->
        
        
        
        </div><!-- content_hotel -->
    
    
    
    </div><!--content_main -->
	</div><!--content -->




<div id="content_right"></div>
</div><!-- content_all -->

</body>
<footer>
		<%
if (session.getAttribute("id") == null) {
%>
		<!-- header.html import -->
		<div id="footer"></div>
		<%
} else {
%>
		<jsp:include page="footer_login.html" flush="true"></jsp:include>
		<%
}
%>
</footer>
<script >


</html>