<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/mpg_index.css">
    <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
    <script src="js/mpg_index.js"></script>
    <title>my page/main page</title>
<body>

	<header>
		<!-- header.html import-->
    	<div id="header"></div>
	</header>

    <!-- 메인 컨텐츠 전체 박스 -->
    <div class="alMainB">
        <!--메인페이지 글씨 박스-->
        <div class="mainTB">
            <p>마이페이지</p>
        </div>

        <!--메인 네비와 빠른 예약, 캘린더 컨테인한 박스 -->
        <div class="mainNCB"> 

            <!-- mpg_nvbox.html import-->
            
            <div id="mpg_nvbox"></div>
            
            <!--예약박스확인 및 캘린더 묶는 상자-->
            <div class="mrMcalB">
                <!--가장 빠른 예약 박스-->
                <div class="mainRB">
                    <p>가장 빠른 예약</p>
                    <div class="reContentB">
	                    <span><img src="image/mypage/london_hotel_mp.jfif"></span>
	                    <div>
	                        <p>HOTEL  Elegance</p>
	                        <p>결제 일시 : 2023-08-07</p>
	                        <p>예약일</p>
	                        <p>2023-08-30 ~ 2023-09-03</p>
	                        <p>연락처: 020020540</p>
						</div>
                    </div>
                </div>
                
                
                <!--캘린더 박스-->
                <div class="mainCalB">
                    <P>캘린더 (일정)</P>
					<div>
                    <iframe src="https://calendar.google.com/calendar/embed?height=500&wkst=1&bgcolor=%23B39DDB&ctz=Asia%2FSeoul&showPrint=0&showDate=1&showNav=0&showTitle=0&showCalendars=0&src=YWRkcmVzc2Jvb2sjY29udGFjdHNAZ3JvdXAudi5jYWxlbmRhci5nb29nbGUuY29t&color=%2333B679" style="border:solid 1px #777" width=805" height="560" frameborder="0" scrolling="no"></iframe></div>
                </div>
            </div>
        </div>
        
    </div>
   	<!-- footer.html import-->
	<div id="footer"></div>

</body>
</html>