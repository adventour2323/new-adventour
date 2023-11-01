<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>호텔 결제</title>
<link rel="stylesheet" type="text/css" href="css/hotel_pay.css">
 <!-- <script src="js/hotel_pay.js"></script>  연결 안되서 나중에 분리-->

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



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
	<div id="content_left"></div>	
ㄴ
    <!--  결제 정보 불러오기  -->
	<div id="content">
		<h1 id="h_reserv_title">호텔 예약 정보 </h1>
	   <div id="content_div"><!-- 예약 전체 정보 -->
	   
       <div id="content_div_left"><!-- 예약 호텔 및 룸 전체 정보 왼쪽 -->
	   <!--  예약한 호텔 정보   -->
	 
	   <div id="content_hotel_div">
	     <div id="content_hotel_pho">
	     <img id="content_hotel_image"/>
	     </div>
	     <div id="content_hotel_name">
	     <h3>호테이름 영어영어</h3>
	     <h4>호텔이름 한글 한글</h4>
	     <h5>성급 별로</h5>
	     <h5>주소오오오오오오오오어오오오옹어오오어어어어어엉</h5>
	     </div>
	   </div><!-- content_hotel_div -->
	   
	   <div id="content_date_div">
	   <table id="content_date_info">
	     <tr>
           <th>체크인 </th>
            <th>체크아웃</th>
 		   </tr>
           <tr>
            <td>아아아ㅏㅏ</td>
            <td>아아아ㅏㅏ</td>
           </tr>	   
	   	   <tr>
            <th>투숙객 </th>
            <th>투숙기간</th>
 		   </tr>
 		   <tr>
            <td>2명</td>
            <td>2박</td>
           </tr>
           <tr>
            <th>객실 </th>
            <th></th>
 		   </tr>
 		   <tr>
            <td>1개</td>
            <td></td>
           </tr>
           
	   
	   
	   </table>
	   </div><!-- content_date_div -->
	   
	   
	    <div id="content_room_div">
	     <div id="content_room_pho">
	     <img id="content_room_image"/>
	     </div>
	     <div id="content_room_name">
	     <h3>룸 타입</h3>
	     <table id="content_room_info" >
	      <tr>
            <th> 침대 : 슈퍼싱글 x 2</th>
            <th> 창문 : 없음 </th>
 		   </tr>
	      <tr>
            <th> 조식 : 제공안함</th>
            <th> 투숙객 : 최대 4명 </th>
 		   </tr>
	      <tr>
            <th> 금연 </th>
            <th> 결제방식 : 즉시결제 </th>
 		   </tr> 	
 	      <tr>
            <th> 체크인 : 15:00 </th>
            <th> 체크아웃 : 12:00 </th>
 		   </tr> 		   	    		   
         </table>
	     </div>
	   </div><!-- content_room_div -->
	   
      <div id="content_room_price_div">
        <table id="content_room_price_table">
 		   <tr>
            <td>1박</td>
            <td>&#8361; 321,213</td>
           </tr>        
 		   <tr>
            <td>세금 및 수수료</td>
            <td>&#8361; 13,131</td>
           </tr>            
 		   <tr>
            <td>부가세</td>
            <td>&#8361; 1,313</td>
           </tr>        
 		   <tr>
            <td>할인</td>
            <td>- &#8361; 1,313</td>
           </tr>         
        </table>



      </div><!-- content_room_price_div -->
	   
	   
	   
	   
	   
	    </div><!-- content_div_left -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div><!--content_div -->
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
</html>