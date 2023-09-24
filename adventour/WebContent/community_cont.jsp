<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="adventour.C_getset" %>
<%@ page import="adventour.C_dbsave" %><!-- 변수 get set들이 있는 자바파일 -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>게시판 글내용 </title>
  <link rel="stylesheet" type="text/css" href="css/community.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/community.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>

<body>

  <header>
    <div id="header"></div>
  </header>

  <div class="c_cont_main">
    <h2>게시글 상세 보기</h2>
    
    <% 
      // C_getset 객체 생성
      C_getset obj = new C_getset();

      // 데이터베이스에서 게시글 정보를 가져오는 코드
      try {
        String c_num = request.getParameter("c_num"); // 예: 게시글 번호를 파라미터로 받음
        C_dbsave db = new C_dbsave();
        ArrayList<C_getset> resultList = db.c_contshow(c_num);

        if (resultList.size() > 0) {
          obj = resultList.get(0); // 첫 번째 결과를 obj에 할당
        } else {
          // 오류 처리 또는 메시지 설정
        }
      } catch (Exception e) {
        e.printStackTrace();
        // 오류 처리
      }
    %>

    <div class="c_info_div">
      <div class="c_writer_div" name="c_writer_div">
        작성자 : <input type="text" class="c_writer" name="c_writer" value="<%= obj.getM_id() %>" readonly>
      </div><!--c_writer_div-->

      <div class="c_date_div" name="c_date_div">
        작성날짜 : <p class="c_date" name="c_date"><%= obj.getC_date() %></p>
      </div><!--c_date_div-->
    </div><!--c_info_div-->

    <div class="c_title_div" name="c_title_div">
      제목 : <input type="text" class="c_title" name="c_title" value="<%= obj.getC_title() %>" readonly>
    </div><!--c_title_div-->

    <div class="c_city_div" name="c_city_div">
      <div class="c_country" name="c_country"><%= obj.getCountry() %></div>
      <div class="c_city" name="c_city"><%= obj.getCity() %></div>
    </div><!--c_city_div-->

    <div class="c_con_div" name="c_con_div">
      <textarea class="c_con" name="c_con" readonly><%= obj.getC_cont() %></textarea>
    </div><!--c_con_div-->

    <div class="c_tolist" name="c_tolist">
      <input type="button" class="c_to_listbtn" name="c_to_listbtn" value="목   록">
    </div><!--c_btn-->
  </div><!--c_div-->

  <!-- footer.html import-->
  <div id="footer"></div>

</body>

</html>