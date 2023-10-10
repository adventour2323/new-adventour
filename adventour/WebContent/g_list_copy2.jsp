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
        <link rel="stylesheet" type="text/css" href="./css/tour_g_list.css">  
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
        
        <title>가이드 목록</title>
</head>

<style>
table, th, td {
border: none;
}

/* 이미지 컨테이너에 대한 스타일 */
.image-container {
    position: relative;
}

/* 오버레이를 감추기 위한 초기 스타일 */
.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0); /* 초기에 투명 배경 */
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s; /* 부드러운 투명도 전환 효과 */
}

/* 오버레이 내용 스타일 */
.overlay-content {
    color: #fff;
    text-align: center;
    font-size: 18px;
}

/* 이미지 위에 마우스를 올렸을 때 오버레이를 나타내는 스타일 */
.image-container:hover .overlay {
    background-color: rgba(0, 0, 0, 0.7); /* 마우스 오버시 배경 투명도 변경 */
    opacity: 1; /* 오버레이 표시 */
}


</style>

<body>

  	<header>
    	 <jsp:include page="header.html"></jsp:include>
	</header>
	
	<jsp:useBean id="id" class="adventour.g_list_print">
		<%	
			ArrayList<g_getset> a1 = id.g1();
		%>
        
      <div class="content"  > <!-- body 전체  -->

		<div class="g_title">
			<h1 style='text-align: center; margin-bottom: 30px;'>가이드 리스트</h1>
		</div>      
<div style="display: flex; "> <!-- 표 묶음  -->

      <div id="category" class="all_country">
      	<a href="g_list.jsp"> 전체 </a>
      </div>
      <div id="category" class="category_uk">
      	영국
      </div>
      <div id="category" class="category_fr" >
      	프랑스
      </div>
      <div id="category" class="category_es" >
      	스페인
      </div>
      <div id="category" class="category_ita" >
      	이탈리아
      </div>
      
</div> <!-- 표 묶음  -->
      
      
        <div style="text-align: center; margin-right: auto; margin-left: auto;">
		

   <div >

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
                        <table width="95%" cellpadding="0" cellspacing="0" border="0" class="guide_css" style="border-top: 1px solid #0066b3; padding-left: 10px; padding-right: 10px;">
                            <tbody>
                                <tr>
                                    <th width="100" style="background-color: #f2f2f2;">이름</th>
                                    <td><a href="g_info.jsp?g_id=<%=g.getG_id()%>"><%=g.getName()%></a></td>
                                </tr>

                                <tr>
                                    <th style="background-color: #f2f2f2;">국가</th>
                                    <td><%=g.getCountry()%></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #f2f2f2;">도시</th>
                                    <td><%=g.getCity()%></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #f2f2f2;">테마</th>
                                    <td><%=g.getTheme()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<% if ((i + 1) % 2 == 0) { 
%>
<div style="clear: both;"></div>
<% } } %>

  </div>

  </div>
  <!--  -->
 
			</div>

		
</jsp:useBean>
		

		</body>
		
		<footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer>
	</html>