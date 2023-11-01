<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>게시판 메인</title>
  <link rel="stylesheet" type="text/css" href="css/c_list.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
  <script src="js//c_list.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  </head>

  <body>

  <jsp:include page="./header.html"></jsp:include>

   <div class="c_list_mtitle">
     <h3>  여행일정 공유 게시판</h3> 
  </div>

<div class="c_list_main">

   <div class="c_city_menu" >
    <div  class="c_city_menu1">
    <ul>
     <li><a><h4 class="c_uk">[ 영   국 ]</h4></a></li>
     <li><a><h6 class="c_lon" >- 런던</h6></a></li>
     <li><a><h6 class="c_liv">- 리버풀</h6></a></li>
     <li><a><h6 class="c_edn">- 에든버러</h6></a></li>
    </ul>
  </div>

  <div  class="c_city_menu1">
    <ul>
     <li><a><h4 class="c_ity">[ 이탈리아 ]</h4></a></li>
     <li><a><h6 class="c_roma">- 로마</h6></a></li>
     <li><a><h6 class="c_vene">- 베네치아</h6></a></li>
     <li><a><h6 class="c_mila">- 밀라노</h6></a></li>
    </ul>
  </div>

  <div  class="c_city_menu1">  
    <ul>
      <li><a><h4>[  프랑스  ]</h4></a></li>
      <li><a><h6>- 파리</h6></a></li>
      <li><a><h6>- 마르세유</h6></a></li>
      <li><a><h6>- 모나코</h6></a></li>
    </ul>
  </div>
   
  <div  class="c_city_menu1">
    <ul>
      <li><a><h4>[ 스페인  ]</h4></a></li>
      <li><a><h6>- 마드리드</h6></a></li>
      <li><a><h6>- 비르셀로나</h6></a></li>
      <li><a><h6>- 세비야</h6></a></li>
    </ul>
  </div>

   </div>
   

  
<div class="c_list_div" name="c_list_div">
   
  <table id="c_list_table" class="c_list_table" >
    <tr>
      <th class="c_headnum">글 번호</th>
      <th class="c_list_title">제목</th>
      <th class="c_list_writer">작성자</th>
      <th class="c_list_date">작성일</th>
      <th class="c_country">국가</th>
      <th class="c_city">도시</th>
    </tr>
    
    <jsp:useBean id="prac" class="adventour.C_dbsave" />
    <%
    	int itemsPerPage = 12; // 한 페이지에 보여줄 항목 수
              int thispage = 1; // 현재 페이지 번호
              if (request.getParameter("page") != null) {
            	  thispage = Integer.parseInt(request.getParameter("page"));
              }
              int startIndex = (thispage - 1) * itemsPerPage;
              int endIndex = startIndex + itemsPerPage;
              ArrayList<adventour.C_getset> communityList = prac.c_listshow();
              for (int i = startIndex; i < Math.min(endIndex, communityList.size()); i++) {
                adventour.C_getset obj = communityList.get(i);
    %>
    <tr>
      <td><%= obj.getC_num() %></td>
      <td class="c_list_title1"><%= obj.getC_title() %></td>
      <td><%= obj.getM_id() %></td>
     <%
// obj.getC_date()에서 받은 원래 날짜 문자열
String originalDateStr = obj.getC_date();

// SimpleDateFormat을 사용하여 원하는 형식으로 날짜 포맷
SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

try {
  Date originalDate = originalFormat.parse(originalDateStr);
  String formattedDateStr = targetFormat.format(originalDate);
%>
<td><%= formattedDateStr %></td>
<%
} catch (Exception e) {
  e.printStackTrace();
  // 오류 처리
}
%>
      <td><%= obj.getCountry() %></td>
      <td><%= obj.getCity() %></td>
    </tr>
    <%
      }
    %>
  </table>
  
  <!-- 페이징 버튼 -->
  <div class="pagination">
    <% int totalPages = (int) Math.ceil((double) communityList.size() / itemsPerPage);
       for (int i = 1; i <= totalPages; i++) {
           if (i == thispage) { %>
               <span><%= i %></span>
           <% } else { %>
               <a href="?page=<%= i %>"><%= i %></a>
           <% }
       }
    %>
    <input type="button" class="c_writebtn" name="c_writebtn" value="글 쓰기" onclick="location.href ='community.html' ">
  </div>
</div>
</div>
  <footer>
<jsp:include page="./footer.html"></jsp:include>
</footer><!---->

  

</body>

</html>