<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/tour_g_list_country.css">  
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
        
        <title>가이드 목록</title>
</head>

<style>
table, th, td {
border: none;
}


</style>

<body>

    <header>
        <%
        	if (session.getAttribute("id") == null) {
        %>
        <!-- header.html import -->
        <jsp:include page="header.html"></jsp:include>
        <%
        	} else {
        %>
        <jsp:include page="header_login.jsp"></jsp:include>
        <%
        	}
        %>
    </header>
	
	<jsp:useBean id="id" class="adventour.g_list_print">
		<%	
		String country_eng = request.getParameter("g_country_eng");
        
			ArrayList<g_getset> a1 = id.g3(country_eng);
		%> 
        
<div class="list_title_div" style="text-align: center;">
    <div style="display: inline-block;">
		<%
        if ("uk".equals(country_eng)) {
        %>
            <img alt="영국" src="./image/tour/ukflag.png" height="30px">
        <%
        } else if ("france".equals(country_eng)) {
        %>
            <img alt="프랑스" src="./image/tour/frflag.png" height="30px">
        <%
        } else if ("spain".equals(country_eng)) {
        %>
            <img alt="스페인" src="./image/tour/esflag.png" height="30px">
        <%
        } else if ("italy".equals(country_eng)) {
        %>
            <img alt="이탈리아" src="./image/tour/itaflag.png" height="30px">
        <%
        }
        %>
    </div>
    <h1 class="list_title" style="display: inline-block; ">
		<%
			String countryName = ""; // 변수 초기화

			if ("uk".equals(country_eng)) {
				countryName = "영국";
				out.println("영국");
			} else if ("france".equals(country_eng)) {
				countryName = "프랑스";
				out.println("프랑스");
			} else if ("spain".equals(country_eng)) {
    			countryName = "스페인";
    			out.println("스페인");
    		} else if ("italy".equals(country_eng)) {
    			countryName = "이탈리아";
    			out.println("이탈리아");
    		}
    	%>
    </h1>
</div>
	
	<div class="country_list" >
		
		<div id="country_all" class="country_content" style="margin-left: auto;">
		<a href="g_list.jsp"> <img alt="europeicon" src="./image/tour/euricon.png" height="30px;"><h2 class="c_name">전체</h2> </a>  
		</div>
		<div id="country_uk" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=uk"> <img alt="ukflag" src="./image/tour/ukflag.png" height="30px;"> <h2 class="c_name">영국</h2> </a>
		</div>
		<div id="conutry_fr" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=france"> <img alt="ukflag" src="./image/tour/frflag.png" height="30px;"> <h2 class="c_name">프랑스</h2> </a> 
		</div>
		<div id="country_es" class="country_content">
			<a href="g_list_country.jsp?g_country_eng=spain"> <img alt="ukflag" src="./image/tour/esflag.png" height="30px;">  <h2 class="c_name">스페인</h2> </a>
		</div>
		<div id="country_ita" class="country_content" style="margin-right: auto;">
			<a href="g_list_country.jsp?g_country_eng=italy"> <img alt="ukflag" src="./image/tour/itaflag.png" height="30px;">  <h2 class="c_name">이탈리아</h2> </a>
		</div>
	
	</div> <!-- 표 묶음  -->        
        
      <div class="content"  > <!-- body 전체  -->


        <div style="text-align: center; margin-right: auto; margin-left: auto;">

   			<div>

				<%
					for (int i = 0; i < a1.size(); i++) {
    				g_getset g = a1.get(i);
				%>
				<div class="container" style="margin: 0 10px 30px; width: calc(50% - 20px); float: left;">
	
				    <table width="95%" cellpadding="0" cellspacing="0" border="0" style="background: #fff; white-space: normal; ">
        				<tbody>
            				<tr>
								<td width="115" class="image-container">
    								<a href="g_info.jsp?g_id=<%=g.getG_id()%>">
        								<img src="<%=g.getImg()%>" width="201px" height="201px" class="guide-image">
        								<div class="overlay">
            								<div class="overlay-content">
	                							자세히 보기
            								</div>		
    			    					</div>
    								</a>
								</td>

                				<td>
                    				<div style="margin: 0px 10px; width: 100%;">
                        				<table width="95%" cellpadding="0" cellspacing="0" border="0" class="guide_css" style="border-top: 1px solid #0066b3; border-bottom: 1px solid #0066b3; padding-left: 10px; padding-right: 10px;">
                                                <tbody>
                                                    <tr>
                                                        <th width="100" style="background-color: #f2f2f2;"><label>이름</label></th>
                                                        <td style="background-color: bisque;">
                                                            <div><a href="g_info.jsp?g_id=<%=g.getG_id()%>"><label><strong style="cursor: pointer;"><%=g.getName()%></strong></label></a></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;"><label>국가</label></th>
                                                        <td style="background-color: bisque;"><label><%=g.getCountry()%></label></td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;"><label>도시</label></th>
                                                        <td style="background-color: bisque;"><label><%=g.getCity()%></label></td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #f2f2f2;"><label>테마</label></th>
                                                        <td style="background-color: bisque;"><label><%=g.getTheme()%></label></td>
                                                    </tr>
                                                </tbody>
                        				</table>
                    				</div>
                				</td>
            			</tr>
        			</tbody>
    			</table>
			</div>
				<% if ((i + 1) % 2 == 0) { %>
					<div style="clear: both;"></div>
				<% } } %>

  		</div>

	  </div>
  <!--  -->
 
	</div> <!-- content -->

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var country = '<%= countryName %>'; // JSP 변수를 JavaScript로 가져옵니다.

    	// 모든 country_content 요소를 선택
	    var countryElements = document.querySelectorAll('.country_content');

	    // 요소를 순환하면서 텍스트 내용을 확인하고 일치하는 경우 스타일을 변경합니다.
    	for (var i = 0; i < countryElements.length; i++) {
        	var h2 = countryElements[i].querySelector('h2'); // h2 요소를 찾습니다.
	        if (h2.innerText.trim() === country) { // 텍스트 내용 일치 여부 확인
    	        countryElements[i].style.backgroundColor = 'rgba(0, 0, 0, 0.1)'; // 예시로 배경색을 변경
    	        countryElements[i].style.padding = '5px 40px'; // 예시로 배경색을 변경
        	}
    	}
	});

</script>
		
</jsp:useBean>
		</body>
		
		<footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer>
		
	</html>	