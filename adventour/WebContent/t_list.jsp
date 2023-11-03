<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
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
			<a href="t_list_country.jsp?country_eng=uk"> <img alt="ukflag" src="./image/tour/ukflag.png" height="30px;"> <h2>영국</h2> </a>
		</div>
		<div id="conutry_fr" class="country_content">
			<a href="t_list_country.jsp?country_eng=france"> <img alt="ukflag" src="./image/tour/frflag.png" height="30px;"> <h2>프랑스</h2> </a> 
		</div>
		<div id="country_es" class="country_content">
			<a href="t_list_country.jsp?country_eng=spain"> <img alt="ukflag" src="./image/tour/esflag.png" height="30px;">  <h2>스페인</h2> </a>
		</div>
		<div id="country_ita" class="country_content" style="margin-right: auto;">
			<a href="t_list_country.jsp?country_eng=italy"> <img alt="ukflag" src="./image/tour/itaflag.png" height="30px;">  <h2>이탈리아</h2> </a>
		</div>
	
	</div>

    
    <div class="tour-container">
    		<!--  -->
		<%
		// 페이징
			int itemsPerPage = 6;
			int currentPage = 1;

			String pageParam = request.getParameter("page");
			if (pageParam != null) {
				currentPage = Integer.parseInt(pageParam);
				}
			int startIndex = (currentPage - 1) * itemsPerPage;
			int endIndex = Math.min(startIndex + itemsPerPage, a1.size());
		%>
   	 		<!--  -->
		<%
			for (int i = startIndex; i < endIndex; i++) {
				t_getset g = a1.get(i);
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
                    <div class="t-price-rating-container">
    					<div class="tour-price" id="formattedPrice<%= g.getT_id() %>">
        					<strong> <%= g.getT_price() %> </strong>
    					</div>
						<div class="tour-rating-star" id="tour-rating-star">
    						<% String t_id = g.getT_id();
        						ArrayList<t_r_getset> rv = id.t7(t_id);  
        						for (t_r_getset tr : rv) {
    						%>
    							<div style="text-align: center; margin-right: auto; margin-left: auto;">
    								<strong>평점</strong>
    								<div class="star-rating">
       									<span class="star" data-rating="<%= tr.getT_rating() %>"></span>
    								</div>
    							</div>
    						<% } %>
						</div> <!-- tour-rating-star -->
					</div> <!-- t-price-rating-container -->
			
                </div> <!-- tour-info -->
            </div> <!-- tour-item -->

<!--  -->

            
            
<script>
    function formatNumberWithCommas(number) {
        // 가격에 컴마 추가
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    document.addEventListener('DOMContentLoaded', function() {
        var priceElement = document.getElementById('formattedPrice<%= g.getT_id() %>');
        var priceText = priceElement.textContent;
        var price = parseInt(priceText.replace(/[^\d]/g, '')); // 가격을 숫자로 파싱
        priceElement.textContent = '₩ ' + formatNumberWithCommas(price) + ' 원~';
    });
</script>
            <% } %>
        
        <!-- 좌 우 버튼  -->
			<div class="pagination">
    			<ul>
        			<% int totalPages = (int) Math.ceil((double) a1.size() / itemsPerPage); // 전체 페이지 수
        			if (currentPage > 1) { %>
        			<li><a href="main.tour?tour=tourlist&page=<%=currentPage - 1 %>">이전</a></li>
        			<% } %>

        			<li class="current-page">현재 페이지: <%= currentPage %></li>

        			<% if (currentPage < totalPages) { %>
        				<li><a href="main.tour?tour=tourlist&page=<%=currentPage + 1 %>">다음</a></li>
        			<% } %>
        		</ul>
        	</div>        
        <!--  -->
    </div> <!--tour-container  -->
</jsp:useBean>
    <footer>
        <jsp:include page="footer.html"></jsp:include>
    </footer>
</body>

<script>
const starElements = document.querySelectorAll(".star");

starElements.forEach(function(star) {
    const rating = parseFloat(star.getAttribute("data-rating"));
    const roundedRating = Math.round(rating); // 반올림한 숫자를 가져옵니다.

    for (let i = 1; i <= 5; i++) {
        const starItem = document.createElement("span");
        starItem.className = "star-item";

        if (i <= roundedRating) {
            starItem.innerHTML = "★"; // 별 표시
        } else {
            starItem.innerHTML = "☆"; // 별 표시하지 않음
        }

        star.appendChild(starItem);
    }
});

</script>



</html>

