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
	
	
	 //투어 찜하기 바로연결  
	var m_id = $("#sess_id").val();
    
    // alert("확인용 123"+m_id);
      
     $.ajax({
 	      type: "GET",
 	      url: "mypage_tour_like.jsp",
 	      data: {
 	    	  m_id :m_id
 	      },
 	      success: function(data) {
 	        $("#like_ul").html(data);
 	      },
 	      error: function() {
 	        alert("ajax오류 확인 필요.");
 	      }
 	    });
	
     
    $('lili_1').on('mouseenter click', function() {
        $(this).css('background-color', '#D9E5FF');
    });

	$('lili_1').on('mouseleave', function() {
		  $(this).css('background-color', '');
		});
	
  
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

		<%
if (session.getAttribute("id") == null) {

	response.sendRedirect("./index_login_ing.jsp");
		
}
%>
<input type="hidden" id="sess_id" value="<%= session.getAttribute("id") %>">

<div id="content_all">

   
   <!-- 왼쪽 메뉴바-->
	<div id="content_left">
	<div id="content_list">
	<h2 id="content_list_title">마이페이지</h2>
	<ul id="m_menu_ul">
	<li id="li1"><p>예약내역</p></li>
	<li id="li2"><p>찜</p></li>
	<li id="li3"><p>1 : 1 문의</p></li>
	<li id="li4"><p>자주 찾는 질문</p></li>
	<li id="li5"><p>나의 리뷰</p></li>
	<li id="li6"><p>나의 게시글</p></li>	
	</ul>
	</div>  <!-- content_list -->
	</div>	<!-- content_left -->
	
	

<!--  마이페이지 메뉴  -->
	<div id="content">
   
     <div id="content_main">
     

	
	
<div id="reserv_div">       

        <% 
        try{
           List<H_getset> h_m_list = (List<H_getset>) request.getAttribute("h_m_list");
                if (h_m_list != null) {
                    for (int i = 0; i < h_m_list.size(); i++) {
                        H_getset aaa = h_m_list.get(i);
         %>                    
        <div id="content_hotel">
         <div id="content_hotel_title"><h2> 호텔 예약 내역 </h2></div>
         <div id="content_hotel_info">
         <div id="content_hotel_img">
         <img id="hotel_img" src="image/hotel/h_image/<%= aaa.getH_pho() %>">
         </div><!-- content_hotel_img -->   
         <div id="content_hotel_info1">
         <h3  id="h_reserv_num" name="h_reserv_num">예약 번호 : <%= aaa.getH_tinum() %></h3>
         <h4  id="user_name" name="user_name">예약자명 : <%=aaa.getH_user_name() %> (총 인원 : <%= aaa.getH_room_user() %>명 )</h4> 
         <ul id="hotel_info_ul">
         <li class="li" id="hotel_name_eng" name="hotel_name_eng"><%=aaa.getH_name_eng() %></li>
         <li class="li" id="hotel_name_ko" name="hotel_name_ko">(<%=aaa.getH_name_ko() %>)</li>
         <li class="li" id="city" name="hotel_name_ko"><%=aaa.getCountry_ko() %>, <%=aaa.getCity_ko() %></li>
         <li class="li" id="hotel_name_indate" name="hotel_name_indate">체크인 : <%=aaa.getH_indate() %> / <%=aaa.getH_room_intime() %> ~</li>
         <li class="li" id="hotel_name_outdate" name="hotel_name_outdate">체크아웃 : <%=aaa.getH_outdate() %> / <%=aaa.getH_room_outime() %></li>
         <li class="li" id="total_price" name="total_price"><p id="total_price1" >결제 금액 : <%=aaa.getH_total_price() %>원</p></li>        
         </ul><!--hotel_info_ul-->     
         
         <div id="content_hotel_review">
         <input type="button" id="review_btn" value="리뷰작성">                  
         </div><!--content_hotel_review-->                
         </div><!--content_hotel_info1-->            
         </div><!-- content_hotel_info -->
        </div><!-- content_hotel -->
<%
                    }
                }
        }catch (Exception e){
        	System.out.println(e);
        }
        
%>
	
	<div id="content_tour">
	<div id="content_tour_title"><h2> 투어 예약 내역 </h2></div>
	<div id="content_tour_info">
	<div id="content_tour_img">
    <img id="tour_img" src="./image/tour/marseille_tour.jpg"> 
     </div><!-- content_tour_img --> 
     <div id="content_tour_info1">
      <h3  id="t_reserv_num" name="t_reserv_num">예약 번호 :231212Tma_city_tour</h3>
         <h4  id="t_user_name" name="t_user_name">예약자명 : suzy bea (총 인원 : 3명 )</h4> 
         <ul id="tour_info_ul">
         <li class="li" id="t_name" name="t_name">투어명 : 프랑스에서 가장 오래된 역사의 도시!! 그리고 에메랄드빛 지중해, 힐링의 도시 마르세유!!</li>        
         <li class="li" id="t_r_date" name="t_r_date">투어날짜 : 2023-12-12</li>
         <li class="li" id="t_r_time" name="t_r_time">투어 시작시간 : 10:00</li>
         <li class="li" id="t_total_price" name="t_total_price"><p id="t_total_price1" >결제 금액 : 165,000원</p></li>        
         </ul><!--hotel_info_ul-->     
     </div><!-- content_tour_info1 -->   
	
	</div><!-- content_tour_info -->
	</div><!-- content_tour -->

	
	
	
	
	
	
</div> <!--  reserv_div--> 	     
     
     
 <div id="like_div1">
    <div id="like_title"><h2>찜 목록</h2></div>
	<div id="like_tap_div">	
	<div id="like_tour"><h3><label style="cursor: pointer;">투어</label></h3></div>
	<div id="like_hotel"><h3><label style="cursor: pointer;">호텔</label></h3></div>
	</div><!-- like_tap_div -->
	<div id="like_div">
       <p id="like-title">상품 명</p>
      
      
       <ul id="like_ul">
       </ul><!-- like_ul -->
       
  
	</div><!--like_div -->
</div> <!-- like_div1 -->    
     
 
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
<script>


var elements1 = document.querySelectorAll("#total_price");
if (elements1) {
  elements1.forEach(function(element) {
    var text = element.textContent;
    var formattedText = addCommasToNumber(text);
    element.textContent = formattedText;
  });
}
function addCommasToNumber(numberString) {
	  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>


</html>