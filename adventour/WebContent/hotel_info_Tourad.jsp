<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="adventour.C_dbsave" %>
<%@ page import="adventour.t_getset" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 상세</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_info.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_info.js"></script>

    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1E47ve8m8-JtUPPTvXczFPM7MkBkoQCQ&callback=initMap"></script>
        
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
  </head>

<body>

 <%
 	request.setCharacterEncoding("UTF-8"); 
      String country_eng = request.getParameter("country_eng"); // 입력된 검색어 가져오기
      
      if(country_eng.equals("italy")){
      	country_eng = "italia";
      }
     
      System.out.println("불러온 나라"+country_eng);


   C_dbsave h_sch1 = new  C_dbsave();
   ArrayList<adventour.t_getset> searchResults = h_sch1. h_info_tourad(country_eng ); // 검색 수행
     
  if ( searchResults != null) {
    for (int s = 0; s < searchResults.size(); s++) {
        t_getset bbb = searchResults.get(s);
 %>
<a href="t_info.jsp?t_id=<%=bbb.getT_id() %>">
<img class="tour_ad_load" style="width: 400px; height: 300px;" src="<%= bbb.getT_img1() %>">
<h3 class="tour_name"><%= bbb.getT_name() %></h3>
<h4>지역의 유명 관광지를 투어로 즐겨보세요!</h4><br>
<h2 class="tour_price"><%= bbb.getT_price() %>원</h2>
</a>

<%
  }
}
%>

</body>

</html>