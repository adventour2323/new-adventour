<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@ page import= "java.sql.*" %>
<%@ page import="adventour.Mpg_Q_dbsave" %>
<jsp:useBean id="mpg_q_dbsave" class="adventour.Mpg_Q_dbsave"/>
<%
/* mpg_questions.js의 문의 등록 ajax와 연동 */

request.setCharacterEncoding("UTF-8");

String q_num	= request.getParameter("q_num");
String q_title	= request.getParameter("q_title");
String q_cntt	= request.getParameter("q_cntt");
String m_id		= request.getParameter("m_id");
String q_date	= request.getParameter("q_date");

if(q_num	== null){throw new Exception("q_num is null");}
if(q_title	== null){throw new Exception("q_title is null");}
if(q_cntt	== null){throw new Exception("q_cntt is null");}
if(m_id		== null){throw new Exception("m_id is null");}
if(q_date	== null){throw new Exception("q_date is null");}

mpg_q_dbsave.dbInsert(Integer.parseInt(q_num), q_title, q_cntt, m_id, q_date);

// mpg_q_dbsave.dbsave(5, "제목1", "문의할게 많아용", "myId", q_date);

%>