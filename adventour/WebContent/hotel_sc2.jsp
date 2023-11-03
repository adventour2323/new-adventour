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

<script>
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}

// 쿠키에서 값을 가져옵니다.
var h_mainde = getCookie("sch_country");
var h_maincity = getCookie("sch_city");
var h_indate = getCookie("sch_city");
var h_outdate = getCookie("sch_indate");
var h_mainpeo = getCookie("sch_adult");

alert("h_outdateY: " + h_outdateY); // 확인 ok

//폼이 서바미트될 때
document.querySelector("form[name='schnav_form']").addEventListener("submit", function (e) {
    e.preventDefault(); // 폼의 기본 동작을 중단

    // 수정할 날짜 값을 가져옴
     var newCountry = document.querySelector("#sch_country").value;
    var newCity = document.querySelector("#sch_city").value;
    var newCheckinDate = document.querySelector("#sch_indate").value;
    var newCheckoutDate = document.querySelector("#sch_outdate").value;

    // 해당 쿠키를 새로운 값으로 업데이트
    document.cookie = "newCountry=" + newCheckinDate;
    document.cookie = "newCity=" + newCheckoutDate;
    document.cookie = "h_indate=" + newCheckinDate;
    document.cookie = "h_outdate=" + newCheckoutDate;

    // 다른 필요한 작업을 수행하거나 폼을 서버로 제출
    this.submit();
});

</script>

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
  
      <% 
        List<H_getset> list_scsearch1 = (List<H_getset>) request.getAttribute("scsearch_list");
        
        if (list_scsearch1 != null && !list_scsearch1.isEmpty()) {
        	 for (int i = 0; i < 1; i++) {
                 H_getset h_sclist1 = list_scsearch1.get(0);
                 
              
        %> 

<form name="schnav_form" action="scsearch.hotel?uname=hotelSCSearch"  method="post" >
  <div class="schnav"> <!--검색 네비 = sch -->

    <div class="sch1">
      <h5 class="sch_title">☆ 나라</h5>
      <input type="text" id="sch_country" class="sch_country" name="sch_country" placeholder="나라" required="required" value="<%= h_sclist1.getCountry_ko() %>">
    </div>
    
    <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      <input type="text" id="sch_city" class="sch_city" name="sch_city" placeholder="도시" required="required" value="<%= h_sclist1.getCity_ko()%>">
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
   <!-- <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="YYYY-MM-DD" required="required" value="<%= h_sclist1.getH_indate() %>">  -->  
     <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="YYYY-MM-DD" required="required" >
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
   <!--    <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM-DD" required="required"  value="<%= h_sclist1.getH_outdate() %>">   -->  
 <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM-DD" required="required" >
    </div>

   
    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      인원 수 : <input type="text"  id="sch_adult" class="sch_adult" name="sch_adult" placeholder="인원 수" value="1" >
 <!-- 유아 : <input type="text" class="sch_kid" name="sch_kid" placeholder="유/소아"></br>   -->
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격 " value="">
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격"  value="">
    </div>

    <div class="sch123">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="radio" class="h_twin"  name="h_type" value="트윈">트윈</br>
      <input type="radio" class="h_double"  name="h_type" value="슈퍼싱글" checked>더블</br>
      <input type="radio" class="h_queen"  name="h_type" value="퀸">퀸</br>
    </div>


    <div class="sch13">
<!--    <a href=scsearch.hotel?uname=hotelSCSearch> --> 
      <button class="sch_btn" type="submit" name="sch_btn">검색하기</button>
<!--      </a> --> 
    </div>

    </div><!--schnav-->
    <% 
        	 }
    %>
</form>

  <div class="content">

    <div class="h_map"> <!--왼쪽 지도-->
      <div id="map" style="height: 290px;"> </div>

    <div class="rinav"> <!--장바구니 등 -->

      <button class="eur" type="button">고객센터</button>
<!--       <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button> --> 
      
    </div>


     </div>
         <div class="sch_result">
<%
Cookie[] cookies = request.getCookies(); // 쿠키 목록 받아오기



for (Cookie cookie : cookies) {
    String name = cookie.getName();
    String value = cookie.getValue();
    
    if (!name.equals("JSESSIONID")) {
        if (name.equals("h_mainde")) {
%>
               <p class="h_mainde"><%= value %></p>
<%
        } else if (name.equals("h_maincity")) {
%>
                 <p class="h_maincity"><%= value %></p> 
<%
        }else if (name.equals("h_indate")) {
        	%>
            <p class="h_indate"><%= value %></p> 


 </div><!-- sch_result -->

          <% 
    
        
        if (list_scsearch1 != null && !list_scsearch1.isEmpty()) {
            for (int i = 0; i < list_scsearch1.size(); i++) {
                H_getset h_sclist = list_scsearch1.get(i);
             
        %>
        <!-- 아래 코드는 데이터가 있는 경우에만 실행 -->
        <div class="scdform<%= i + 1 %>">
         <div class="h_mainpic">
           <img class="h_img1" src="image/hotel/h_image/<%= h_sclist.getH_pho() %>" >
         </div>

         <div class="h_tiinfo">

          <div class="h_name">
          <h2 class="h_tiname"><%=h_sclist.getH_name_eng() %></h2>
          <h3 class="h_tinameko">(<%=h_sclist.getH_name_ko() %>)</h3>
          </div>

<div class="h_grade">

    <%
    int starCount = Integer.parseInt(h_sclist.getH_grade()); // 별 갯수 가져오기
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
           <h4 class="h_tiaddr"><%= h_sclist.getH_addr() %></h4> 
          <input type="button" class="h_mapbtn" type="button" name="h_mapbtn" value="지도보기" onclick="showMap(<%= h_sclist.getH_lat()%>, <%= h_sclist.getH_lon()%>)">
          <input type="hidden" class="hh_lat" name="hh_lat" value="<%= h_sclist.getH_lat()%>" />
           <input type="hidden" class="hh_lng" name="hh_lng" value="<%= h_sclist.getH_lon()%>" />
          </a>
          </div>

        </div><!--h_tiinfo-->

        <div class="h_priinfo">

         <div class="h_prices">
          <h2 class="h_tiprice"><%= h_sclist.getMin_h_roompri() %> ~ </h2>
          <a href="information.hotel?uname=<%= h_sclist.getH_name_eng() %>">
          <input type="button" class="move_h" name="move_h" value="호텔 보기" href="information.hotel?uname=<%= h_sclist.getH_name_eng() %>">
          </a>
         </div>

        <div class="ti_select">  

 <!--         <div class="selectTi1">   
           <input type="checkbox" class="selectTi" name="selectTi" value="1"> 
           <p class="bbb">선택</p>
          </div>  --> 
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
        %>
        <div class="no-results">
            <h3>검색 결과가 없습니다.</h3>
            <h3>검색 조건을 다시 설정해 주세요.</h3>
        </div>
        <%
        }
        }
        %>
    </div>

  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>