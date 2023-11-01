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
            <table style="width: 700px; " >
                <tbody>
                <tr align="center">
                  <td rowspan="11" style="width: 200px"><img src="<%=info.getImg()%>" style="height: 200px; width: 200px; "></td>
                  <td style="background-color: #f2f2f2;">이름</td>
                  <td><%= info.getName()%></td>
                </tr>

                <tr align="center">
					<th style="background-color: #f2f2f2;">성별</th>
					<td><%=info.getGender()%></td>
				</tr>
				
				<tr align="center">
					<th style="background-color: #f2f2f2;">출생년도</th>
					<td><%=info.getYear()%>년</td>
				</tr>
						
          	
                <tr align="center">
                  <td style="background-color: #f2f2f2;">가이드 지역</td>
                  <td><%= info.getCountry()%>, <%=info.getCity() %></td>
                </tr>
                <tr align="center">
                    <td style="background-color: #f2f2f2;">테마</td>
                    <td><%= info.getTheme() %></td>
                  </tr>
                
                <tr align="center">
                    <td style="background-color: #f2f2f2;">연락처</td>
                    <td><%= info.getPnum()%></td>
                </tr>
                <tr align="center">
                    <td style="background-color: #f2f2f2;">이메일</td>
                    <td><%= info.getEmail()%></td>
                </tr>
                <!--  -->
                

				 
                <!--  -->
              </tbody></table>
              <% } %>
        </div>
        
        <hr>
        
        <div style="height: 400px;  width: 100%; margin-top: 20px;"  >
       	 	
       	 	<div style="width: 700px; margin-left: auto; margin-right: auto;  ">
			<%
				for(g_getset info : a1) {
			%>
       	 		<h4 style="text-align: center;">자기소개</h4><br>
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
        			<h4 style="text-align: center; ">모집 중인 투어 </h4><br>
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
            	        			<h3 class="tour-title">
                	    	    		<a href="t_info.jsp?t_id=<%=tn.getT_id() %>"><%= tn.getT_name() %></a>
                    				</h3>
                    			</div>
                    <hr>
                    
                    			<div class="tour_location_div">
	                    			<p class="tour-location">
    	                    			<%= tn.getCountry() %>, <%= tn.getCity() %>
        	            			</p>
            	        		</div>
                	    		<div class="tour_price_div">
                    				<p class="tour-price">
                        				₩ <%= tn.getT_price() %>~
                    				</p>
                    			</div>
                    
	                		</div>
            			</div> <!--tour-item  -->
            			<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
            			<div>
            			
            			</div>
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