<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "java.sql.*" %>
<%@ page import="adventour.Mpg_Q_dbsave" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<jsp:useBean id="mpg_q_dbsave" class="adventour.Mpg_Q_dbsave"/>
<%
/* mpg_questions.js의 문의 보기 ajax와 연동 */

request.setCharacterEncoding("UTF-8");

String m_id		= request.getParameter("m_id");

if(m_id		== null){throw new Exception("m_id is null");}

// mpg_q_dbsave.dbInsert(Integer.parseInt(q_num), q_title, q_cntt, m_id, q_date);
List<Map<String, Object>> qnaList = mpg_q_dbsave.dbSelect(m_id);


http://localhost:8080/adventour/mpg_questions_select.jsp?q_num=1
%>
<c:forEach var="qRow" items="${qnaList}">
<c:out value="${qRow.q_num}"/>
<c:out value="${qRow.q_title}"/>
<c:out value="${qRow.q_cntt}"/>
<c:out value="${qRow.m_id}"/>
<c:out value="${qRow.q_date}"/>
</c:forEach>