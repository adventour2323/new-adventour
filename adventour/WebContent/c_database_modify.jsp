<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.C_dbsave" %>
<%@ page import="adventour.C_getset" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String c_num = request.getParameter("c_num");
String c_title = request.getParameter("c_title");
String c_country = request.getParameter("c_country");
String c_city = request.getParameter("c_city");
String c_cont = request.getParameter("c_con");
String c_pho1 = request.getParameter("fileName1"); // 이미지 파일 업로드를 위한 input name
String c_pho2 = request.getParameter("c_pho2");
String c_pho3 = request.getParameter("c_pho3");
String c_pho4 = request.getParameter("c_pho4");
String c_pho5 = request.getParameter("c_pho5");

C_dbsave db = new C_dbsave();
C_getset obj = new C_getset();

obj.setC_num(c_num);
obj.setC_title(c_title);
obj.setCountry(c_country);
obj.setCity(c_city);
obj.setC_cont(c_cont);
obj.setC_pho1(c_pho1);
obj.setC_pho2(c_pho2);
obj.setC_pho3(c_pho3);
obj.setC_pho4(c_pho4);
obj.setC_pho5(c_pho5);

boolean updateSuccess = db.dbupdate(
    c_num, // 게시글 번호
    c_country, // 나라
    c_city, // 도시
    c_title, // 게시글 제목
    c_cont, // 게시글 내용
    c_pho1, // 이미지1
    c_pho2, // 이미지2
    c_pho3, // 이미지3
    c_pho4, // 이미지4
    c_pho5  // 이미지5
);

if (updateSuccess) {
    // 게시글 수정이 성공한 경우에 대한 처리
 
    response.sendRedirect("community_list2.jsp");
} else {
    // 게시글 수정이 실패한 경우에 대한 처리
    response.sendRedirect("error_page.jsp");
}
%>