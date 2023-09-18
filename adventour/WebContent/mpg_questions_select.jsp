<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "java.sql.*" %>
<%@ page import="adventour.Mpg_Q_dbsave" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><jsp:useBean id="mpg_q_dbsave" class="adventour.Mpg_Q_dbsave"/><%
/* mpg_questions.js의 문의 보기 ajax와 연동 */

request.setCharacterEncoding("UTF-8");

String m_id		= request.getParameter("m_id");

if(m_id		== null){throw new Exception("m_id is null");}

// mpg_q_dbsave.dbInsert(Integer.parseInt(q_num), q_title, q_cntt, m_id, q_date);
List<Map<String, Object>> qnaList = mpg_q_dbsave.dbSelect(m_id);


// out.println("Mpg_Q_dbsave dbSelect");
// out.println(qnaList);
// out.println("Mpg_Q_dbsave dbSelect");
request.setAttribute("qnaList", qnaList);
// out.print(qnaList.get(0).get("q_num"));
// http://localhost:8080/adventour/mpg_questions_select.jsp?q_num=1
// [<c:forEach var="list" items="${qnaList}">{<c:forEach var="qRow" items="${list.entrySet()}">"<c:out value="${qRow.key }"/>":"<c:out value="${qRow.value }"/>",</c:forEach>}</c:forEach>]
%>
[
<c:forEach var="list" items="${qnaList}" varStatus="outerStatus">
    {
    <c:forEach var="qRow" items="${list.entrySet()}" varStatus="innerStatus">
        "<c:out value="${qRow.key}"/>":"<c:out value="${qRow.value}"/>"
        <c:if test="${!innerStatus.last}">,</c:if>
    </c:forEach>
    }
    <c:if test="${!outerStatus.last}">,</c:if>
</c:forEach>
]