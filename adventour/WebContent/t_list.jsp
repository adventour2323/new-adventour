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
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>
    
<jsp:useBean id="id" class="adventour.g_list_print">
            <%
               	List<t_getset> a1 = (List<t_getset>) request.getAttribute("list"); 
			%>
	
	
	<div class="list_title_div">
	<h1 class="list_title"> 투어 리스트 <br> </h1>
	</div>
	
	<div class="country_list" >
		
		<div id="country_all" class="country_content" style="margin-left: auto;">
		<a href="main.tour?tour=tourlist"> <img alt="europeicon" src="./image/tour/euricon.png" height="30px;"><h2>전체</h2> </a>  
		</div>
		<div id="country_uk" class="country_content">
			<a href="t_list_country.jsp?country_eng=uk&country=영국"> <img alt="ukflag" src="./image/tour/ukflag.png" height="30px;"> <h2>영국</h2> </a>
		</div>
		<div id="conutry_fr" class="country_content">
			<a href="t_list_country.jsp?country_eng=france&country=프랑스"> <img alt="ukflag" src="./image/tour/frflag.png" height="30px;"> <h2>프랑스</h2> </a> 
		</div>
		<div id="country_es" class="country_content">
			<a href="t_list_country.jsp?country_eng=spain&country=스페인"> <img alt="ukflag" src="./image/tour/esflag.png" height="30px;">  <h2>스페인</h2> </a>
		</div>
		<div id="country_ita" class="country_content" style="margin-right: auto;">
			<a href="t_list_country.jsp?country_eng=italia&country=이탈리아"> <img alt="ukflag" src="./image/tour/itaflag.png" height="30px;">  <h2>이탈리아</h2> </a>
		</div>
	
	</div>

    <div class="tour-container">
        
 
                <%
                for (t_getset g : a1) {
                	%>
            
            <div class="tour-item">
                <a href="t_info.jsp?t_id=<%=g.getT_id() %>">
                	<div class="tour-img">
                        <img src="<%=g.getT_img1()%>" alt="img<%=g.getT_name() %>">                    
                	</div>
                </a>
                <div class="tour-info">
                
                	<div class="tour_title_div" >
                    <h3 class="tour-title">
                        <a href="t_info.jsp?t_id=<%=g.getT_id() %>">
                        	<%= g.getT_name() %>
                        </a>
                    </h3>
                    </div>
                    <hr>
                    
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

