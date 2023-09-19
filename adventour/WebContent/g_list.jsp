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
        <!-- <link rel="stylesheet" type="text/css" href="./css/tour_g_list.css"> -->  
        <script src="./js/jquery-3.6.0.min.js"></script>
        <title>가이드 목록</title>
</head>
<body>

  	<header>
    	 <jsp:include page="header.html"></jsp:include>
	</header>
	
        
      <div class="content" style="padding: 100px;  border: solid; " >
        <div style="text-align: center; border: solid; margin-right: auto; margin-left: auto;">
        
 		<jsp:useBean id="id" class="adventour.g_list_print">
		<%	
			ArrayList<g_getset> a1 = id.g1();
			
			
			for ( int i = 0; i < a1.size(); i++ ) {
				
				
				
			}
			
		out.println("<h1 style='text-align: center;'>가이드 리스트</h1>");
			
			/* for(g_getset table  : a1){  */
				for ( int i = 0; i < a1.size(); i++ ) {
				
				out.println("<div style='width: 400px; display: flex;'>");
				
out.println("<div style='width: 400px;'>"); /* 테이블*/
				
				out.println("<table border: '1'>");
				out.println("<thead> <tr> <th colspan = '4' style = 'cursor: pointer'> ");
				out.println("<img src='"+a1.getImg()+"' alt='img1' style='height: 200px; width: 200px;' >");
				out.println("<thead> <tr> <th>이름</th> <th>국가</th> <th>도시</th> <th>테마</th> </tr> </thead>");
				out.println("<tbody> <tr> <td>"+table.getName()+"</td> <td>"+table.getCountry()+"</td> <td>"+table.getCity()+"</td> <td>"+table.getTheme()+"</td> </tr> </tbody>");
				out.println("</table>");
				
				out.println("</div>");
				
out.println("<div style='width: 400px;'>"); /* 테이블*/
				
				out.println("<table border: '1'>");
				out.println("<thead> <tr> <th colspan = '4' style = 'cursor: pointer'> ");
				out.println("<img src='"+table.getImg()+"' alt='img1' style='height: 200px; width: 200px;' >");
				out.println("<thead> <tr> <th>이름</th> <th>국가</th> <th>도시</th> <th>테마</th> </tr> </thead>");
				out.println("<tbody> <tr> <td>"+table.getName()+"</td> <td>"+table.getCountry()+"</td> <td>"+table.getCity()+"</td> <td>"+table.getTheme()+"</td> </tr> </tbody>");
				out.println("</table>");
				
				out.println("</div>");
				
out.println("<div style='width: 400px;'>"); /* 테이블*/
				
				out.println("<table border: '1'>");
				out.println("<thead> <tr> <th colspan = '4' style = 'cursor: pointer'> ");
				out.println("<img src='"+table.getImg()+"' alt='img1' style='height: 200px; width: 200px;' >");
				out.println("<thead> <tr> <th>이름</th> <th>국가</th> <th>도시</th> <th>테마</th> </tr> </thead>");
				out.println("<tbody> <tr> <td>"+table.getName()+"</td> <td>"+table.getCountry()+"</td> <td>"+table.getCity()+"</td> <td>"+table.getTheme()+"</td> </tr> </tbody>");
				out.println("</table>");
				
				out.println("</div>");
				
out.println("<div style='width: 400px;'>"); /* 테이블*/
				
				out.println("<table border: '1'>");
				out.println("<thead> <tr> <th colspan = '4' style = 'cursor: pointer'> ");
				out.println("<img src='"+table.getImg()+"' alt='img1' style='height: 200px; width: 200px;' >");
				out.println("<thead> <tr> <th>이름</th> <th>국가</th> <th>도시</th> <th>테마</th> </tr> </thead>");
				out.println("<tbody> <tr> <td>"+table.getName()+"</td> <td>"+table.getCountry()+"</td> <td>"+table.getCity()+"</td> <td>"+table.getTheme()+"</td> </tr> </tbody>");
				out.println("</table>");
				
				out.println("</div>");
				
				out.println("</div>"); 
			}
			/*  */
			
			/*  */
			/* 	out.println(table.getName());
				out.println("<br>");
				out.println(table.getCity()); */
/* 				out.println("<div>");
				
			 out.println("<div>");
			out.println("<table  style='height=200px; border-color= orange; cellspacing= 5; width=400px; '>");
			out.println("<td rowspan='10' style= 'width:200px;'><img src='"+table.getImg()+"' alt='가이드 사진' style='height: 200px; width: 200px; border: solid;'> </td>");
			out.println("<tr align='center'>");
			out.println("<th style= 'width:100px;'>이름</th>");
			out.println("<td http://localhost:8080/adventour/g_list.jsp>"+ table.getName() + "</td>");
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
			} */
			/*  */
			
			/* out.println("<div style:'display: flex;'>");
 			for(g_getset table1  : a1){
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
			} 
			
			out.println("</div>"); */
		%>
			</jsp:useBean>

			</div>
		</div>

		<footer>
			<jsp:include page="footer.html"></jsp:include>
		</footer>

		</body>
	</html>