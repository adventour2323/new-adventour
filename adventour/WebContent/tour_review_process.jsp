<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   <%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> review write process </title>
</head>
<body>

<%
if(session.getAttribute("id") == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  history.back();
</script>
<%
}
%>

<%
String reviewStar = request.getParameter("reviewStar"); /* 별점 */
String review_content = request.getParameter("review_content"); /* 리뷰내용 */
String t_id = request.getParameter("t_id"); /* tour id */
String m_id =  (String) session.getAttribute("id"); /* 회원 id */

int comment_num = 1;



if( /*입력 값이 있는지 없는지 확인*/
		reviewStar == null || review_content == null  || t_id == null ||m_id == null )
   throw new Exception("누락된 데이터가 있습니다.");
Connection conn = null; 
Statement stmt = null;
try{
   Class.forName("com.mysql.jdbc.Driver"); /*데이테베이스에 연결*/
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf8","root","qhdks12!@");
   /* conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf8","root","0521"); */
   if(conn== null)
      throw new Exception("데이터베이스에 연결할 수 없습니다.");
   stmt = conn.createStatement();
   String command = String.format("insert into tour_rating values('"
                                  +comment_num+"', '"+review_content+"', '"+reviewStar+"','"+t_id+"', '"+m_id+"');" );
				  
   
    int rowNum = stmt.executeUpdate(command);
   
   if(rowNum < 1)
      throw new Exception("데이터를 DB에 입력할 수 없습니다.");
   
} finally {
   try {
      stmt.close();
   } catch (Exception ignored) {
      
   } try {
      conn.close();
   } catch (Exception ignored){
      
   } }

 
String referrer = request.getHeader("referer");/* 이전 페이지의 주소 가져와서 저장  */
response.sendRedirect(referrer);
/*response.sendRedirect("이동할 페이지");
없어도 그만*/ 


/* 저장내용 확인용 출력문 */
/* response.setCharacterEncoding("UTF-8");
out.println("<h2>리뷰 </h2>");
out.println("<p>comment_num: " + comment_num + "</p>");
out.println("<p>review_content: " + review_content + "</p>");
out.println("<p>reviewStar: " + reviewStar + "</p>");
out.println("<p>t_id: " + t_id + "</p>");
out.println("<p>m_id: " + m_id + "</p>"); */



%>


</body>
</html>