<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="java.util.*"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Tour List</title>
    <link rel="stylesheet" type="text/css" href="./css/t_list.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <style>
    </style>
</head>

<body>
    <header>
        <jsp:include page="header.html"></jsp:include>
    </header>
    
<jsp:useBean id="id" class="adventour.g_list_print">
	
	<div class="list_title_div">
	<h1 class="list_title">
	투어 리스트
	</h1>
	</div>

    <div class="tour-container">
        
            <%
                List<t_getset> a1 = (List<t_getset>) request.getAttribute("list");
                for (t_getset g : a1) {
            %>
            
            
            <div class="tour-item">
                <div class="tour-img">
                    <a href="https://www.naver.com">
                        <img src="<%=g.getT_img1()%>" alt="img<%=g.getT_name() %>">
                    </a>
                </div>
                <div class="tour-info">
                
                	<div class="tour_title_div" >
                    <h3 class="tour-title">
                        <a href="https://www.naver.com"><%= g.getT_name() %></a>
                    </h3>
                    </div>
                    
                    <div class="tour_location_div">
                    <p class="tour-location">
                        <%= g.getCountry() %>, <%= g.getCity() %>
                    </p>
                    </div>
                    <div class="tour_price_div">
                    <p class="tour-price">
                        ₩ <%= g.getT_price() %>~
                    </p>
                    </div>
                    
                </div>
            </div>
            
            <% } %>
        
    </div>
</jsp:useBean>
    <footer>
        <jsp:include page="footer.html"></jsp:include>
    </footer>
</body>
</html>
