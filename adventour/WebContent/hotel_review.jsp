<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 리뷰입력 창</title>
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
<style>
/* 별점 */

.star_div{ 

	  width: 1500px;
	  height: 600px;
	  margin-left: 200px;
}
.stars_rating_aera{	

	  width: 500px;
	  height: 200px;
	    margin-top:40px;


}
#star_total{

	width: 50px;
	  height: 50px;
	    margin-left: 130px;
	     margin-top:40px;
	     padding-top: 20px;
}

.fstar-div{
	
 	width: 260px;
	  height: 50px;
	  margin-left: 150px;
	  margin-top:-40px;
	  
}


.hotel-rating-star {

	width: 200px;
	height: 70px;
    display: flex;
    flex-direction: column;
    align-items: center; /* 가운데 정렬 */
    margin-top: 20px; /* 원하는 상단 여백 설정 */
    margin-left: 200px;
    font-size:32px;
}

.star-div {
    display: flex;
    flex-direction: row-reverse; /* 별점을 오른쪽에서 왼쪽으로 정렬 */
}


.star-div input[type="radio"] {
    display: none;
}

.star-div label {
    font-size:50px;
    color: transparent;
    text-shadow: 0 0 0 #333;
    cursor: pointer;
}

.star-div label:hover {
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.star-div label:hover ~ label {
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.star-div input[type="radio"]:checked ~ label {
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}


.star_others{

	width: 500px;
	height:200px;
	margin-left: 500px;
	margin-top: -200px;	
}
.star_clean_div{

	width: 400px;
	height:100px;
	margin-left: 50px;
}
.star_clean_title{

	width: 70px;
	height:100px;
	margin-left: 0px;
}
.star_clean_title h3{

	padding-top: 40px;
}

.clean_star-div{
	width: 280px;
	height:60px;
	margin-left: 0px;
	margin-top:-80px;
}

.star_kind_div{

	width: 400px;
	height:100px;
	margin-left: 50px;
}
.star_kind_title{

	width: 70px;
	height:100px;
	margin-left: 0px;
}
.star_kind_title h3{

	padding-top: 40px;
}

.kind_star-div{
	width: 280px;
	height:60px;
	margin-left:0px;
	margin-top:-80px;
}
/*----------------------------------------------------------------------------*/
.star_others2{

	width: 500px;
	height:200px;
	margin-left: 1000px;
	margin-top: -200px;	
}
.star_loca_div{

	width: 400px;
	height:100px;
	margin-left: 50px;
}
.star_loca_title{

	width: 70px;
	height:100px;
	margin-left: 0px;
}
.star_loca_title h3{

	padding-top: 40px;
}

.loca_star-div{
	width: 280px;
	height:60px;
	margin-left: 0px;
	margin-top:-80px;
}

.star_sleep_div{

	width: 400px;
	height:100px;
	margin-left: 50px;
}
.star_sleep_title{

	width: 70px;
	height:100px;
	margin-left: 0px;
}
.star_sleep_title h3{

	padding-top: 40px;
}

.sleep_star-div{
	width: 280px;
	height:60px;
	margin-left: 0px;
	margin-top:-80px;
}
/*----------------------------------------리뷰입력창-----------------------------------------------*/

#reviewContents {
	width:900px;
	height:200px;
	margin-left: 300px;
	margin-top:40px;
	border: solid 1.5px #D3D3D3;
	resize: none; /* 크기 조절 비활성화 */
}
#charCount{
	margin-top:0px;
	margin-right: 300px;
}
.form-group{
	
	width:1500px;
	height:150px;
}
.review-write-btn{
	width:100px;
	height:40px;
	margin-left: 700px;
	margin-top:110px;
	
}
#rating_comment fieldset{
    display: inline-block;
    /* direction: rtl; */
    border: 0;
}


