
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java_prac0913.java_db1" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <% //실제로 보이지는 않고 입력 받은 정보를 데이터처리를 하는 자바파일로 매개변수를 통해넘겨준다
    request.setCharacterEncoding("UTF-8"); 
    String m_id = request.getParameter("c_writer");  //로그인 후 데이터베이스에서 외래키로 받아올것
    String c_date = request.getParameter("c_date");    //날짜
    String country = request.getParameter("c_country");    //나라
    String city = request.getParameter("c_city");    //도시
    String c_title = request.getParameter("c_title");    //제목
    String c_cont = request.getParameter("c_con");    //내용
    String c_pho1 = request.getParameter("c_pho1");    //이미지1
    String c_pho2 = request.getParameter("c_pho2");//이미지2
    String c_pho3 = request.getParameter("c_pho3");        //이미지3
    String c_pho4 = request.getParameter("c_pho4");        //이미지4
    String c_pho5 = request.getParameter("c_pho5"); //이미지5
 
    
    C_database c_db = new  C_database(); //데이터 처리를 하는 java_db1인 자바 파일을 객체로 만들어 
    c_db.dbsave(m_id, c_date, country, city, c_title, c_cont, c_pho1,c_pho2, c_pho3, c_pho4,c_pho5); 
         //매개변수를 담아서  데이터 처리 자바파일 호출 
   alter("게시물이 저장 되었습니다.");  // 다음페이지는 아이디만출력을 보여주는 웹 파일로 연결
    %>




</body>
</html>