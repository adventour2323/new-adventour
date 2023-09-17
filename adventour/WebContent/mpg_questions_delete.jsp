<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@ page import= "java.sql.*" %>
<%@ page import="adventour.Mpg_Q_dbsave" %>
<jsp:useBean id="mpg_q_dbsave" class="adventour.Mpg_Q_dbsave"/>
<%
/* mpg_questions.js의 문의 등록 ajax와 연동 */

request.setCharacterEncoding("UTF-8");

String q_num	= request.getParameter("q_num");

if(q_num	== null){throw new Exception("q_num is null");}

mpg_q_dbsave.dbDelete(Integer.parseInt(q_num));

%>