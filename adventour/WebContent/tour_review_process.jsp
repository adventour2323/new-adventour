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
  /* history.back(); */
  window.location.href = document.referrer;
</script>
<%
}
%>

<%
String reviewStar = request.getParameter("reviewStar"); /* 별점 */
String review_content = request.getParameter("review_content"); /* 리뷰내용 */
String t_id = request.getParameter("t_id"); /* tour id */
String m_id =  (String) session.getAttribute("id"); /* 회원 id */

/* int comment_num = 1; */


if (reviewStar == null || review_content == null || t_id == null || m_id == null) {

} else {
    Connection conn = null;
    Statement stmt = null;

    try {

   Class.forName("com.mysql.jdbc.Driver"); /*데이테베이스에 연결*/
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf8","root","qhdks12!@");
   /* conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf8","root","0521"); */
   if(conn== null)
      throw new Exception("데이터베이스에 연결할 수 없습니다.");
   stmt = conn.createStatement();
   String command = String.format("insert into tour_rating(t_review, t_rating, t_id, m_id) values('"+review_content+"', '"+reviewStar+"','"+t_id+"', '"+m_id+"');" );
				  
   
   int rowNum = stmt.executeUpdate(command);

   if (rowNum < 1) {
       out.println("데이터를 DB에 입력할 수 없습니다.");
   }
} catch (Exception e) {
   e.printStackTrace(); // 예외 정보를 출력
} finally {
   try {
       if (stmt != null) {
           stmt.close();
       }
   } catch (Exception ignored) {
   }
   try {
       if (conn != null) {
           conn.close();
       }
   } catch (Exception ignored) {
   }
}

String referrer = request.getHeader("referer");
response.sendRedirect(referrer);
}
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