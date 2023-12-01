<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="adventour.t_getset" %>
<%@ page import="adventour.g_list_print" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>호텔 결제</title>
<link rel="stylesheet" type="text/css" href="css/tour_pay.css">
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
	<div id="header"></div>
<%
}
%>
</header>

<body>
<%
    // 로그인 확인
    if (session.getAttribute("id") == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        window.location.href = document.referrer;
    </script>
<%
}
%>

<jsp:useBean id="ub" class="adventour.g_list_print">
<!-- <form name="reserv_to_pay" action="tour_pay_toss.jsp" method="post"> -->

	<% 
	request.setCharacterEncoding("UTF-8");   
    int totalPeople = Integer.parseInt(request.getParameter("total_people"));
    String tourDate = request.getParameter("trip-start");
    String tourId = request.getParameter("tour_id");
    int totalPrice = Integer.parseInt(request.getParameter("total_price"));
	String mem_id	= request.getParameter("mem_id");
	
    // 숫자 포맷: 1,000,000 형식으로 변경
    java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
    nf.setMaximumFractionDigits(0);
    String formattedPrice = nf.format(totalPrice);
	
	ArrayList<t_getset> a1 = ub.t9(tourId);
	for (t_getset reserv : a1) { 

%>

<div id="content_all">
	<div id="content_left">
	</div>	

    <!--  결제 정보 불러오기  -->
	<div id="content">
		<h1 id="t_reserv_title">투어 예약 정보 </h1>
		<div id="content_div"><!-- 예약 전체 정보 -->
	   		
	   		<div style="display: flex;">
			<div id="content_div_left"><!-- 예약 호텔 및 룸 전체 정보 왼쪽 -->
	   <!--  예약한 호텔 정보   -->
	 
				<div id="content_tour_div">
					<div id="content_tour_pho">
						<img id="content_tour_image"  src="<%= reserv.getT_img1()%>" alt="투어 사진"/>
	     			</div>
	     			<div id="content_tour_name">
	     				<h2 id="t_name"><%=reserv.getT_name() %></h2>
	     				<h4 style="margin-bottom: 20px;"><%=reserv.getCountry() %>, <%=reserv.getCity() %></h4>	      
	     				<input type="hidden" name="t_name" value="<%=reserv.getT_name() %>">
	     				<input type="hidden" id="h_m_id_input" name="m_id" value="<%= mem_id %>">
	     	      		<input type="hidden" name="t_id" value="<%=tourId %>">
	     			</div>
	     		</div><!-- content_hotel_div -->
	    
	     		<div id="content_date_div">
					<table id="content_date_info">
						<tr>
							<th>여행 출발일: </th>
							<td><%= tourDate%></td>
							<input type="hidden" id="tour_date" name="tourDate" value="<%= tourDate %>">
						</tr>
						<tr>
							<th>집합 시간: </th>
            				<td><%= reserv.getD_time() %>
							<%-- <input type="hidden" id="t_d_time" name="t_d_time" value="<%= reserv.getD_time() %>"> --%>
						</tr>	   
						<tr>
							<th>인원 수 </th>
							<td ><%= totalPeople %> 명</td>
							<input type="hidden" id ="total_people_num" name="total_people_num" value="<%= totalPeople %>">
						</tr>
						
						<!-- <tr>
							<th>객실 </th>
							<th></th>
						</tr>
						<tr>
							<td>1개</td>
							<td></td>
						</tr> -->
					</table>
				</div><!-- content_date_div -->
				<div>
					<h2 style="text-align: center; margin-top: 40px;">담당 가이드</h2>
				</div>	   			
				<div id="content_guide_div">
					<div id="content_guide_pho">
						<img id="content_guide_image" src="<%= reserv.getG_img()%>"/>
					</div>
					<div id="content_guide_name">
						<%-- <h3><%= reserv.getG_name() %></h3> --%>
						<%-- <input type="hidden" id="guide_name" name="guide_name" value="<%= reserv.getG_name() %>"> --%>
						<table id="content_room_info" >
							<tr>
								<th> 이름</th>
								<th> <%= reserv.getG_name() %> </th>
							</tr>							
							<tr>
								<th> 연락처</th>
								<th> <%= reserv.getG_pnum() %> </th>
							</tr>
							<tr>
								<th> 이메일</th>
								<th> <%= reserv.getG_email()%></th>
							</tr>
							<%-- <tr>
								<th> <%= reserv.getH_room_smoke() %> </th>
								<th> 결제방식 : <%= reserv.getH_room_paynow() %> </th>
							</tr> 	
							<tr>
								<th> 체크인 : <%= reserv.getH_room_intime() %> </th>
								<th> 체크아웃 : <%= reserv.getH_room_outime() %> </th>
							</tr> --%>
						</table>
					</div>
				</div><!-- content_room_div -->
	   			<h2 style="text-align: center; margin-top:60px;">요금</h2>
				<div id="content_tour_price_div">
					<table id="content_room_price_table">
 		   				<tr>
							<td class="td_1">1인당 요금</td>
							<td class="td_2"> <h4 class="td_2_price">&#8361; <%= reserv.getT_price() %></td>
						</tr>        
 						<%-- <tr>
							<%
							int roomPrice = reserv.getH_roompri();
							int night_pri = (int) (nightAsInt * roomPrice);
 							%> --%>
						<tr>
							<td class="td_1"> 총 인원</td>
							<td class="td_2"><h4 class="td_2_price"> <%= totalPeople %> 명</h4></td>
						</tr>        
						<%-- <tr>
							<td class="td_1">세금 및 수수료</td>
							<% 
							int tax = (int) (night_pri * 0.05); // 5% 세금 계산
							%>
							<td class="td_2"> <h4 class="td_2_price"> &#8361; <%= tax %></h4></td>
						</tr>            
 		   				<tr>
							<% 
							int tax2 = (int) (night_pri * 0.1); // 10% 부가세 계산
							%>
							<td class="td_1">부가세</td>
							<td class="td_2"><h4 class="td_2_price">&#8361; <%= tax2 %></h4></td>
							<tr>
								<%
								int sale = (int) (night_pri * -0.12); 
								%>		   
            					<td class="td_1">할인</td>
								<td class="td_2"> <h4 class="td_2_price">&#8361;<%=sale %></h4></td>
							</tr> --%>
							<tr>
								<%-- <%
								int total_price = (int) ( night_pri + tax + tax2 + sale);
								%>         --%>   
								<td class="td_total">결제 금액</td>
								<td class="td_totalpri"> <h3 class="td_2_price">&#8361; <%= totalPrice %></h3></td>
								<input type="hidden" id="t_total_price" name="totalPrice" value="<%= totalPrice %>">
							</tr>            
					</table>
				</div><!-- content_room_price_div -->
	   
				<div id="content_reserv_info">
					<div id="content_reserv_info1">
						<h2> * 취소 및 환불 규정</h2>
						<div id="content_reserv_info11">
							<h3>결제 후 구매 후 취소/환불/변경이 불가하니 꼭 신중하게 구매하세요.</h3>
							<h4 class="content_reserv_info111"> 예약은 즉시 확정됩니다. 곧바로 예약 확인 이메일을 받으실 수 있습니다.</h4>
	     				</div>
					</div><!--content_reserv_info1  -->
	   
					<!-- <div id="content_reserv_info2">
	    				<div id="content_reserv_info21">
	    					
						</div>
					</div>content_reserv_info2  -->
	   
				</div><!--content_reserv_info  -->
	   
	    	</div><!-- content_div_left -->
	
			<div id="content_div_right">
				<h2>예약 정보 입력</h2>
				
				<div id="content_person_info">
					<h3>- 대표 인원 정보</h3>
					<div id="user_info_table">
						<h5 id="user_firstname_title">이름</h5>
						<input type="text" id="user_firstname" name="user_firstname" placeholder="이름(영문)">	 
						<h5 id="user_lastname_title">성</h5>
						<input type="text" id="user_lastname" name="user_lastname" placeholder="성(영문)">	 
					</div><!-- user_info_table  -->
	 			</div><!--content_person_info  -->
	 
				<div id="user_info_tel">
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
	  <!--  <h3>결제 세부 정보</h3>
	   <h5 id="card_title">카드유형</h5>
	 <select id="card_select">
	     <option value="visa">VISA </option>
        <option value="master">MASTER</option>
        <option value="jcb">JCB</option>
        <option value="discover">DISCOVER</option>
        <option value="unionpay">UNION PAY</option>
    </select> 
    -->
     				<h3 id="toss_pay_title" >결제방식</h3>
     				<input type="submit" id="toss_pay" name="toss_pay" value="toss" style="cursor: pointer;">
	  <!-- 토스 페이 API 가져오기 --> 
	 			</div>
	 
	 
				<%-- <% }} %> --%>	 
	 	
			</div><!-- content_div_right -->
			</div>
		
		</div><!--content_div -->
	</div><!--content -->
		<div id="content_right"></div>