</style>
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


  
<!-- 후기 작성 -->
<div class="star_div">
    <form name="rating_comment" id="rating_comment" action="" method="post">
        <h2>이용 후기를 남겨주세요!</h2>
        <div class="stars_rating_aera">
            <div id="star_total">
                <h2>총점</h2>
            </div>
            <fieldset class="fstar-div">
                <div class="star-div">
                    <input type="radio" name="reviewStar" value="5" id="rate1">
                    <label for="rate1">★</label>
                    <input type="radio" name="reviewStar" value="4" id="rate2">
                    <label for="rate2">★</label>
                    <input type="radio" name="reviewStar" value="3" id="rate3">
                    <label for="rate3">★</label>
                    <input type="radio" name="reviewStar" value="2" id="rate4">
                    <label for="rate4">★</label>
                    <input type="radio" name="reviewStar" value="1" id="rate5">
                    <label for="rate5">★</label>
                </div>
            </fieldset>
            <div class="hotel-rating-star" id="hotel-rating-star" style="flex;">
                <div>평점 <span>5</span></div>
            </div>
        </div><!-- stars_rating_aera -->
        <div class="star_others">
            <div class="star_clean_div">
                <div class="star_clean_title"><h3>청결도</h3></div>
                <fieldset class="clean_star-div">
                    <div class="star-div">
                        <input type="radio" name="cleanStar" value="5" id="cleanRate1">
                        <label for="cleanRate1">★</label>
                        <input type="radio" name="cleanStar" value="4" id="cleanRate2">
                        <label for="cleanRate2">★</label>
                        <input type="radio" name="cleanStar" value="3" id="cleanRate3">
                        <label for="cleanRate3">★</label>
                        <input type="radio" name="cleanStar" value="2" id="cleanRate4">
                        <label for="cleanRate4">★</label>
                        <input type="radio" name="cleanStar" value="1" id="cleanRate5">
                        <label for="cleanRate5">★</label>
                    </div>
                </fieldset>
            </div><!-- star_clean_div -->
            <div class="star_kind_div">
                <div class="star_kind_title"><h3>친절도</h3></div>
                <fieldset class="kind_star-div">
                    <div class="star-div">
                        <input type="radio" name="kindStar" value="5" id="kindRate1">
                        <label for="kindRate1">★</label>
                        <input type="radio" name="kindStar" value="4" id="kindRate2">
                        <label for="kindRate2">★</label>
                        <input type="radio" name="kindStar" value="3" id="kindRate3">
                        <label for="kindRate3">★</label>
                        <input type="radio" name="kindStar" value="2" id="kindRate4">
                        <label for="kindRate4">★</label>
                        <input type="radio" name="kindStar" value="1" id="kindRate5">
                        <label for="kindRate5">★</label>
                    </div>
                </fieldset>
            </div><!-- star_kind_div -->
        </div><!-- star_others -->
        <div class="star_others2">
            <div class="star_loca_div">
                <div class="star_loca_title"><h3>위치</h3></div>
                <fieldset class="loca_star-div">
                    <div class="star-div">
                        <input type="radio" name="locaStar" value="5" id="locaRate1">
                        <label for="locaRate1">★</label>
                        <input type="radio" name="locaStar" value="4" id="locaRate2">
                        <label for="locaRate2">★</label>
                        <input type="radio" name="locaStar" value="3" id="locaRate3">
                        <label for="locaRate3">★</label>
                        <input type="radio" name="locaStar" value="2" id="locaRate4">
                        <label for="locaRate4">★</label>
                        <input type="radio" name="locaStar" value="1" id="locaRate5">
                        <label for="locaRate5">★</label>
                    </div>
                </fieldset>
            </div><!-- star_loca_div -->
            <div class="star_sleep_div">
                <div class="star_sleep_title"><h3>수면의질</h3></div>
                <fieldset class="sleep_star-div">
                    <div class="star-div">
                        <input type="radio" name="sleepStar" value="5" id="sleepRate1">
                        <label for="sleepRate1">★</label>
                        <input type="radio" name="sleepStar" value="4" id="sleepRate2">
                        <label for="sleepRate2">★</label>
                        <input type="radio" name="sleepStar" value="3" id="sleepRate3">
                        <label for="sleepRate3">★</label>
                        <input type="radio" name="sleepStar" value="2" id="sleepRate4">
                        <label for="sleepRate4">★</label>
                        <input type="radio" name="sleepStar" value="1" id="sleepRate5">
                        <label for="sleepRate5">★</label>
                    </div>
                </fieldset>
            </div><!-- star_sleep_div -->
        </div><!-- star_others2 -->
        <div class="form-group">
            <textarea class="form-control" id="reviewContents" name="review_content" placeholder="리뷰를 남겨주세요!!" rows="4"></textarea>
            <div id="charCount" style="float: right;">0 / 255</div>
        </div>
        <div class="form-group">
            <input type="hidden" value="" name="t_id">
            <input type="submit" value="등록하기" class="review-write-btn">
        </div>
    </form>
</div><!-- star_div -->					







<div class="modal">
  <span class="close">&times;</span>
  <img class="modal_content" id="img01">
</div>


  <footer>
<!-- footer.html import-->
	<div id="footer"></div>
  </footer>

  

</body>
<script >

var country_eng = $(".h_info_touradC").val();
//   alert(country_eng);
   // AJAX 요청 보내기
//   alert(country_eng);
   $.ajax({
       type: "GET",
       url: "hotel_info_Tourad.jsp", // 검색 결과를 처리할 JSP 페이지 URL
       data: { country_eng: country_eng }, // 검색어를 서버로 전송
       success: function(data) {
           // 서버에서 받은 데이터를 .h_info_tourad의 내부 HTML로 설정
           $(".h_info_tourad").html(data);
       },
       error: function() {
           alert("일치하는 검색어가 없습니다.");
       }
   });
   
	var elements1 = document.querySelectorAll(".tour_price");
	if (elements1) {
	  elements1.forEach(function(element) {
	    var text = element.textContent;
	    var formattedText = addCommasToNumber(text);
	    element.textContent = formattedText;
	  });
	}
	function addCommasToNumber(numberString) {
		  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		

</script>
</html>