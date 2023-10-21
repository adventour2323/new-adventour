<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <style>
        /* 스타일을 여기에 추가하세요 */
        body {
            font-family: Arial, sans-serif;
            
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
            margin-bottom: 10px;
        }
        form {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        
    .payment-details table {
        width: 100%;
    }

    .payment-details td:first-child {
        width: 50%;
        text-align: right;
        padding-right: 10px;
    }

    .payment-details td:last-child {
        width: 50%;
        text-align: left;
        padding-left: 10px;
    }        
    </style>
</head>
<body>
<%
if(session.getAttribute("id") == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  window.location.href = "login_merge_form.jsp";
</script>

<%
}
%>

    <header>
        <% if (session.getAttribute("id") == null) { %>
        <!-- header.html import -->
        <jsp:include page="header.html"></jsp:include>
        <% } else { %>
        <jsp:include page="header_login.jsp"></jsp:include>
        <% } %>
        
        
    </header>

    <div class="container">
        <h1 style="text-align: center;">결제 정보 입력</h1>

<% 
    String totalPeople = request.getParameter("total_people");
    String tourDate = request.getParameter("trip-start");
    int totalPrice = Integer.parseInt(request.getParameter("total_price"));

    // 숫자 포맷: 1,000,000 형식으로 변경
    java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
    nf.setMaximumFractionDigits(0);
    String formattedPrice = nf.format(totalPrice);
%>

        
        
<div class="payment-details">
    <table>
        <tr>
            <td>여행 날짜:</td>
            <td><%= tourDate %></td>
        </tr>
        <tr>
            <td>가격:</td>
            <td><Strong><%= formattedPrice %></Strong> 원</td>
        </tr>
        <tr>
            <td>인원:</td>
            <td><%= totalPeople %> 명</td>
        </tr>
    </table>
</div>

        <form class="payment-form" action=" " method="POST"><!--action 채워야 됨  -->
            <input type="hidden" name="total_people" value="<%= totalPeople %>">
            <input type="hidden" name="tour_date" value="<%= tourDate %>">
            <input type="hidden" name="tour_price" value="<%= totalPrice %>">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
            <label for="creditCard">신용카드 번호:</label>
            <input type="text" id="creditCard" name="creditCard" required>
            <label for="expiration">만료일 (MM/YY):</label>
            <input type="text" id="expiration" name="expiration" required>
            <button type="submit">결제하기</button>
        </form>
    </div>
</body>
<footer>
    <!-- <div id="footer"></div> -->
    <jsp:include page="footer.html"></jsp:include>
</footer>





</html>
