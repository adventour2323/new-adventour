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
        <title>가이드 목록</title>
</head>
<body>


<div class="header">

          <div class="header1">

              
            <div class="logo">
             <img class="logo1" src="./image/share/main_logo_T_G.png" alt="Logo">
          </div><!--logo-->

              <div class="home">
                <ul class="homeli">
                <li class="home1"><img class="himg" src="./image/share/main_logo_T_G.png" alt="(홈 아이콘)"></li>
                <li class="home1">홈</li>
                <li class="home1">로그인</li>
                <li class="home1">회원가입</li>
                <li class="home1">장바구니</li>
                <li class="home1">=</li>
                </ul>
            </div><!--home-->

          </div><!--header1-->
          
          <div class="head11">

            <div class="menu">
                <ul class="menuli">
                <li class="menu1">투어</li>
                <li class="menu1">버스</li>
                <li class="menu1">호텔</li>
                <li class="menu1">쇼핑</li>
                </ul>
            </div><!--menu-->

          </div><!--header11-->

        </div><!--header-->
        
      <div class="content" style="padding: 100px">
        <div style="text-align: center; margin-right: auto; margin-left: auto;">
       

 <jsp:useBean id="id" class="adventour.g_list_print">
		<%	
			ArrayList<g_getset> a1 = id.g1();
			
			
			out.println("<div>");
			for(g_getset table  : a1){
				
			out.println("<div>");
			out.println("<table border='1' height='200px' bordercolor='orange' cellspacing='5';>");
			out.println("<td rowspan='10' style= 'width:200px;'><img src='"+table.getImg()+"' alt='가이드 사진' style='height: 200px; width: 200px; border: solid;'> </td>");
			out.println("<tr align='center'>");
			out.println("<th style= 'width:100px;'>이름</th>");
			out.println("<td>"+ table.getName() + "</td>");
			out.println("</tr>");
			out.println("<tr align='center'>");
			out.println("<th>국가</th>");
			out.println("<td>"+ table.getCountry()+"</td>");
			out.println("</tr>");
			out.println("<th>도시</th>");
			out.println("<td>"+ table.getCity()+"</td>");
			out.println("</tr>");
			out.println("<th>테마</th>");
			out.println("<td>"+ table.getTheme()+"</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</div>");
			/*  */
			}
/* 			for(g_getset table1  : a1){
			out.println("<div>");
			out.println("<table style='width: 100px; border-style: solid;'>");
			out.println("<thead>");
			out.println("<tr>");
			out.println("<th colspan = '4' style='cursor: pointer;'>");
			out.println("<a href='https://www.naver.com'>");
			out.println("<figure>");
			out.println("<img src='"+table1.getImg()+"' height='200px' width='200px' >");
			out.println("<figcaption>자세히보기</figcaption> </figure> </a> </th> </tr> </thead> ");
			out.println("</div>");
			} */
			
			out.println("</div>");
			
			
		%>
			</jsp:useBean>

		  <!-- <thead>
			  <tr>
				  <th colspan="4"  style="cursor: pointer;" >
					  
					   <a href="https://www.naver.com">
					  <figure>
					  <img src="image/tour/g4.jpg" height="200px" width="200px">
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <thead>
            <tr >
                <th>이름</th>
                <th>국가</th>
                <th>도시</th>
                <th>테마</th>
            </tr>
        </thead>
        <tbody >
            <tr>
				
                <td>또치</td>
                <td>영국</td>
                <td>런던</td>
                <td>관광</td>
            </tr>
        </tbody>
    </table> -->


</div>



</body>
</html>