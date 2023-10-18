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
      제목 : <input type="text" class="c_title" name="c_title" value="<%= obj.getC_title() %>" >
    </div><!--c_title_div-->

    <div class="c_city_div" name="c_city_div">
<% String country = obj.getCountry(); %>
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
      <div class="c_country" name="c_country">
        <option value="<%= obj.getCountry() %>"><%= country %></option>
         <option value="uk">영국</option>
         <option value="ity">이탈리아</option>
         <option value="fra">프랑스</option>
         <option value="spa">스페인</option>
      </select>
      <select  class="c_city" name="c_city">
        <option value="<%= obj.getCity() %>"><%= city %></option>
        <option value="lond">런던</option>
        <option value="liv">리버풀</option>
        <option value="eden">에든버러</option>
        <option value="roma">로마</option>
        <option value="vene">베네치아</option>
        <option value="mila">밀라노</option>
        <option value="paris">파리</option>
        <option value="mars">마르세유</option>
        <option value="mona">모나코</option>
        <option value="mard">마드리드</option>
        <option value="barc">바르셀로나</option>
        <option value="sev">세비야</option>
      </select>
    </div><!--c_city_div-->
      

    <div class="c_con_div" name="c_con_div">
      <textarea class="c_con" name="c_con" readonly><%= obj.getC_cont() %></textarea>
    </div><!--c_con_div-->

<div class="c_btns">
      <a href="community_list2.jsp">
      <input type="button" class="c_to_listbtn" name="c_to_listbtn" href="community_list2.jsp" value="목   록"/>
      </a>
 <div class="c_btns2">   
        <%
        if (session.getAttribute("id") != null && session.getAttribute("id").equals(obj.getM_id())) {
            
%>
     <a href="community_modify.jsp">
      <input type="button" class="c_to_modifybtn" name="c_to_modifybtn" value="수  정"/>
     </a> 
    
    
      <input type="button" class="c_to_deletebtn" name="c_to_deletebtnn" value="삭  제" />
  </div> 
<%
} 
%>
</div>
  </div><!--c_city_div-->
  </div><!--c_cont_main-->

  <!-- footer.html import-->
  <div id="footer"></div>

</body>

</html>