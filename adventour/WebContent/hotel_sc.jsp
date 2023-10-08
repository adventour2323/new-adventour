<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔스케쥴</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_sc.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_sc.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 


        <script defer src="googlemap_API/index.js"></script>
        <script
          defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"
        ></script>
   
  </head>

<body>

     <header>
		<!-- header.html import-->
    	<div id="header"></div>
	</header>

  <div class="pagename">
    <h1 class="pagename1">HOTEL</h1>
  </div><!--htitle-->

<%List<H_getset> list = (List<H_getset>) request.getAttribute("ukAll_list");
    H_getset sch_country = list.get(0);
%>
   

  <div class="schnav"> <!--검색 네비 = sch -->

    <div class="sch1">
      <h5 class="sch_title">☆ 지역</h5>
      <input type="text" class="sch_city" name="sch_city" placeholder="지역" value="<%= sch_country.getCountry_ko()%>">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" class="sch_indate" name="sch_indate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" class="sch_outdate" name="sch_outdate" placeholder="YYYY-MM_DD">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      성인 : <input type="text" class="sch_adult" name="sch_adult" placeholder="성인"></br>
      유아 : <input type="text" class="sch_kid" name="sch_kid" placeholder="유/소아"></br>
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격">
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격">
    </div>

    <div class="sch12">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="checkbox" class="h_twin"  name="h_twin" value="1">트윈</br>
      <input type="checkbox" class="h_double"  name="h_double" value="1">더블</br>
      <input type="checkbox" class="h_queen"  name="h_queen" value="1">퀸</br>
    </div>


    <div class="sch13">
      <button class="sch_btn" type="button" name="sch_btn">검색하기</button>
    </div>

    </div><!--schnav-->
  
  <div class="content">

    <div class="h_map"> <!--왼쪽 지도-->
      <div id="map" style="height: 300px;"> </div>

    <div class="rinav"> <!--장바구니 등 -->

      <button class="eur" type="button">고객센터</button>
      <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button>
      
    </div>


    </div>
<%

if (list != null) {
    for (int i = 0; i < list.size(); i++) {
        H_getset ukAll = list.get(i);
        
        String grade = ukAll.getH_grade();
        int starGrade = Integer.parseInt(grade);
       
%>
       <div class="scdform<%= i+1 %>"> <!--티켓정보-->

         <div class="h_mainpic">
           <img class="h_img1" src="image/hotel/h_image/<%= ukAll.getH_pho() %>" >
         </div>

         <div class="h_tiinfo">

          <div class="h_name">
          <h1 class="h_tiname"><%=ukAll.getH_name_eng() %></h1>
          <h3 class="h_tinameko">(<%=ukAll.getH_name_ko() %>)</h3>
          </div>

<div class="h_grade">
<!--    <h3><%= ukAll.getH_grade() %></h3>       --> 
    <%
    int starCount = Integer.parseInt(ukAll.getH_grade()); // 별 갯수 가져오기
    for (int ii = 0; ii < starCount; ii++) {
    %>
    <img id="grade_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %>
</div>

          <div class="h_restar">
          <h3 class="h_tirestar">리뷰별점</h3> <!--  리뷰 작성 후 숫자로 보여줄것  -->
          </div>

          <div class="h_addr">
           <h4 class="h_tiaddr"><%= ukAll.getH_addr() %></h4> 
          <button class="h_mapbtn" type="button" name="h_mapbtn">지도보기</button>
          </div>

        </div><!--h_tiinfo-->

        <div class="h_priinfo">

         <div class="h_prices">
          <h2 class="h_tiprice"><%= ukAll.getMin_h_roompri() %> ~ </h2>
          <button class="move_h" name="move_h" >호텔보기</button>
         </div>

        <div class="ti_select">  

          <div class="selectTi1">   
           <input type="checkbox" class="selectTi" name="selectTi" value="1"> 
           <p class="bbb">선택</p>
          </div> 
           
           <div class="h_heart">
           <h3 class="beheart"> ♥ </h3>
          </div>

        </div> <!--ti_select-->

      </div><!--h_priinfo-->
 
    </div><!--scdform-->

<%
    }
} else {
    System.out.println("null data");
}
%>







  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>