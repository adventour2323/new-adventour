<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/h_pay_toss.css">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />  
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
      
      <title>결제위젯 샘플</title>
  </head>
  
<!--   <script>

function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}


// 쿠키에서 값을 가져옵니다. (투어)
var t_id = getCookie("t_id");
var m_id = getCookie("m_id");
var t_r_date = getCookie("t_r_date");
var t_total_price = getCookie("t_total_price");
var t_total_headcount = getCookie("t_total_headcount");
var t_user_name = getCookie("t_user_name");
var t_user_phone = getCookie("t_user_phone");
var t_user_mail = getCookie("t_user_mail");



</script> -->
  <body>
 

<%--   <%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  session.getAttribute("id");
  String h_name_eng = request.getParameter("h_name_eng");
  String h_name_ko = request.getParameter("h_name_ko");
  String h_indate = request.getParameter("h_indate");
  String h_outdate = request.getParameter("h_outdate");
  String h_night_time = request.getParameter("h_night_time");
  String total_price = request.getParameter("total_price");
  String h_roompeo = request.getParameter(" h_roompeo");
  String h_roomnum = request.getParameter("h_roomnum");
  String user_mail = request.getParameter("user_mail");
  String user_tel = request.getParameter("user_tel");
  String h_tinum = h_indate + "H" +h_roomnum;
  
  %> --%>
    <%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  session.getAttribute("id");
  String user_firstname = request.getParameter("user_firstname");/*  */
  String user_lastname = request.getParameter("user_lastname");/*  */
  String t_id = request.getParameter("t_id");/*  */
  
  String t_name = request.getParameter("t_name");/*  */
  String m_id = request.getParameter("m_id");/*  */
  String total_people_num = request.getParameter("total_people_num");/*  */
  String totalPrice = request.getParameter("totalPrice");/*  */
  String tourDate = request.getParameter("tourDate");/*  */
  String user_tel = request.getParameter("user_tel");/*  */
  String user_mail = request.getParameter("user_mail");/*  */
  
/*   out.println(user_firstname + user_lastname);
  out.println("투어아이디 "+t_id);
  out.println("회원아이디 "+m_id);
  out.println("총인원 "+total_people_num);
  out.println("총액 "+totalPrice);
  out.println("출발일 "+tourDate);
  out.println("폰번 "+user_tel);
  out.println("이멜 "+user_mail); */
  %>
  <!--  -->
<div id="re_paying_info" style="margin-left: 50px;margin-top: 150px; ">
  <h1>결제 예정 정보</h1>
 <!--  <input type="text" value="<%= session.getAttribute("id") %>" > --> 
  <%-- <h3 style="font-weight:bold;"><%= h_name_eng  %></h3>
  <h3 style="font-weight:bold;"><%= h_name_ko %></h3>
  <h3 style="font-weight:bold;"> 체크인  : <%= h_indate  %></h3>
  <h3 style="font-weight:bold;"> 체크아웃 : <%= h_outdate  %></h3>
  <h3 style="font-weight:bold;"><%= h_night_time  %>박</h3>
  <h2 class="total_price" style="font-weight:bold;">결제 예정 금액 : <%= total_price  %>원</h2> --%>
  <!--  -->
  <h3 style="font-weight:bold;"><%= t_name  %></h3>
  <h3 style="font-weight:bold;"> 여행일  : <%= tourDate %></h3>
  <h2 class="total_price" style="font-weight:bold;">결제 예정 금액 : <%= totalPrice  %> 원</h2>
  </div>
      <div id="payment-method"> </div>
    <button id="payment-request-button" style="width: 200px; height:50px; 
    background-color: blue; color:white;font-weight:bold; margin-left: 30px; border-radius: 5px; cursor: pointer;" >결제하기</button>
   

<script>

      /*
      * TODO: 개발자센터에 로그인해서 내 결제위젯 클라이언트 키를 입력하세요
      * @docs https://docs.tosspayments.com/reference/using-api/api-keys
      */
      const paymentWidget = PaymentWidget("test_ck_oEjb0gm23PJzPjxygL9krpGwBJn5",	
    		  "test_sk_DnyRpQWGrNbqDpb25Q7yrKwv1M9E" );

      /**
       * 결제창을 렌더링합니다.
       * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
       */
<%--        var totalPrice = <%= total_price %>;
       var orderName = '<%= h_name_ko %>';
       var customerName = '<%=user_firstname%>' +''+'<%=user_lastname %>';
       var h_indate = '<%= h_indate  %>';
       var h_indate = '<%= h_outdate  %>'; 
       var h_night_time = <%= h_night_time  %>;
       var total_price = <%= total_price  %>;
       var user_mail = '<%= user_mail %>';
       var user_mail = '<%= user_mail %>';
       var customerMobilePhone  = '<%= user_tel %>';
       var m_id  = '<%=  session.getAttribute("id") %>'; --%>
       
       var totalPrice = <%= totalPrice %>;
       var orderName = '<%= t_name %>';
       var customerName = '<%=user_firstname%>' +''+'<%=user_lastname %>';
       var tourDate = '<%= tourDate  %>';
       var user_mail = '<%= user_mail %>';
       var user_tel  = '<%= user_tel %>';
       var m_id  = '<%=  session.getAttribute("id") %>';
  
       // alert(customerName);
             
      paymentWidget.renderPaymentMethods("#payment-method", 
      { value: totalPrice},
      { variantKey: "DEFAULT"});

      const paymentRequestButton = document.getElementById(
        "payment-request-button"
      );
      let currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;
      
      // 숫자에 콤마 찍기
  	/* var elements = document.querySelectorAll(".total_price"); */
  	var elements = document.querySelectorAll(".total_price");

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
  	

      paymentRequestButton.addEventListener("click", () => {
        /** 결제 요청s
         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
         */

        
     
         paymentWidget.requestPayment({
          orderId: generateRandomString(),
          orderName: orderName,
          customerName:customerName,
          ccustomerMobilePhone :t_user_phone ,
          customerEmail: t_user_mail,
          successUrl: currentURL + "Mypage.mypage?uname=mypage&&customer="+m_id,
          failUrl:  currentURL + "t_pay_fail.jsp",
        });
      });

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    </script>
 
  </body>
</html>