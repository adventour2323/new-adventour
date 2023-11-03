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

   <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
  <script defer src="js/map_index.js"></script> 
   
  </head>


<body>

<script>
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}

// 쿠키에서 값을 가져옵니다.
var h_mainde = getCookie("h_mainde");
var h_maincity = getCookie("h_maincity");
var h_indateY = getCookie("h_indateY");
var h_indateM = getCookie("h_indateM");
var h_indateD = getCookie("h_indateD");
var h_outdateY = getCookie("h_outdateY");
var h_outdateM = getCookie("h_outdateM");
var h_outdateD = getCookie("h_outdateD");
var h_mainpeo = getCookie("h_mainpeo");

alert("h_outdateY: " + h_outdateY); // 확인 ok

//폼이 서바미트될 때
document.querySelector("form[name='schnav_form']").addEventListener("submit", function (e) {
    e.preventDefault(); // 폼의 기본 동작을 중단

    // 수정할 날짜 값을 가져옴
     var newCountry = document.querySelector("#sch_country").value;
    var newCity = document.querySelector("#sch_outdate").value;
    var newCheckinDate = document.querySelector("#sch_indate").value;
    var newCheckoutDate = document.querySelector("#sch_outdate").value;

    // 해당 쿠키를 새로운 값으로 업데이트
    document.cookie = "newCountry=" + newCheckinDate;
    document.cookie = "newCity=" + newCheckoutDate;
    document.cookie = "h_indateY=" + newCheckinDate;
    document.cookie = "h_outdateY=" + newCheckoutDate;

    // 다른 필요한 작업을 수행하거나 폼을 서버로 제출
    this.submit();
});

</script>

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
 

<form name="schnav_form" action="scsearch.hotel?uname=hotelSCSearch"  method="post">
  <div class="schnav"> <!--검색 네비 = sch -->
  

    <div class="sch1">
      <h5 class="sch_title">☆ 나라</h5>
      <input type="text" id="sch_country"  class="sch_country" name="sch_country" placeholder="나라" required="required" >
    </div>
    
    <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      
   
     <input type="text" id="sch_city" class="sch_city" name="sch_city" placeholder="도시" required="required" >

      
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="YYYY-MM-DD" required="required">
 
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM-DD" required="required"> 

    </div>

   
    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      인원 수 : <input type="text" class="sch_adult" name="sch_adult" placeholder="인원 수" value="1" required="required">
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
</form>
  
  <div class="content">

    <div class="h_map"> <!--왼쪽 지도-->
      <div id="map" style="height: 290px;"> </div>

    <div class="rinav"> <!--장바구니 등 -->

      <button class="eur" type="button">고객센터</button>
  <!-- <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button>-->
      
    </div>


    </div>
     <div class="sch_result">
<%
Cookie[] cookies = request.getCookies(); // 쿠키 목록 받아오기

String h_indateY = null;
String h_indateM = null;
String h_indateD = null;
String h_outdateY = null;
String h_outdateM = null;
String h_outdateD = null;

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
        } else if (name.equals("h_indateY")) {
            h_indateY = value;
        } else if (name.equals("h_indateM")) {
            h_indateM = value;
        } else if (name.equals("h_indateD")) {
            h_indateD = value;
        }else if (name.equals("h_outdateY")) {
        	h_outdateY = value;
        } else if (name.equals("h_outdateM")) {
        	h_outdateM = value;
        } else if (name.equals("h_outdateD")) {
        	h_outdateD = value;
        }
    }
}
if (h_indateY != null && h_indateM != null && h_indateD != null) {
%>
   <p class="h_indate">체크인 날짜: <%= h_indateY + "-" + h_indateM + "-" + h_indateD %></p>

<%
}
 
if (h_outdateY != null && h_outdateM != null && h_outdateD != null) {
%>
   <p class="h_indate">체크아웃 날짜: <%= h_outdateY + "-" + h_outdateM + "-" + h_outdateD %></p>

<%
}
%>
 </div><!-- sch_result -->
 
     <%
    String city_ko = "";
	city_ko = request.getParameter("city");
    List<H_getset> list = (List<H_getset>) request.getAttribute("ukAll_list");
H_getset sch_country = null;
if (list != null && !list.isEmpty()) {
    sch_country = list.get(0);
}
%>
   
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
           
          <input type="button" class="h_mapbtn" type="button" name="h_mapbtn" value="지도보기" 
          onclick="showMap(<%= ukAll.getH_lat()%>, <%= ukAll.getH_lon()%>)">
          
          <input type="hidden" class="hh_lat" name="hh_lat" value="<%= ukAll.getH_lat()%>" />
           <input type="hidden" class="hh_lng" name="hh_lng" value="<%= ukAll.getH_lon()%>" />
          </a>
          </div>

        </div><!--h_tiinfo-->

        <div class="h_priinfo">

         <div class="h_prices">
          <h2 class="h_tiprice"><%= ukAll.getMin_h_roompri() %> ~ </h2>
          <a href="information.hotel?uname=<%= ukAll.getH_name_eng() %>">
          <input type="button" class="move_h" name="move_h" value="호텔 보기" href="information.hotel?uname=<%= ukAll.getH_name_eng() %>"/>
          </a>
         </div>


 <%
if (session.getAttribute("id") != null) {
%>
<a href="h_like.jsp?m_id=<%= session.getAttribute("id") %>&h_name_eng=<%= ukAll.getH_name_eng() %>">
  <input type="button" class="beheart" value="♥ 찜하기">
</a> 
<%
} 
%>


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
        
        %>
    </div>

  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>