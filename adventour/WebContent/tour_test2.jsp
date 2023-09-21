<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "adventour.t_getset" %>
<%@ page import = "java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
 		<title>
            ADVENTOUR - TOUR
        </title>
        <link rel="stylesheet" type="text/css" href="./css/tour_index.css">           
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src="./js/tour_incomplete.js"></script>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
</head>
<body>  

<jsp:useBean id="id" class="adventour.g_list_print">
	<header>
		<!-- header.html import-->
    	<div id="header"></div>
	</header>
	
	<%
	ArrayList<g_getset> a1 = id.g1();
	%>

	<!-- 본문  -->

  <%
						ArrayList<t_getset> a2 = id.t1();
						%>
				<% 
					for ( int i = 0; i < a2.size(); i++ ) {
						t_getset t = a2.get(i);
					if(t.getT_id().equals("l_ston_tour") == true) { 
				%>
                        <div class="recommend_city1">
                            <div class="r_c_1_img">
                                <img src="<%= t.getT_img1() %>" style="width: 200px; height: 150px; cursor: pointer;" alt="추천도시 1">
                            </div>                            
                            <h3 class="rocommend_1_title">
                                <%= t.getT_name() %>
                            </h3>
                            <div class="recommend_price">
                                ₩<%= t.getT_price() %>
                            </div>
                        </div>
                        <% }} %>

                    
            
            <!--  -->

                 
    
        <!--content-->
  
    <footer>
	<div id="footer"></div>
	</footer>

</jsp:useBean>
</body>

   <script>
            var slideIndex = 0;
            showSlides();
        
            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
               
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                slides[slideIndex - 1].style.display = "block";
            
                setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
            }
        </script>
        
        <script>
        var slideIndextext = 0;
        showSlidestext();
    
        function showSlidestext() {
            var i;
            var slidetext = document.getElementsByClassName("slidetext");
           
            for (i = 0; i < slidetext.length; i++) {
                slidetext[i].style.display = "none";
            }
            slideIndextext++;
            if (slideIndextext > slidetext.length) {
                slideIndextext = 1
            }
            slidetext[slideIndextext - 1].style.display = "block";
        
            setTimeout(showSlidestext, 2000); // 2초마다 이미지가 체인지됩니다
        }
        
        </script>
</html>