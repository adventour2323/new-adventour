<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print" %>
<%@ page import="adventour.g_getset" %>
<%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/tour_g_list.css">  
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <title>가이드 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        .content {
            padding: 20px;
        }

        .category {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .category a {
            text-decoration: none;
            color: #333;
            margin: 0 20px;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            margin: 0 auto;
            margin-bottom: 30px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        img {
            width: 200px;
            height: auto;
            cursor: pointer;
        }

        figcaption {
            margin-top: 10px;
            font-size: 14px;
            color: #333;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<header>
    <jsp:include page="header.html"></jsp:include>
</header>
<jsp:useBean id="id" class="adventour.g_list_print">
    <%
    
        ArrayList<g_getset> a1 = id.g1();
        
    %>
    <div class="content">
        <div class="category">
            <a href="#">전체</a>
            <a href="#">영국</a>
            <a href="#">프랑스</a>
            <a href="#">스페인</a>
            <a href="#">이탈리아</a>
        </div>
        <h1>가이드 리스트</h1>
        <div class="container">
            <% 
                for (int i = 0; i < 16; i++) {
                    g_getset g = a1.get(i);
            %>
            <table>
                <thead>
                    <tr>
                        <th colspan="4">
                            <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
                                <img src="<%=g.getImg()%>" alt="img">
                                <figcaption>자세히보기</figcaption>
                            </a>
                        </th>
                    </tr>
                </thead>
                <thead>
                    <tr>
                        <th>이름</th>
                        <th>국가</th>
                        <th>도시</th>
                        <th>테마</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=g.getName()%></td>
                        <td><%=g.getCountry() %></td>
                        <td><%=g.getCity() %></td>
                        <td><%=g.getTheme() %></td>
                    </tr>
                </tbody>
            </table>
            <% } %>
        </div>
    </div>
</jsp:useBean>
<footer>
    <jsp:include page="footer.html"></jsp:include>
</footer>
</body>
</html>