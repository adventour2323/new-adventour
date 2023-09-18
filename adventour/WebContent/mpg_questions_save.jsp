<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@ page import= "java.sql.*" %><%@ page import="adventour.Mpg_Q_dbsave" %><jsp:useBean id="mpg_q_dbsave" class="adventour.Mpg_Q_dbsave"/><%
/* mpg_questions.js의 문의 등록 ajax와 연동 */

request.setCharacterEncoding("UTF-8");

String q_title	= request.getParameter("q_title");
String q_cntt	= request.getParameter("q_cntt");
String m_id		= request.getParameter("m_id");

if(q_title	== null){throw new Exception("q_title is null");}
if(q_cntt	== null){throw new Exception("q_cntt is null");}
if(m_id		== null){throw new Exception("m_id is null");}

int nn = mpg_q_dbsave.dbInsert(q_title, q_cntt, m_id);
out.print(nn);
%>