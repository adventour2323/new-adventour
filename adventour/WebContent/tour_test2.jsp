<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
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
			ArrayList<g_getset> a1 = id.g3();
	
			for(g_getset info : a1) {
			
			
			%>
	
	
	
	
	<!-- 본문  -->
	<div class="content">
           
        
        	<div id="guide_of_the_month">
                <div class="gom_ment">
                    <h1 class="gom_comment" style="text-align: center;">
                        	인기 가이드
                    </h1>
                </div>
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
    

    <section id="guide_uk">
        <p>
        <div style="display: flex; height: 200px; text-align: center">
        <div  onclick="location.href='<%= info.getImg()%>'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g2.jpg" style="margin-right: 10px;height: 200px"><br><%= info.getName()%></div>
        <div  onclick="location.href='<%= info.getImg()%>'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g2.jpg" style="margin-right: 10px;height: 200px"><br><%= info.getName()%></div>
        <div  onclick="location.href='<%= info.getImg()%>'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g2.jpg" style="margin-right: 10px;height: 200px"><br><%= info.getName()%></div>
        <div  onclick="location.href='<%= info.getImg()%>'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g2.jpg" style="margin-right: 10px;height: 200px"><br><%= info.getName()%></div>
        <div  onclick="location.href='<%= info.getImg()%>'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g2.jpg" style="margin-right: 10px;height: 200px"><br><%= info.getName()%></div>
        <div onclick="location.href='./g_list.jsp'" style="right: 0%; margin-top: 110px; margin-left: 50px; cursor:pointer;"> 전체 보기 </div>
        </div>
        </p>
    </section>
    
    <% } %>

    <section id="guide_fr">
        <p>
        <div style="display: flex; height: 200px; text-align: center">
        <div onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g6.jpg" style="margin-right: 10px;height: 200px"><br>프랑스1</div>
        <div  onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드2" src="./image/tour/g7.png" style="margin-right: 10px;height: 200px"><br>프랑스2</div>
        <div onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드3" src="./image/tour/g9.png" style="margin-right: 10px;height: 200px"><br>프랑스3</div>
        <div onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드4" src="./image/tour/g8.jpg" style="margin-right: 10px;height: 200px"><br>프랑스4</div>
        <div onclick="location.href='./g_list.jsp'" style="right: 0%; margin-top: 110px; margin-left: 50px; cursor:pointer;"> 전체 보기 </div>
        </div>
        </p>	
    </section>

    <section id="guide_es">
        <p>
        <div style="display: flex; height: 200px; text-align: center">
        <div  onclick="location.href='./g_list.jsp'" style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g10.jpg" style="margin-right: 10px;height: 200px"><br>스페인1</div>
        <div  onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드2" src="./image/tour/g11.jpg" style="margin-right: 10px;height: 200px"><br>스페인2</div>
        <div onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드3" src="./image/tour/g12.png" style="margin-right: 10px;height: 200px"><br>스페인3</div>
        <div  onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드4" src="./image/tour/g13.jpg" style="margin-right: 10px;height: 200px"><br>스페인4</div>
        <div onclick="location.href='./g_list.jsp'" style="right: 0%; margin-top: 110px; margin-left: 50px; cursor:pointer;"> 전체 보기 </div>
        </div>
        </p>
    </section>

    <section id="guide_ita">
        <p>
        <div style="display: flex; height: 200px; text-align: center">
        <div  onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드1" src="./image/tour/g14.jpg" style="margin-right: 10px;height: 200px"><br>이탈리아1</div>
        <div onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드2" src="./image/tour/g15.jpg" style="margin-right: 10px;height: 200px"><br>이탈리아2</div>
        <div  onclick="location.href='./g_list.jsp'"  style="cursor:pointer;"><img alt="가이드3" src="./image/tour/g16.jpg" style="margin-right: 10px;height: 200px"><br>이탈리아3</div>
        <div onclick="location.href='./g_list.jsp'" style="cursor:pointer;"><img alt="가이드4" src="./image/tour/g17.jpg" style="margin-right: 10px;height: 200px"><br>이탈리아4</div>
        <div onclick="location.href='./g_list.jsp'" style="right: 0%; margin-top: 110px; margin-left: 50px; cursor:pointer;"> 전체 보기 </div>
        </div>
        </p>
    </section>

</div>

           
            </div>
            
            
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