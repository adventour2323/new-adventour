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
      paymentWidget.renderPaymentMethods("#payment-method", 
      { value: 50000},
      { variantKey: "DEFAULT"});

      const paymentRequestButton = document.getElementById(
        "payment-request-button"
      );
      let currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;

      paymentRequestButton.addEventListener("click", () => {
        /** 결제 요청
         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
         */
        paymentWidget.requestPayment({
          orderId: generateRandomString(),
          orderName: "토스 티셔츠 외 2건",
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