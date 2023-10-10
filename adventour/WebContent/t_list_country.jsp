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
    <link rel="stylesheet" type="text/css" href="./css/t_list_country.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <style>
 
    </style>
</head>

<body>
    <header>
        <jsp:include page="header.html"></jsp:include>
    </header>

    <div class="tour_contant">
        <jsp:useBean id="id" class="adventour.g_list_print">
            <%
                String countryEng = request.getParameter("country_eng");
                String country = request.getParameter("country");
                ArrayList<t_getset> a1 = id.t3(countryEng);
            %>
			
			<div class="t_country_div" style="margin: 20px, auto;">
			<h1 class="t_country" style="margin-top: 30px; margin-bottom: 30px; text-align: center;" >
			<%=country %>
			</h1>
			</div>
			
			<div class="tour-container">
            <% for (t_getset g : a1) { %>
            
                <div class="tour-item">
                    <a href="https://www.naver.com">
                        <img src="<%=g.getT_img1()%>" alt="img<%=g.getT_name() %>">
                    </a>
                    <div class="tour-info">
                        <h3 class="tour-title">
                            <a href="https://www.naver.com"><%= g.getT_name() %></a>
                        </h3>
                        <p class="tour-price">
                            ₩ <%= g.getT_price() %>
                        </p>
                    </div>
                </div>
            <% } %>
            </div>
        </jsp:useBean>
    </div>

    <footer>
        <jsp:include page="footer.html"></jsp:include>
    </footer>
</body>
</html>
