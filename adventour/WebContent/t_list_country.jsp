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
        /* 전체 페이지 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        /* 투어 목록 컨테이너 */
        
        
        .tour-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 20px;
        }

        /* 각 투어 상품 스타일링 */
        .tour-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(33.33% - 20px);
            box-sizing: border-box;
            
            margin: 0 10px 20px; /* 원하는 좌우 간격으로 조절 (상하 좌우 순서로 지정) */
    		
        }

        /* .tour-item img {
            width: 100%;
            height: auto;
        } */
        .tour-item img {
 			width: 380px; /* 원하는 가로 크기로 설정 */
    		height: 350px; /* 원하는 세로 크기로 설정 */
    		
}
        

        .tour-info {
            padding: 20px;
        }

        .tour-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }

        .tour-price {
            font-size: 16px;
            margin-top: 10px;
        }


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
