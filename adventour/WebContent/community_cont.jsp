<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="adventour.C_getset" %>
<%@ page import="adventour.C_dbsave" %><!-- 변수 get set들이 있는 자바파일 -->
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>게시판 글내용 </title>
  <link rel="stylesheet" type="text/css" href="css/community_cont.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/community_cont.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>

<body>

<%
if (session.getAttribute("id") == null) {
%>
    <!-- header.html import -->
    <div id="header"></div>
<%
} else {
%>
    <jsp:include page="header_login.jsp"  flush="true"></jsp:include>
<%
}
%>
 
<div class="c_cont_main">
    <h2>게시글 내용</h2>
    
    <% 
      // C_getset 객체 생성
      C_getset obj = new C_getset();

      // 데이터베이스에서 게시글 정보를 가져오는 코드
      try {
        String c_num = request.getParameter("c_num"); // 예: 게시글 번호를 파라미터로 받음
        C_dbsave db = new C_dbsave();
        ArrayList<C_getset> resultList = db.c_contshow(c_num);
 System.out.println(c_num);
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
 <form name="c_cont_tomodify" action="community_modify.jsp?c_num=<%=obj.getC_num() %>" method="post">
    <div class="c_info_div">

      <div class="c_writer_div" name="c_writer_div">
        작성자 : <input type="text" class="c_writer" name="c_writer" value="<%= obj.getM_id() %>" readonly>
      </div><!--c_writer_div-->

    <div class="c_date_div" name="c_date_div">
  작성날짜 : 
  <%
    // 원래 날짜 문자열을 가져옵니다.
    String originalDateStr = obj.getC_date();
    
    // SimpleDateFormat을 사용하여 날짜 형식을 변환합니다.
    SimpleDateFormat originalDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    try {
      Date originalDate = originalDateFormat.parse(originalDateStr);
      String formattedDateStr = targetDateFormat.format(originalDate);
  %>
  <%= formattedDateStr %>
  <%
    } catch (Exception e) {
      e.printStackTrace();
      // 오류 처리
  }
  %>
</div><!--c_date_div-->
    </div><!--c_info_div-->

    <div class="c_title_div" name="c_title_div">
      제목 : <input type="text" class="c_title" name="c_title" value="<%= obj.getC_title() %>" readonly>
    </div><!--c_title_div-->

    <div class="c_city_div" name="c_city_div">
      <div class="c_country" name="c_country">
        나라 :  <% String country = obj.getCountry(); %>
        <% if ("uk".equals(country)) { %>
          영국
        <% } else if ("ity".equals(country)) { %>
          이탈리아
        <% } else if ("fra".equals(country)) { %>
          프랑스
        <% } else if ("spa".equals(country)) { %>
          스페인
        <% } else { %>
          다른 나라
        <% } %>
      </div>
  
      <div class="c_city" name="c_city">
        <% String city = obj.getCity(); %>
   
        <% if ("lon".equals(city)) { %>
          런던
        <% } else if ("liv".equals(city)) { %>
          리버풀
        <% } else if ("eden".equals(city)) { %>
          에든버러
        <% } else if ("roma".equals(city)) { %>
          로마
        <% } else if ("vene".equals(city)) { %>
          베네치아
        <% } else if ("mila".equals(city)) { %>
          밀라노
        <% } else if ("paris".equals(city)) { %>
          파리
        <% } else if ("mars".equals(city)) { %>
          마르세유
        <% } else if ("mona".equals(city)) { %>
          모나코
        <% } else if ("mard".equals(city)) { %>
          마드리드
        <% } else if ("barc".equals(city)) { %>
          바르셀로나
        <% } else if ("sev".equals(city)) { %>
          세비야
        <% } else { %>
          다른 도시
        <% } %>
      </div><!--c_city_div-->
    </div>

    <div class="c_con_div" name="c_con_div">
      <textarea class="c_con" name="c_con" readonly><%= obj.getC_cont() %></textarea>
    </div><!--c_con_div-->
    
<div class="c_con_phos">
    <div class="c_con_pho1">
    <%= obj.getC_pho1() %>
        <img class="c_con_pho1_img" src="c_uploadfiles/<%= obj.getC_pho1() %>">
    </div>
    <div class="c_con_pho2">
        <img class="c_con_pho2_img" src="c_uploadfiles/<%= obj.getC_pho2() %>">
    </div>
    <div class="c_con_pho3">
        <img class="c_con_pho3_img" src="c_uploadfiles/<%= obj.getC_pho3() %>">
    </div>
    <div class="c_con_pho4">
        <img class="c_con_pho4_img" src="c_uploadfiles/<%= obj.getC_pho4() %>">
    </div>
    <div class="c_con_pho5">
        <img class="c_con_pho5_img" src="c_uploadfiles/<%= obj.getC_pho5() %>">
    </div>
</div>

    <div class="c_btns">
      <a href="community_list2.jsp?c_num=<%= obj.getC_num() %>">
        <input type="button" class="c_to_listbtn" name="c_to_listbtn" href="community_list2.jsp" value="목   록"/>
      </a>
      <div class="c_btns2">   
        <%
        if (session.getAttribute("id") != null && session.getAttribute("id").equals(obj.getM_id())) {
        %>
       
         <input type="submit" class="c_to_modifybtn" name="c_to_modifybtn" value="수  정"/>

      <a href="community_delete.jsp?c_num=<%=obj.getC_num() %>">
        <input type="button" class="c_to_deletebtn" name="c_to_deletebtnn" value="삭  제" />
        </a>
      </div> 
      <%
      } 
      %>
    </div>
  </div><!--c_cont_main-->
  </div><!--c_cont_main-->
</form>

<footer>
<%
if (session.getAttribute("id") == null) {
%>
    <!-- header.html import -->
     <div id="footer"></div>
<%
} else {
%>
    <jsp:include page="footer_login.html"  flush="true"></jsp:include>
<%
}
%>
 
 
</footer>

</body>

</html>