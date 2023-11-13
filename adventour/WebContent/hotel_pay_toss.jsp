<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제위젯 샘플</title>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  </head>
  <body>
 
 
  <%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  session.getAttribute("id");
  String user_firstname = request.getParameter("user_firstname");
  String h_name_eng = request.getParameter("h_name_eng");
  String h_name_ko = request.getParameter("h_name_ko");
  String h_indate = request.getParameter("h_indate");
  String h_outdate = request.getParameter("h_outdate");
  String h_night_time = request.getParameter("h_night_time");
  String total_price = request.getParameter("total_price");
  String h_roompeo = request.getParameter(" h_roompeo");
  String h_roomnum = request.getParameter("h_roomnum");
  
  %>
  <input type="text" value="<%= session.getAttribute("id") %>" >
  <h4><%= h_name_eng  %></h4>
  <h4><%= h_name_ko %></h4>
  <h4> 체크인  : <%= h_indate  %></h4>
  <h4> 체크아웃 : <%= h_outdate  %></h4>
  <h4><%= h_night_time  %>박</h4>
  <h4 class="total_price"><%= total_price  %>원</h4>
  
    <div id="payment-method"></div>
    <button id="payment-request-button">결제하기</button>
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
       var totalPrice = <%= total_price %>;
       var orderName = '<%= h_name_ko %>';
       var customerName = '<%=user_firstname%>';
       var h_indate = '<%= h_indate  %>';
       var h_indate = '<%= h_outdate  %>';
       var h_night_time = <%= h_night_time  %>;
       var total_price = <%= total_price  %>;

       
       
      paymentWidget.renderPaymentMethods("#payment-method", 
      { value: totalPrice},
      { variantKey: "DEFAULT"});

      const paymentRequestButton = document.getElementById(
        "payment-request-button"
      );
      let currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;
      
      // 숫자에 콤마 찍기
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

          successUrl: currentURL + "h_pay_success.jsp",
          failUrl: currentURL + "h_pay_fail.jsp",
        });
      });

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    </script>
  </body>
</html>