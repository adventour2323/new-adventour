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

  <script defer src="js/map_index.js"></script> 
   <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
  </head>

<body>

  <header>
<%
if (session.getAttribute("id") == null) {
%>
    <!-- header.html import -->
    <div id="header"></div>
<%
} else {
%>
    <jsp:include page="header_login.jsp"></jsp:include>
<%
}
%>
</header>

  <div class="pagename">
    <h1 class="pagename1">HOTEL</h1>
  </div><!--htitle-->
 
<%List<H_getset> list = (List<H_getset>) request.getAttribute("ukAll_list");
H_getset sch_country = null;
if (list != null && !list.isEmpty()) {
    sch_country = list.get(0);
}
%>
   

  <div class="schnav"> <!--검색 네비 = sch -->

    <div class="sch1">
      <h5 class="sch_title">☆ 나라</h5>
      <input type="text" class="sch_country" name="sch_country" placeholder="나라" value="<%= sch_country.getCountry_ko()%>">
    </div>
    
    <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      <input type="text" class="sch_city" name="sch_city" placeholder="도시" value="<%= sch_country.getCity_ko()%>">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="YYYY-MM-DD"  value="<%= sch_country.getSch_indate()%>">
          <!--   <input type="text" class="sch_indate" name="sch_indate" placeholder="YYYY-MM-DD" value="<%= sch_country.getH_indateY()%> - <%= sch_country.getH_indateM()%> - <%= sch_country.getH_indateD()%>"> -->
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
       <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM-DD" value="<%= sch_country.getSch_outdate()%>"> 
    <!--    <input type="text" class="sch_outdate" name="sch_outdate" placeholder="YYYY-MM-DD" value="<%= sch_country.getH_outdateY()%> - <%= sch_country.getH_outdateM()%> - <%= sch_country.getH_outdateD()%>">  -->
    </div>

   
    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      인원 수 : <input type="text" class="sch_adult" name="sch_adult" placeholder="인원 수" value="<%= sch_country.getH_roompeo1()%>">
 <!-- 유아 : <input type="text" class="sch_kid" name="sch_kid" placeholder="유/소아"></br>   -->
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격" value="<%= sch_country.getSch_minpri()%>" >
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격"  value="<%= sch_country.getSch_maxpri()%>">
    </div>

    <div class="sch123">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="radio" class="h_twin"  name="h_twin" value="트윈">트윈</br>
      <input type="radio" class="h_double"  name="h_double" value="슈퍼싱글">더블</br>
      <input type="radio" class="h_queen"  name="h_queen" value="퀸">퀸</br>
    </div>


    <div class="sch13">
    <a href=scsearch.hotel?uname=hotelSCSearch>
      <button class="sch_btn" type="button" name="sch_btn">검색하기</button>
     </a>
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
          <h2 class="h_tiname"><%=ukAll.getH_name_eng() %></h2>
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
          <input type="button" class="h_mapbtn" type="button" name="h_mapbtn" value="지도보기" onclick="showMap(<%= ukAll.getH_lat()%>, <%= ukAll.getH_lon()%>)">
          <input type="hidden" class="hh_lat" name="hh_lat" value="<%= ukAll.getH_lat()%>" />
           <input type="hidden" class="hh_lng" name="hh_lng" value="<%= ukAll.getH_lon()%>" />
          </a>
          </div>

        </div><!--h_tiinfo-->

        <div class="h_priinfo">

         <div class="h_prices">
          <h2 class="h_tiprice"><%= ukAll.getMin_h_roompri() %> ~ </h2>
          <a href="information.hotel?uname=<%= ukAll.getH_name_eng() %>">
          <input type="button" class="move_h" name="move_h" value="호텔 보기" href="information.hotel?uname=<%= ukAll.getH_name_eng() %>">
          </a>
         </div>

        <div class="ti_select">  

          <div class="selectTi1">   
           <input type="checkbox" class="selectTi" name="selectTi" value="1"> 
           <p class="bbb">선택</p>
          </div> 
    <%
if (session.getAttribute("id") != null) {
%>
    <div class="h_heart">
         <h3 class="beheart"> ♥ </h3>
       </div>
<%
} 
%>
 
     

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