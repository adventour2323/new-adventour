<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "adventour.t_getset" %>
<%@ page import = "adventour.g_r_getset" %>
<%@ page import="java.util.*"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>

<html>
<head>
<meta charset="UTF-8">
<title>guide information</title>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
</head>
        <link rel="stylesheet" type="text/css" href="./css/g_info_css.css">  
<style>

</style>
 
<body>

		<header>
			<%
				if (session.getAttribute("id") == null) {
			%>
    		<!-- header.html import -->
    		<!-- <div id="header"></div> -->
    		<jsp:include page="header.html"></jsp:include>
			<%
				} else {
			%>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<%
				}
			%>
		</header>

<!--  -->

      <div class="content">
      
      <div style=" padding-top: 65px; ">
      	<h1 style="text-align: center; margin-bottom: 20px; ">
      		<label>가이드 프로필</label>
      	</h1>
      </div>
      
      
      
       		<jsp:useBean id="id" class="adventour.g_list_print">
       		<%	
			String g_id = request.getParameter("g_id");
       		
       		ArrayList<g_getset> a1 = id.g2(g_id);
       		ArrayList<t_getset> a2 = id.t2(g_id);
       		%>
			

       		
        <div class="table_div" style="text-align: center; margin-right: auto; margin-left: auto; width: 700px;">
            <%
				for(g_getset info : a1) {
			%>
            <table style="width: 700px; margin-bottom: 10px;" >
                <tbody>
                	<tr align="center">
                	<td rowspan="6" style="width: 200px"><img src="<%=info.getImg()%>" style="height: 200px; width: 200px; margin-right: 10px; "></td>
                	<th style="background-color: #f2f2f2; border-right: solid 1px;">이름</th>
                	<td style="background-color: bisque;"><strong><label><%= info.getName()%></label></strong></td>
                	</tr>

                	<tr align="center">
                		<th style="background-color: #f2f2f2; border-right: solid 1px;">성별</th>
                		<td style="background-color: bisque;"><label><%=info.getGender()%></label></td>
                	</tr>
				
                	<tr align="center">
                		<th style="background-color: #f2f2f2; border-right: solid 1px;">출생년도</th>
						<td style="background-color: bisque;"><label><%=info.getYear()%>년</label></td>
                	</tr>
						
          	
                	<tr align="center">
                  		<th style="background-color: #f2f2f2; border-right: solid 1px;">가이드 지역</th>
                  		<td style="background-color: bisque;"><a href="g_list_country.jsp?g_country_eng=<%= info.getG_country_eng()%>"><strong><%= info.getCountry()%>, <%=info.getCity() %></strong></a></td>
                	</tr>
                	<tr align="center">
	                    <th style="background-color: #f2f2f2; border-right: solid 1px;">테마</th>
    	                <td style="background-color: bisque;"><label><%= info.getTheme() %></label></td>
        	          </tr>
                
                	<tr align="center">
                    	<th style="background-color: #f2f2f2; border-right: solid 1px;">연락처</th>
	                    <td style="background-color: bisque;"><%= info.getPnum()%></td>
    	            </tr>
        	        <tr align="center">
        	        	<% 
        	        		ArrayList<g_r_getset> a3 = id.g6(g_id);
        	        		for(g_r_getset avg : a3) {
        	       		%>
        	        	<td> 
        	        		<div title="<%=avg.getG_rating()%>"><label> 평점: 
        	        	<% 
                int rating = avg.getG_rating();
                for (int j = 1; j <= 5; j++) {
                    if (j <= rating) {
            %>
                       <span class="yellow-star">&#9733;</span>
            <%
                    } else {
            %>
                       <span class="gray-star">&#9733;</span>
            <%
                    }
                }
            %>
        	  </label>      	</div>
        	        	<!--  -->
        	        	</td>
        	        	<%} %>
            	        <th style="background-color: #f2f2f2; border-right: solid 1px;">이메일</th>
                	    <td style="background-color: bisque;"><%= info.getEmail()%></td>
                	</tr>
                <!--  -->
                				 
                <!--  -->
              	</tbody>
              </table>
<%
    ArrayList<t_getset> t_ad = id.g4(info.getTheme(), info.getG_id());

    // 무작위로 하나의 항목을 선택하기 위해 Random 객체 생성
    java.util.Random random = new java.util.Random();
    int randomIndex = random.nextInt(t_ad.size()); // 무작위 인덱스 생성

    t_getset ad = t_ad.get(randomIndex); // 선택된 항목 가져오기

    // t_img1, t_img2, t_img3, t_img4 중에서 무작위로 하나 선택
    String[] imgArray = {ad.getT_img1(), ad.getT_img2(), ad.getT_img3(), ad.getT_img4()};
    int randomImgIndex = random.nextInt(imgArray.length); // 무작위 인덱스 생성

    // 선택된 이미지 출력
    String selectedImg = imgArray[randomImgIndex];
%>
<a href="t_info.jsp?t_id=<%=ad.getT_id()%>">
<div class="guide_ad" style="position: fixed; top: 25%; right: 150px; height: 230px; width: 250px; cursor: pointer; border-radius: 10%; background-color: rgb(59 7 7 / 7%);" title="누르면 이동합니다.">
    <div style="position: relative;">
        <img alt="ad_img" src="<%=selectedImg%>" width="250px" height="200px" style=" border-top-right-radius: 10%; border-top-left-radius: 10%; ">
        <div style="position: absolute; bottom: 2%; left: 0; width: 100%; text-align: center; color: white; background: rgba(0, 0, 0, 0.5);">
            <%=ad.getT_name()%>
        </div>
    </div>
    
    <div class="ad_title">이런 테마의 여행! 어떠신가요?!? </div>
</div>
</a>           
              <% } %>
        </div>
        


        <hr>
        
        <div style="  width: 100%; margin-top: 20px;"  >
       	 	
       	 	<div style="width: 700px; margin-left: auto; margin-right: auto;  ">
			<%
				for(g_getset info : a1) {
			%>
       	 		<h2 style="text-align: center;"><label>자기소개</label></h2><br>
       	 		<div style="height: 100px;  margin-bottom: 30px; margin-left: auto; margin-right: auto; ">
        	    	<div >
    	        		<%=info.getG_introduce()%>
	            	</div>
	     		</div>
	     	<% } %>
	     	</div>
	     	
	     	<hr>
	     	
	     	<div  style="margin-top: 20px;">
        		
        		<div style="margin-right: auto; margin-right: auto; text-align: center;">
        			<h2 style="text-align: center; "><label>모집 중인 투어</label> </h2><br>
        		</div>
        		
        		<div class="tour-container" >
	            	<div class="item-box" style=" display: flex; margin-right: auto; margin-left: auto; " >
						<%  for ( int i = 0; i < a2.size(); i++ ) {
							t_getset tn = a2.get(i);
						%>
									
						<div class="tour-item">
							<a href="t_info.jsp?t_id=<%=tn.getT_id() %>">
                				<div class="tour-img">
                        			<img src="<%=tn.getT_img1()%>" alt="img<%=tn.getT_name() %>">
	                			</div>
	                		</a>
    	            		<div class="tour-info">
                
        	        			<div class="tour_title_div" >
            	        			<h3 class="tour-title"  title="<%=tn.getT_name()%>">
                	    	    		<a href="t_info.jsp?t_id=<%=tn.getT_id() %>"><%= tn.getT_name() %></a>
                    				</h3>
                    			</div>
                    <hr>
                    
                    			<div class="tour_location_div">
	                    			<p class="tour-location">
    	                    			<label><%= tn.getCountry() %>, <%= tn.getCity() %></label>
        	            			</p>
            	        		</div>
                	    		<div class="tour_price_div">
                    				<p class="tour-price" id="formattedPrice<%= tn.getT_price() %>">
                        				<label>₩ <%= tn.getT_price() %></label>
                    				</p>
<script>
							function formatNumberWithCommas(number) {
								// 가격에 컴마 추가
							return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							}
							document.addEventListener('DOMContentLoaded', function() {
								var priceElement = document.getElementById('formattedPrice<%= tn.getT_price() %>');
								var priceText = priceElement.textContent;
								var price = parseInt(priceText.replace(/[^\d]/g, '')); // 가격을 숫자로 파싱
								priceElement.textContent = formatNumberWithCommas(price) + ' 원';
							});
						</script>   
						                    				
                    			</div>
                    
	                		</div>
            			</div> <!--tour-item  -->
            			<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
<!--             			<div>
            			
            			</div> -->
						<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
						<% } %>	

        	    	</div>
        	    	
        		</div>
        		<hr>
        	</div> <!-- 개설한 상품 -->
			<%
				for(g_getset info : a1) {
			%>        	
        	<div style="margin-top: 20px;"> <!-- 가이드 리뷰 -->        	
        		
        		<h2 style="text-align: center;"><label>가이드 후기</label></h2>
        	<!--  -->
        		<div class="rating-div" style="margin-bottom: 30px; margin-top: 30px;">
					<form name="rating_comment" id="rating_comment" action="./guide_review_process.jsp" method="post" >
<!--  -->
					<div class="review-form-container">
						<fieldset style="display: flex;">
    						<div class="star-div" >				
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
							
						<!-- <div class="text-bold" style="margin-right: 50px;">
							별점을 남겨주세요!
						</div> -->
							<h3 style="margin: auto 0 auto 10px;">
								<strong>
									<div style="margin-left: 20px;">
										별점을 남겨주세요
									</div>
								</strong>
							</h3>
						</fieldset>
    					<div class="form-group" style="height: 100px;">
        					<textarea class="form-control" id="reviewContents" name="review_content" placeholder="리뷰를 남겨주세요!!" rows="4"></textarea>
        					<div id="charCount" style="float: right;">0 / 255</div>
    					</div>
    					<div class="form-group">
        					<input type="hidden" value="<%=info.getG_id()%>" name="g_id"> 
        					<input type="submit" value="등록하기" class="review-write-btn">
    					</div>
					</div> <!-- review-form-container -->
					</form>	 
			<!--  -->
			
<div class="t_review_div">
    <% 
        ArrayList<g_r_getset> rv = id.g5(g_id); 
        /* SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 원하는 포맷 설정 */

        int count = rv.size();
        int itemsPerPage = 10;
        int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, count);

        // totalPages 계산
        int totalPages = (int) Math.ceil((double) count / itemsPerPage);
    %>

    <% if (count == 0) { %>
                <table class="review-table">
					<tr id="">
						<th style="text-align: center; width: 50px;">번호</th>
						<th style="text-align: center; width: 150px;">작성자</th>
						<th>내용</th>
						<th style="text-align: center; width: 130px;">날짜</th>
						<th style="text-align: center; width: 110px;">평점</th>
					</tr>
                     <tr>
                        <td style="text-align: center;" colspan="5">등록된 후기가 없습니다.</td>
                    </tr>
                </table>
    <% } else { %>
            <table class="review-table">
					<tr id="review_top">
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>날짜</th>
						<th>평점</th>
					</tr>
       
            <% 
                for (int i = startIndex; i < endIndex; i++) {
                    g_r_getset tr = rv.get(i);
                    String reviewDateString = tr.getG_review_date();
                    /* Timestamp reviewTimestamp = Timestamp.valueOf(reviewDateString);
                    /* Date reviewDate = new Date(reviewTimestamp.getTime()); */
                    /* Timestamp reviewTimestamp = new Timestamp(sdf.parse(reviewDateString).getTime()); */
            %>
                <!-- 기존의 테이블 행 등 -->
                <tr>
						<td style="text-align: center; width: 50px;"><%= count - i %></td> <!-- 업데이트된 부분 -->
						<td style="text-align: center; width: 150px;"><%= tr.getM_id() %></td>
						<td style="max-width: 474px; word-wrap: break-word;"><%= tr.getG_review() %></td>
						<td style="text-align: center; width: 130px;"><%= tr.getG_review_date() %></td>
						<td style="text-align: center; width: 110px;"> 
        <div class="star-rating" title="<%=tr.getG_rating()%>" >
            <% 
                int rating = tr.getG_rating();
                for (int j = 1; j <= 5; j++) {
                    if (j <= rating) {
            %>
                       <label> <span class="yellow-star">&#9733;</span></label>
            <%
                    } else {
            %>
                       <label> <span class="gray-star">&#9733;</span></label>
            <%
                    }
                }
            %>
        </div> <!-- star-rating -->
						</td>
					</tr>
            <% } %>
        </table> <!-- review-table -->

        <!-- 이전 페이지와 다음 페이지로 이동하는 버튼 -->
        <div class="pagination-container">
            <% 
                // 이전 페이지 버튼
                if (currentPage > 1) { 
            %>
                <a href="g_info.jsp?g_id=<%= g_id %>&page=<%= currentPage - 1 %>" onclick="scrollToReviewTable()">이전 페이지</a>
            <% } 

                // 페이지 번호 버튼
                for (int i = 1; i <= totalPages; i++) { 
            %>
                <a href="g_info.jsp?g_id=<%= g_id %>&page=<%= i %>" <%if (i == currentPage) {%>class="current-page"<%} %>>
                    <%= i %>
                </a>
            <% } 

                // 다음 페이지 버튼
                if (currentPage < totalPages) { 
            %>
                <a href="g_info.jsp?g_id=<%= g_id %>&page=<%= currentPage + 1 %>" onclick="scrollToReviewTable()">다음 페이지</a>
            <% } %>
        </div>
    <% } %>
