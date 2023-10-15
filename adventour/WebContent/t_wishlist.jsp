<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
<title>Insert title here</title>
</head>
<body>
		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>



        <ul id="cart-items">
            <!-- 장바구니 항목들을 나타내는 요소들이 동적으로 추가됩니다. -->
        </ul>
        <p id="total-price">총 가격: 0원</p>
        <a href="t_payment.jsp">주문하기</a>

    
    
</body>
</html>