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
   <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
  </head>

  <script>
  $(document).ready(function() {
  function getCookie(name) {
      var value = "; " + document.cookie;
      var parts = value.split("; " + name + "=");
      if (parts.length === 2) return parts.pop().split(";").shift();
  }


  var h_mainde = getCookie("newCountry");
  var h_maincity = getCookie("newCity");
  var h_indate = getCookie("newCheckinDate");
  var h_outdate = getCookie("newCheckoutDate");
  var night_time = getCookie("newNightTime");


  $(document).on("click", ".sch_btn", function () {
	  // 기존 쿠키 값 삭제
	  document.cookie = "h_mainde=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	  document.cookie = "h_maincity=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	  document.cookie = "h_indate=; expires=Thu, 01 Jan 1970 00:00:00 UTC";	 
	  document.cookie = "h_outdate=; expires=Thu, 01 Jan 1970 00:00:00 UTC"; 
	  document.cookie = "night_time=; expires=Thu, 01 Jan 1970 00:00:00 UTC";


	  // 입력된 값들을 가져와서 변수에 저장
	  var newCountry = document.querySelector("#sch_country").value;
	  var newCity = document.querySelector("#sch_city").value;
	  var newCheckinDate = document.querySelector("#sch_indate").value;
	  var newCheckoutDate = document.querySelector("#sch_outdate").value;
	  var newNightTime = document.querySelector("#night_time").value;

	  // 새로운 값을 쿠키에 설정
document.cookie = "newCountry=" + newCountry;
document.cookie = "newCity=" + newCity;
document.cookie = "newCheckinDate=" + newCheckinDate;
document.cookie = "newCheckoutDate=" + newCheckoutDate;
document.cookie = "newNightTime=" + newNightTime;

// 값이 변경된 후에 alert 창 실행
alert(" 6번 호텔 스케쥴 박수 " + newCountry);

	  // 나머지 처리 또는 폼 제출을 여기에 추가
	});

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
      <select type="text" id="sch_country" class="sch_country" name="sch_country" placeholder="나라" required="required" value="<%= h_sclist1.getCountry_ko() %>">
				<option value="uk">영국</option>
					<option value="italy">이탈리아</option>
					<option value="france">프랑스</option>
					<option value="spain">스페인</option>
      </select>
    </div>
    
    <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      <select type="text" id="sch_city" class="sch_city" name="sch_city" placeholder="도시" required="required" value="<%= h_sclist1.getCity_ko()%>">
    					<option value="london">런던</option>
					<option value="liverpool">리버풀</option>
					<option value="edinburgh">에든버러</option>
					<option value="rome">로마</option>
					<option value="venice">베네치아</option>
					<option value="milano">밀라노</option>
					<option value="paris">파리</option>
					<option value="marseille">마르세유</option>
					<option value="monaco">모나코</option>
					<option value="madrid">마드리드</option>
					<option value="barcelona">바르셀로나</option>
					<option value="sevilla">세비야</option>
				</select> 
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
          <a href="information.hotel?uname=hotelinfom&hotelname=<%= h_sclist.getH_name_eng()%>">
          <input type="button" class="move_h" name="move_h" value="호텔 보기" href="information.hotel?uname=hotelinfom2&hotelname=<%= h_sclist.getH_name_eng() %>">
          </a>
         </div>

        <div class="ti_select">  

 <%
if (session.getAttribute("id") != null) {
%>
<a href="h_like.jsp?m_id=<%= session.getAttribute("id") %>&h_name_eng=<%= h_sclist.getH_name_eng() %>">
  <input type="button" class="beheart" value="♥ 찜하기">
</a> 
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
        %>
    </div>

  </div><!--content-->

  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>

</html>