</div><!-- content_all -->
<%} %>
<!-- </form> -->
</jsp:useBean>


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
var elements = document.querySelectorAll(".td_2");

if (elements) {
  elements.forEach(function(element) {

    var text = element.textContent;


    var formattedText = addCommasToNumber(text);


    element.textContent = formattedText;
  });
}

var elements = document.querySelectorAll(".td_2_price");

if (elements) {
  elements.forEach(function(element) {

    var text = element.textContent;


    var formattedText = addCommasToNumber(text);


    element.textContent = formattedText;
  });
}

// 세 자리마다 콤마를 추가하는 함수
function addCommasToNumber(numberString) {
  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


$("#toss_pay").on("click", function(){

    
    var h_roomnum = document.getElementById("h_roomnum").value; //
    var h_m_id = document.getElementById("h_m_id_input").value; //
    var user_firstname =  document.getElementById("user_firstname").value; //
    var user_lastname =  document.getElementById("user_lastname").value; //
    var h_room_user = document.getElementById("h_room_user").value; //
    var h_total_price = document.getElementById("h_total_price").value; //
    var h_indate = document.getElementById("h_indate").value; //
    var h_outdate = document.getElementById("h_outdate").value;//
    var h_user_name = user_firstname + user_lastname;
    var h_user_pnum = document.getElementById("user_tel").value;
    var h_user_mail = document.getElementById("user_mail").value;

   // alert("1번" +  h_total_price);

    // 쿠키 만료 날짜를 설정 -  현재 세션이 종료되면
  var expirationDate = new Date();
expirationDate.setDate(expirationDate.getDate() + 1);

    // 각 데이터를 쿠키에 저장
document.cookie = " h_roomnum=" +  h_roomnum + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_m_id=" + h_m_id + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_room_user=" + h_room_user + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_total_price=" + h_total_price + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_indate=" + h_indate + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_outdate=" + h_outdate + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_user_name=" + h_user_name + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_user_pnum=" + h_user_pnum + "; expires=" + expirationDate.toUTCString();
document.cookie = "h_user_mail=" + h_user_mail + "; expires=" + expirationDate.toUTCString();

});



</script>

</html>