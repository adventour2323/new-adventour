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
	
	 alert("헤더푸터 로드확인");
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
	
	 alert("헤더푸터 로드확인");
    
});
</script>
<header>
		<%
if (session.getAttribute("id") != null) {
%>
		<jsp:include page="header_login.jsp"></jsp:include>
		<%
}
%>
</header>

<body>


<div id="content_all">
	<div id="content_left"></div>	
	
<!--  결제 정보 불러오기  -->
	<div id="content">
	<div id="content_div">
	<h1>호텔 예약 정보 </h1>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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