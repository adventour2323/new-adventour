<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "adventour.t_getset" %>
<%@ page import = "java.util.*" %>

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
      
      <div style="height: 85px; padding-top: 65px; ">
      	<h1 style="text-align: center; margin-bottom: 20px; ">
      		가이드 프로필
      	</h1>
      </div>
      
      
      
       		<jsp:useBean id="id" class="adventour.g_list_print">
       		<%	
			String g_id = request.getParameter("g_id");
       		
       		ArrayList<g_getset> a1 = id.g2(g_id);
       		ArrayList<t_getset> a2 = id.t2(g_id);
       		%>
			

       		
        <div style="text-align: center; margin-right: auto; margin-left: auto; width: 700px;">
            <%
				for(g_getset info : a1) {
			%>
            <table style="width: 700px; margin-bottom: 10px;" >
                <tbody>
                <tr align="center">
                  <td rowspan="11" style="width: 200px"><img src="<%=info.getImg()%>" style="height: 200px; width: 200px; margin-right: 10px; "></td>
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
                    <th style="background-color: #f2f2f2; border-right: solid 1px;">이메일</th>
                    <td style="background-color: bisque;"><%= info.getEmail()%></td>
                </tr>
                <!--  -->
                

				 
                <!--  -->
              </tbody></table>
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
<div class="guide_ad" style="position: fixed; top: 200px; right: 180px; height: 250px; width: 250px; cursor: pointer; border-radius: 10%; background-color: rgb(59 7 7 / 7%);" title="누르면 이동합니다.">
    <div style="position: relative;">
        <img alt="ad_img" src="<%=selectedImg%>" width="250px" height="200px" style=" border-top-right-radius: 10%; border-top-left-radius: 10%; ">
        <div style="position: absolute; bottom: 2%; left: 0; width: 100%; text-align: center; color: white; background: rgba(0, 0, 0, 0.5);">
            <%=ad.getT_name()%>
        </div>
    </div>
    </a>
    <div style="margin-top: 10px">이런 테마의 여행! 어떠신가요?!? </div>
</div>           
              <% } %>
        </div>
        


        <hr>
        
        <div style="height: 400px;  width: 100%; margin-top: 20px;"  >
       	 	
       	 	<div style="width: 700px; margin-left: auto; margin-right: auto;  ">
			<%
				for(g_getset info : a1) {
			%>
       	 		<h2 style="text-align: center;">자기소개</h2><br>
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
        			<h2 style="text-align: center; ">모집 중인 투어 </h2><br>
        		</div>
        		
        		<div class="tour-container" style="height: 200px; ">
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
                    				<p class="tour-price">
                        				<label>₩ <%= tn.getT_price() %></label>
                    				</p>
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
        		
        	</div> <!-- 개설한 상품 -->
        	
        </div> <!-- 하단부 전체 -->
        
        
        </jsp:useBean>
      </div><!--content-->
	
<!--  -->

<footer >
		<jsp:include page="footer.html"></jsp:include>
</footer>


</body>
</html>