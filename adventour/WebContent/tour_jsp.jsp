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

        <div class="content">
        
        	<div id="guide_of_the_month">
                <div class="gom_ment">
                    <h1 class="gom_comment" style="text-align: center;">
                        	인기 가이드
                    </h1>
                </div>
                
                
             <div class="tab_list">
    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label class="g_label" for="tab1">영국</label>

    <input id="tab2" type="radio" name="tabs">
    <label class="g_label" for="tab2">프랑스</label>

    <input id="tab3" type="radio" name="tabs">
    <label class="g_label" for="tab3">스페인</label>

    <input id="tab4" type="radio" name="tabs">
    <label class="g_label" for="tab4">이탈리아</label>
    <div style="float: right; cursor: pointer; margin-top: auto;" onclick="location.href='./g_list.jsp'"> 전체보기 </div>

    <section id="guide_uk" >
<!--  -->

        <p >
        <% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("영국") == true) { 
		%>
<div class="container" style=" margin-left: 5px; float: left; ">

	 <table style="width: 100px; ">
		  <thead>
			  <tr>
				  <th style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
<% }} %>
        </p>
        

<!--  -->
    </section>
    

    <section id="guide_fr">
        <p>
        <% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("프랑스") == true) { 
		%>
        <div class="container" style=" margin-left: 5px; float: left; ">

	 <table style="width: 100px; ">
		  <thead>
			  <tr>
				  <th style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
        </p>
        <% }} %>
    </section>

    <section id="guide_es">
       <p>
        <% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("스페인") == true) { 
		%>
        <div class="container" style=" margin-left: 5px; float: left; ">

	 <table style="width: 100px; ">
		  <thead>
			  <tr>
				  <th style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
        </p>
        <% }} %>
    </section>

    <section id="guide_ita">
       <p>
        <% 
		for ( int i = 0; i < a1.size(); i++ ) {
			g_getset g = a1.get(i);
		if(g.getCountry().equals("이탈리아") == true) { 
		%>
        <div class="container" style=" margin-left: 5px; float: left; ">

	 <table style="width: 100px; ">
		  <thead>
			  <tr>
				  <th style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
        </p>
        <% }} %>
    </section>

