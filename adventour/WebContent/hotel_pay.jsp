<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>

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
<form name="reserv_to_pay" href="paying.hotel?uname=paying" method="post">
<%  
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");
String night = request.getParameter("night");
String peo = request.getParameter("peo");
int nightAsInt = Integer.parseInt(night);

System.out.println(checkin);
System.out.println(checkout);
System.out.println(night);
System.out.println(nightAsInt);
System.out.println(peo);

List<H_getset> infoshc_list = (List<H_getset>) request.getAttribute("infoshc_list"); 
if ( infoshc_list != null) {

	for (int i = 0; i <1; i++) {
	    H_getset reserv =  infoshc_list.get(i); 
%>

<div id="content_all">
	<div id="content_left"></div>	

    <!--  결제 정보 불러오기  -->
	<div id="content">
		<h1 id="h_reserv_title">호텔 예약 정보 </h1>
	   <div id="content_div"><!-- 예약 전체 정보 -->
	   
       <div id="content_div_left"><!-- 예약 호텔 및 룸 전체 정보 왼쪽 -->
	   <!--  예약한 호텔 정보   -->
	 
	   <div id="content_hotel_div">
	     <div id="content_hotel_pho">
	     <img id="content_hotel_image"  src="image/hotel/h_image/<%= reserv.getH_pho()%>"/>
	     </div>
	     <div id="content_hotel_name">
	     <h2><%=reserv.getH_name_eng() %></h2>
	     <h4><%=reserv.getH_name_ko() %></h4>
	     <h5><%=reserv.getH_grade() %>성급</h5>
	     <h5><%=reserv.getH_addr() %></h5>
	      <h5>TEL : <%=reserv.getH_tel()%></h5>
	     </div>
	   </div><!-- content_hotel_div -->
	    
	   <div id="content_date_div">
	   <table id="content_date_info">
	     <tr>
           <th>체크인 </th>
            <th>체크아웃</th>
 		   </tr>
           <tr>
            <td><%= checkin %></td>
            <td><%= checkout %></td>
           </tr>	   
	   	   <tr>
            <th>투숙객 </th>
            <th>투숙기간</th>
 		   </tr>
 		   <tr>
            <td><%= peo %>명</td>
            <td><%= night %>박</td>
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
	     <img id="content_room_image" src="image/hotel/h_image/<%= reserv.getH_roompho()%>"/>
	     </div>
	     <div id="content_room_name">
	     <h3>룸 타입 : <%= reserv.getH_roomtype() %></h3>
	     <table id="content_room_info" >
	      <tr>
            <th> 침대 : <%= reserv.getH_room_bed() %> x <%= reserv.getH_room_bedc() %></th>
            <th> 창문 : <%= reserv.getH_room_window() %> </th>
 		   </tr>
	      <tr>
            <th> 조식 : <%= reserv.getH_room_breakfast() %></th>
            <th> 투숙객 : 최대<%= reserv.getH_roompeo() %>명 </th>
 		   </tr>
	      <tr>
            <th> <%= reserv.getH_room_smoke() %> </th>
            <th> 결제방식 : <%= reserv.getH_room_paynow() %> </th>
 		   </tr> 	
 	      <tr>
            <th> 체크인 : <%= reserv.getH_room_intime() %> </th>
            <th> 체크아웃 : <%= reserv.getH_room_outime() %> </th>
 		   </tr> 		   	    		   
         </table>
	     </div>
	   </div><!-- content_room_div -->
	   
      <div id="content_room_price_div">
        <table id="content_room_price_table">
 		   <tr>
            <td class="td_1">1박</td>
            <td class="td_2">&#8361; <%= reserv.getH_roompri() %></td>
           </tr>        
 		   <tr>
 <%
 int roomPrice = reserv.getH_roompri();
 int night_pri = (int) (nightAsInt * roomPrice);
 %>
 		   	<tr>
            <td class="td_1"><%= night %>박</td>
            <td class="td_2">&#8361; <%= night_pri %></td>
           </tr>        
 		   <tr>
            <td class="td_1">세금 및 수수료</td>
   <% 
   int tax = (int) (night_pri * 0.05); // 5% 세금 계산
%>
            <td class="td_2">&#8361; <%= tax %></td>
           </tr>            
 		   <tr>
   <% 
   int tax2 = (int) (night_pri * 0.1); // 10% 부가세 계산
%>
            <td class="td_1">부가세</td>
            <td class="td_2">&#8361; <%= tax2 %>
 		   <tr>
    <%
   int sale = (int) (night_pri * -0.12); 
%>		   
            <td class="td_1">할인</td>
            <td class="td_2"> &#8361; <%=sale %></td>
           </tr>
           <tr>
<%
int total_price = (int) ( night_pri + tax + tax2 + sale);
%>           
            <td class="td_total">총 가격</td>
            <td class="td_totalpri">&#8361; <%= total_price %></td>
           </tr>            
        </table>
      </div><!-- content_room_price_div -->
	   
	   <div id="content_reserv_info">
	     <div id="content_reserv_info1">
	     <h2>무료취소 </h2>
	     <div id="content_reserv_info11"></div>
	     </div><!--content_reserv_info1  -->
	   
	   <div id="content_reserv_info2">
	    <h2>즉시확정 </h2>
	    <div id="content_reserv_info21"></div>
	   </div><!--content_reserv_info2  -->
	   
	   </div><!--content_reserv_info  -->
	   
	   
	   
	    </div><!-- content_div_left -->
	
	<div id="content_div_right">
	 <h2> 투숙객 및 예약 정보 입력</h2>
	 <h4>투숙객 세부 정보 입력 방법 <h4>
	 <h5 id="write_way">
1.객실별로 대표 투숙객의 세부 정보를 입력해 주세요. <br>
2.여권에 표기된 성명 그대로 입력하세요. <br>
3.만 18세 미만 미성년자는 성인과 함께 숙박해야 합니다.</h5>
	 <div id="content_person_info">
	 <h3>객실 주 투숙객</h3>
	 <div id="user_info_table">
	 <h5 id="user_firstname_title">이름</h5>
	 <input type="text" id="user_firstname" name="user_firstname" placeholder="이름(영문)">	 
	 <h5 id="user_lastname_title">성</h5>
	 <input type="text" id="user_lastname" name="user_lastname" placeholder="성(영문)">	 
		 </div><!-- user_info_table  -->
	 </div><!--content_person_info  -->
	 
	 <div id="user_info_tel">
	  <h3>예약자 연락처</h3>
	  <h5 id="user_mail_title">이메일</h5>
	 <input type="text" id="user_mail" name="user_mail" placeholder="이메일">
	 <h6 id="mail_information">이 메일 주소로 예약 확인을 보내드립니다. 올바른 주소인지 확인해 주십시오.</h6>	
	 
	 <h5 id="user_tel_title">전화번호</h5>
	 <select id="country_tel">
	     <option value="kr">대한민국 (+82)</option>
        <option value="us">미국 (+1)</option>
        <option value="ca">캐나다 (+1)</option>
        <option value="uk">영국 (+44)</option>
        <option value="jp">일본 (+81)</option>
        <option value="cn">중국 (+86)</option>
        <option value="in">인도 (+91)</option>
    </select>
	 <input type="text" id="user_tel" name="user_tel" placeholder="전화번호">
	 
	 </div><!-- use_info_tel -->
	 
	 <div id="user_payment">
	   <h3>결제 세부 정보</h3>
	   <h5 id="card_title">카드유형</h5>
	 <select id="card_select">
	     <option value="visa">VISA </option>
        <option value="master">MASTER</option>
        <option value="jcb">JCB</option>
        <option value="discover">DISCOVER</option>
        <option value="unionpay">UNION PAY</option>
    </select>
    
     <h3 id="toss_pay_title" >결제방식</h3>
     <input type="submit" id="toss_pay" name="toss_pay" value="toss">
	  <!-- 토스 페이 API 가져오기 --> 
	 </div>
	 
	 
<%
	}
}
%>	 
	 
	 
	
	</div><!-- content_div_right -->
	
		
	</div><!--content_div -->
	</div><!--content -->


	<div id="content_right"></div>


</div><!-- content_all -->
</form>
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