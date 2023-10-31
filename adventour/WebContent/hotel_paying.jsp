<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/hotel_pay.css">
<script src="js/hotel_pay.js"></script>
<title>호텔 결제 중</title>
</head>

<script>
$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
     
});
</script>

<body>

<header>
		<%
if (session.getAttribute("id") != null) {
%>
		<jsp:include page="header_login.jsp"></jsp:include>
		<%
}
%>
</header>

	<div id="content_right"></div>

	<div id="content"></div>

	<div id="content_left"></div>


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


</body>
</html>