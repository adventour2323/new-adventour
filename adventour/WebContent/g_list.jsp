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
</head>

<style>
table, th, td {
    border: none;
}
</style>

<body>
    <header>
        <%
        	if (session.getAttribute("id") == null) {
        %>
        <!-- header.html import -->
        <jsp:include page="header.html"></jsp:include>
        <%
        	} else {
        %>
        <jsp:include page="header_login.jsp"></jsp:include>
        <%
        	}
        %>
    </header>

    <jsp:useBean id="id" class="adventour.g_list_print">
        <%
            ArrayList<g_getset> a1 = id.g1();
        %>

        <div class="list_title_div">
            <h1 class="list_title"> 가이드 리스트 </h1>
        </div>

	<div class="country_list" >
		
		<div id="country_all" class="country_content" style="margin-left: auto;">
		<a href="g_list.jsp"> <img alt="europeicon" src="./image/tour/euricon.png" height="30px;"><h2 class="c_name">전체</h2> </a>  
		</div>
		<div id="country_uk" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=uk"> <img alt="ukflag" src="./image/tour/ukflag.png" height="30px;"> <h2 class="c_name">영국</h2> </a>
		</div>
		<div id="conutry_fr" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=france"> <img alt="ukflag" src="./image/tour/frflag.png" height="30px;"> <h2 class="c_name">프랑스</h2> </a> 
		</div>
		<div id="country_es" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=spain"> <img alt="ukflag" src="./image/tour/esflag.png" height="30px;">  <h2 class="c_name">스페인</h2> </a>
		</div>
		<div id="country_ita" class="country_content" style="margin-right: auto;">
			<a href="g_list_country.jsp?g_country_eng=italia"> <img alt="ukflag" src="./image/tour/itaflag.png" height="30px;">  <h2 class="c_name">이탈리아</h2> </a>
		</div>
	
	</div>

        <div class="content">
            <div style="text-align: center; margin-right: auto; margin-left: auto;">
                <div>
                    <%
                        int itemsPerPage = 8;
                        int currentPage = 1;

                        String pageParam = request.getParameter("page");
                        if (pageParam != null) {
                            currentPage = Integer.parseInt(pageParam);
                        }

                        int startIndex = (currentPage - 1) * itemsPerPage;
                        int endIndex = Math.min(startIndex + itemsPerPage, a1.size());
                    %>

                    <%
                    for (int i = startIndex; i < endIndex; i++) {
                        g_getset g = a1.get(i);
                    %>
                    <div class="container" style="margin: 0 10px 30px; width: calc(50% - 20px); float: left;">
                        <!-- 항목 표시 코드 -->
                        <table width="95%" cellpadding="0" cellspacing="0" border="0" style="background: #fff; white-space: normal; ">
                            <tbody>
                                <tr>
                                    <td width="115" class="image-container">
                                        <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
                                            <img src="<%=g.getImg()%>" width="201px" height="201px" class="guide-image">
                                            <div class="overlay">
                                                <div class="overlay-content">
                                                  	  자세히 보기
                                                </div>
                                            </div>
                                        </a>
                                    </td>

                                    <td>
                                        <div style="margin: 0px 10px; width: 100%;">
                                            <table width="95%" cellpadding="0" cellspacing="0" border="0" class="guide_css" style="border-top: 1px solid #0066b3; padding-left: 10px; padding-right: 10px;">
                                                <tbody>
                                                    <tr>
                                                        <th width="100" style="background-color: #f2f2f2;">이름</th>
                                                        <td>
                                                            <div><a href="g_info.jsp?g_id=<%=g.getG_id()%>"><%=g.getName()%></a></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;">국가</th>
                                                        <td><%=g.getCountry()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;">도시</th>
                                                        <td><%=g.getCity()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;">테마</th>
                                                        <td><%=g.getTheme()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%
                    if ((i + 1) % 2 == 0) {
                    %>
                    <div style="clear: both;"></div>
                    <%
                    }
                    }
                    %>
                </div>
            </div>
<div class="pagination">
    <ul>
        <% int totalPages = (int) Math.ceil((double) a1.size() / itemsPerPage); // 전체 페이지 수
           if (currentPage > 1) { %>
            <li><a href="g_list.jsp?page=<%=currentPage - 1 %>">이전</a></li>
        <% } %>

        <li class="current-page">현재 페이지: <%= currentPage %></li>

        <% if (currentPage < totalPages) { %>
            <li><a href="g_list.jsp?page=<%=currentPage + 1 %>">다음</a></li>
        <% } %>
    </ul>
</div>

        </div>


    </jsp:useBean>
</body>

<footer>
    <jsp:include page="footer.html"></jsp:include>
</footer>
</html>
