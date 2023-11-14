<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import= "java.sql.*" %>

<%
/* html에서 작성한 내용 변수로 받아오기 
	member_pjs.html의 m_id값이 중복인지 확인하기 위한 jsp
*/

request.setCharacterEncoding("UTF-8");
String g_id = request.getParameter("g_id");
 
Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;

System.out.println(g_id);

try {
Class.forName("com.mysql.jdbc.Driver");
/*  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root","dkssud2!!"); */ 
 /* conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root","qhdks12!@"); */
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root","0521");  
String sql = "select count(*) as cnt  from guide where g_id=?";

pstmt = conn.prepareStatement(sql); 
pstmt.setString(1, g_id);
rs = pstmt.executeQuery(); 
if(rs.next()){
// 	int cnt = rs.getInt(0); // 이거도 먹음
	int cnt = rs.getInt("cnt");
	out.print(cnt);
}else{
	out.print(0);
}
	
}catch(Exception e) {

}
%>