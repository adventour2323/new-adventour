<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>헤더푸터 삽입 확인용</title>
  <link rel="stylesheet" type="text/css" href="css/c_list.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js//c_list.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  </head>

  <body>
    <div class="header">

      <div class="header1">
        <img id="logo" width="210px" height="30px" src="image/img/logo123.png">
  
       
        <div class="home">
          <ul class="homeli">
            <li class="home11">홈</li>
            <li class="home1">로그인</li>
            <li class="home1" onclick = "location.href = 'join.html' ">회원가입</li>
            <li class="home1">장바구니</li>
            <li class="home11">메뉴</li>
          </ul>
        </div><!--home-->
  
      </div><!--header1-->
  
      <div class="menu">
        <ul class="menuli">
          <li class="menu1"><button class="movet" onclick = "location.href = 'Tour_page.html' "><p>투어</p></button> </li>
          <li class="menu2"><button class="moveb" onclick = "location.href = 'bus.html' "><p>버스</p> </li>
          <li class="menu3"><button class="moveh" onclick = "location.href = 'hotel.html' "><p>호텔</p></button> </li>
          <li class="menu4"><button class="moves" onclick = "location.href = 'shop_index.html' "><p>쇼핑</p></button> </li>
          <li class="menu5"><button class="movec" onclick = "location.href = 'shop_index.html' "><p>게시판</p></button> </li>
          <li class="menu6"><button class="movem" onclick = "location.href = 'shop_index.html' "><p>마이페이지</p></button> </li>
        </ul>
      </div><!--menu-->
    </div><!--header-->
  
    <div class="schtop">
   
      <div class="uk_top">
      <ul class="h_cityli1">
        <li class="ukli"> <영국></li>
        <li class="h_lond"><button class="move_lon" onclick = "location.href = 'hotel_sc.html' ">런던</button> </li>
        <li class="h_liverp"><button class="move_liverp" onclick = "location.href = 'hotel_sc.html' ">리버풀</button> </li>
        <li class="h_Edinb"><button class="move_Edinb" onclick = "location.href = 'hotel_sc.html' ">에든버러</button> </li>
      </ul>
      </div>
  
      <div class="ity_top">
      <ul class="h_cityli2">
        <li class="ityli"> <이탈리아></li>
        <li class="h_roma"><button class="move_roma" onclick = "location.href = 'hotel_sc.html' ">로마</button> </li>
        <li class="h_vene"><button class="move_vene" onclick = "location.href = 'hotel_sc.html' ">베네치아</button> </li>
        <li class="h_mila"><button class="move_mila" onclick = "location.href = 'hotel_sc.html' ">밀라노</button> </li>
      </ul>
    </div>
  
  <div class="fra_top">
      <ul class="h_cityli3">
        <li class="frali"> <프랑스></li>
        <li class="h_paris"><button class="move_paris" onclick = "location.href = 'hotel_sc.html' ">파리</button> </li>
        <li class="h_marc"><button class="move_marc" onclick = "location.href = 'hotel_sc.html' ">마르세유</button> </li>
        <li class="h_mona"><button class="move_mona" onclick = "location.href = 'hotel_sc.html' ">모나코</button> </li>
      </ul>
      </div>
  
      <div class="spain_top">
      <ul class="h_cityli4">
        <li class="spainli"> <스페인></li>
        <li class="h_mard"><button class="move_mard" onclick = "location.href = 'hotel_sc.html' ">마드리드</button> </li>
        <li class="h_barc"><button class="move_barc" onclick = "location.href = 'hotel_sc.html' ">바르셀로나</button> </li>
        <li class="h_sev"><button class="move_sev" onclick = "location.href = 'hotel_sc.html' ">세비야</button> </li>
      </ul>
    </div>
  </div><!--schtop-->




   <div class="c_city_menu" >
    <div  class="c_city_menu1">
    <ul>
     <li><h4>영국</h4></li>
     <li><h6>런던</h6></li>
     <li><h6>리버풀</h6></li>
     <li><h6>에든버러</h6></li>
    </ul>
  </div>

  <div  class="c_city_menu1">
    <ul>
     <li><h4>이탈리아</h4></li>
     <li><h6>로마</h6></li>
     <li><h6>베네치아</h6></li>
     <li><h6>밀라노</h6></li>
    </ul>
  </div>

  <div  class="c_city_menu1">  
    <ul>
      <li><h4>프랑스</h4></li>
      <li><h6>파리</h6></li>
      <li><h6>마르세유</h6></li>
      <li><h6>모나코</h6></li>
    </ul>
  </div>
   
  <div  class="c_city_menu1">
    <ul>
      <li><h4>스페인</h4></li>
      <li><h6>마드리드</h6></li>
      <li><h6>비르셀로나</h6></li>
      <li><h6>세비야</h6></li>
    </ul>
  </div>

   </div>
  
<div class="c_list_div" name="c_list_div">
  <h2>여행일정 공유 게시판</h2>
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
      <td><%= obj.getC_date() %></td>
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
  <footer>
    <div class="footerB">
        <!-- 푸터 네비박스-->
        <div class="fNvB">
            <!--푸터 네비 왼쪽 마진때문에 쩔 수 없이 만든 div임 -->
            <div></div>
            <nav><a href="tour.html">가이드투어</a></nav>
            <nav><a href="bus.html">버스</a></nav>
            <nav><a href="hotel.css">호텔</a></nav>
            <nav><a href="shop_index.html">쇼핑몰</a></nav>
            <nav><a href="">고객센터</a></nav>
            <nav><a href="">게시판</a></nav>
            <nav><a href="">장바구니</a></nav>
            <nav><a href="mypage_index.html">마이페이지</a></nav>
            <nav><a href="">회원가입</a></nav>
            <nav><a href="">로그인</a></nav>
        </div>
        <!-- 푸터 회사 정보 박스-->
        <div class="fInfoB">
            <span><a><img src="img/logo123.png" title="logo"></a></span>
            <span>
                <p><a>회사주소</br></br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br>
                    </a></p>
            </span>
            <span>
                <p><a>회사 정보</br></br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br> 우리 회사 개쩔어</br>
                    </a></p>
            </span>
        </div>
    </div>
</footer><!---->

  

</body>

</html>