</div>
</div>

            <!--    <div style="margin-top: 200px;">

               
                 <div style="display: flex;">
                        
                        <div class="slideshow_container">
                            <div class="Slidesbackground">
                                <div class="mySlides fade" style="display: none;">
                                
                                	<div style="display: flex;">
                                	<div>
                                	<img alt="루브르" src="./image/tour/r_louvre_img.jpg" class="slideshow-image">
	                                </div>
	                                <div>
	                                <h1>루브르 박물관 가이드!</h1>
                            		<h3>박물관 전문 가이드와 즐기는 가이드 투어!</h3>
                            		<h2>명작의 이야기를 들으면서 재밌게 둘러 보세요</h2>           
	                                </div>		
	                                </div>
	                                
                                </div>
                                
                                <div class="mySlides fade" style="display: none;">
                                
                                    <img alt="구엘공원" src="./image/tour/guel_.jpg" class="slideshow-image">
                                </div>
                                
                                <div class="mySlides fade" style="display: none;">
                                    <img alt="런던"  src="./image/tour/london_city_tour.png" class="slideshow-image">
                                </div>
                                
                                <div class="mySlides fade" style="display: none;">
                                    <img alt="로마" src="./image/tour/rome_city_tour.jpg" class="slideshow-image">
                                </div> 
                            </div>
                        </div>
        
                        <div class="Slidesbackground" style="margin-top: 200px; margin-bottom: 50px; text-align: center;">
                            <h1>가우디 투어</h1>
                            <h3>최고 효율의 동선으로 최고의 만족!</h3>
                            <h2>10년 경력의 베테랑 가이드와 함께하는 가우디 투어</h2>    
                           <div name="test">
                           <div class="slidetext fade">
                            <h1>루브르 박물관 가이드!</h1>
                            <h3>박물관 전문 가이드와 즐기는 가이드 투어!</h3>
                            <h2>명작의 이야기를 들으면서 재밌게 둘러 보세요</h2>                             
                           </div>
                           <div class="slidetext fade">
                            <h1>가우디 투어</h1>
                            <h3>최고 효율의 동선으로 최고의 만족!</h3>
                            <h2>10년 경력의 베테랑 가이드와 함께하는 가우디 투어</h2>
                           </div>
                       		
							<div class="slidetext fade">
                            <h1>런던 시티 투어</h1>
                            <h3>2층 버스 타며 런던 한바퀴</h3>
                            <h2>버스 타고 런던의 랜드마크를 한 번에 구경하자</h2>
                           </div>
                           <div class="slidetext fade">
                            <h1>로마 시티 투어</h1>
                            <h3>버스로 편하게 로마의 랜드마크 즐겨보세요</h3>
                            <h2>오디오 가이드로 자세한 설명을 들을 수 있습니다.</h2>
                            </div>
                            
                            <div style="width: 100px; margin-left: auto; margin-right: auto; padding: 20px; text-align: center;">
                                	자세히보기
                            </div>
                            
                            </div>

                        </div>
                    </div>
                    
            </div> -->
            
            <!--  --> 

                    <div class="tour_banner">
                        <a href="./tour.html">
                        <div class="tour_banner_img">
                            
                            <!-- <img src="img/DSC05989 - 복사본1.jpg" style="width: 1100px;" alt="투어/관광지 이벤트 이미지"> -->
                            <!-- <img src="img/Paris_banner_2.jpg" style="width: 1100px;" alt="투어/관광지 이벤트 이미지"> -->
                            <!-- <img src="img/paris-banner_3.png" style="width: 1100px;" alt="투어/관광지 이벤트 이미지"> -->
                             <img src="./image/tour/spain_banner.jpg" style="width: 1100px;" alt="banner img"> 
                           <img src="./image/tour/paris_banner_3.jpg" alt="" style="width: 1100px;"> 
                            <!-- <img src="img/spain_banner__.png" alt=""> -->
                        </div>
                    </a>
                    </div>

                    <div class="recommend_city">
                        <h3>
                            인기 투어
                        </h3>
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
                        
                        <% 
					for ( int i = 0; i < a2.size(); i++ ) {
						t_getset t = a2.get(i);
					if(t.getT_id().equals("m_g_tour1") == true) { 
				%>
                        <div class="recommend_city2">
                            <div class="r_c_1_img">
                                <img src="<%= t.getT_img1() %>" style="width: 200px; height: 150px; cursor: pointer;" alt="추천도시 2">
                            </div>                            
                            <h3 class="rocommend_1_title">
                                <%= t.getT_name() %>
                            </h3>
                            <div class="recommend_price">
                                ₩<%= t.getT_price() %>
                            </div>
                        </div>
                        <% }} %>
                        
                        <% 
					for ( int i = 0; i < a2.size(); i++ ) {
						t_getset t = a2.get(i);
					if(t.getT_id().equals("p_l_tour") == true) { 
				%>
                        <div class="recommend_city3">
                            <div class="r_c_1_img">
                                <img src="<%= t.getT_img1() %>" style="width: 200px; height: 150px; cursor: pointer;" alt="추천도시 3">
                            </div>                            
                            <h3 class="rocommend_1_title">
                                <%= t.getT_name() %>
                            </h3>
                            <div class="recommend_price">
                                ₩<%= t.getT_price() %>
                            </div>
                        </div>
                        <% }} %>

                        <% 
					for ( int i = 0; i < a2.size(); i++ ) {
						t_getset t = a2.get(i);
					if(t.getT_id().equals("r_v_tour") == true) { 
				%>
                        <div class="recommend_city4">
                            <div class="r_c_1_img">
                                <img src="<%= t.getT_img1() %>" style="width: 200px; height: 150px; cursor: pointer;" alt="추천도시 4">
                            </div>                            
                            <h3 class="rocommend_1_title">
                                <%= t.getT_name() %>
                            </h3>
                            <div class="recommend_price">
                                ₩<%= t.getT_price() %>
                            </div>
                        </div>
                        <% }} %>
                        
                    </div>
                    
                    <div class="recommend_ticket">
                        <h3 style="text-align: center;">추천상품</h3>
                        <img src="./image/tour/usim_.png" style="width: 300px; margin-left: 50px;" alt="추천 티켓/입장권 1">
                        <img src="./image/tour/pass_museum_paris.jpg" style="width: 300px; margin-left: 30px; margin-bottom: 10px" alt="추천 티켓/입장권 2">
                        <img src="./image/tour/colosseum_ticket.png" style="width: 300px; margin-left: 30px; margin-bottom: 20px;" alt="추천 티켓/입장권 3">
                    </div>
                          
                    </div>
    
    
    
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