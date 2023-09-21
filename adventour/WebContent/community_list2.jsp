<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>게시판 메인</title>
  <link rel="stylesheet" type="text/css" href="css/c_list2.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
  <script src="js/c_list.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>

<body>

  <jsp:include page="./header.html"></jsp:include>
<form class="c_listform" name="c_listform" action="c_listsearch.jsp"> <!-- 검색창 사용을 위해 사용 -->
  <div class="c_list_mtitle">
    <h3>여행일정 공유 게시판</h3>
     <div class="c_list_sch">
    <input type="text" class="c_sch" name="c_sch" placeholder="검색어를 입력하세요.">
    <input type="submit" class="c_schbtn" name="c_sch" value="검색">
  </div>
  </div>
 </form>
  <div class="c_list_main">

    <div class="c_city_menu">
      <img src="image/img/c_event1.jpeg" style="width: 150px; height: 400px;">
       <h3>!! 마 감 임 박 !!</h3><br>
       <h4>에텔탑 투어!</h4><br>
        <h4>50,000 ~ </h4>
    </div>

    <div class="c_list_div" name="c_list_div">
      <table id="c_list_table" class="c_list_table">
        <tr>
          <th class="c_headnum">글 번호</th>
          <th class="c_list_title">제목</th>
          <th class="c_list_writer">작성자</th>
          <th class="c_list_date">작성일</th>
          <th class="c_country">국가</th>
          <th class="c_city">도시</th>
        </tr>
        <div id="searchResultsDiv" class="c_list_div" name="c_list_div">
 

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
            String countryName = obj.getCountry();
            if ("uk".equals(countryName)) {
              countryName = "영국";
            } else if ("ity".equals(countryName)) {
              countryName = "이탈리아";
            } else if ("fra".equals(countryName)) {
              countryName = "프랑스";
            } else if ("spa".equals(countryName)) {
              countryName = "스페인";
            }

            String cityName = obj.getCity();
            if ("lond".equals(cityName)) {
              cityName = "런던";
            } else if ("liv".equals(cityName)) {
              cityName = "리버풀";
            } else if ("eden".equals(cityName)) {
              cityName = "에든버러";
            } else if ("roma".equals(cityName)) {
              cityName = "로마";
            } else if ("vene".equals(cityName)) {
              cityName = "베네치아";
            } else if ("mila".equals(cityName)) {
              cityName = "밀라노";
            } else if ("paris".equals(cityName)) {
              cityName = "파리";
            } else if ("mars".equals(cityName)) {
              cityName = "마르세유";
            } else if ("mona".equals(cityName)) {
              cityName = "모나코";
            } else if ("mard".equals(cityName)) {
              cityName = "마드리드";
            } else if ("barc".equals(cityName)) {
              cityName = "바르셀로나";
            } else if ("sev".equals(cityName)) {
              cityName = "세비야";
            }
        %>
        <tr>
          <td><%= obj.getC_num() %></td>
          <td class="c_list_title1"><%= obj.getC_title() %></td>
          <td><%= obj.getM_id() %></td>
          <td><%= obj.getC_date() %></td>
          <td><%= countryName %></td>
          <td><%= cityName %></td>
        </tr>
        <%
          }
        %>
        </div>
      </table>    
    </div>
  </div>
       <!-- 페이징 버튼 -->
  
      <div class="pagination">
        <%
          int totalPages = (int) Math.ceil((double) communityList.size() / itemsPerPage);
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

  <footer>
    <jsp:include page="./footer.html"></jsp:include>
  </footer>
</body>

</html>