</div><!-- t_review_div -->
        	<!--  -->
        		</div> <!-- rating-div -->
        	</div> <!-- 가이드리뷰 -->
        	<%} %>
        	
        </div> <!-- 하단부 전체 -->
        
        
        </jsp:useBean>
      </div><!--content-->
	
<!--  -->

<footer >
		<jsp:include page="footer.html"></jsp:include>
</footer> 


</body>

<script>
  // 텍스트 박스와 글자 수 표시 요소를 가져옵니다.
  const reviewContents = document.getElementById("reviewContents");
  const charCount = document.getElementById("charCount");

  // 텍스트 박스에 입력 내용이 변경될 때마다 글자 수를 업데이트합니다.
  reviewContents.addEventListener("input", function () {
    const text = reviewContents.value;
    const textLength = text.length;
    const maxLength = 255; // 최대 글자 수

    // 글자 수 표시를 업데이트합니다.
    charCount.textContent = textLength + " / " + maxLength;

    // 최대 글자 수를 초과하면 입력을 제한합니다.
    
      // 입력을 최대 글자 수로 자릅니다.
      if (textLength > maxLength) {
      reviewContents.value = text.slice(0, maxLength);
      charCount.textContent = maxLength + " / " + maxLength;
    }
  });
</script>


</html>