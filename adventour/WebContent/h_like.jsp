<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.C_dbsave" %>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <%
 // request attribute에서 폼 데이터 및 파일명을 가져옵니다.
    String m_id = (String) request.getParameter("m_id");
    String h_name_eng = (String) request.getParameter("h_name_eng");

    
    System.out.println("아이디"+ m_id);
    System.out.println("이름" + h_name_eng);
    
    
    C_dbsave h_dbsave = new C_dbsave();
    List<H_getset> h_like_selectList = h_dbsave.h_like_select(m_id, h_name_eng);

    if (h_like_selectList != null && !h_like_selectList.isEmpty()) {
        for (H_getset item : h_like_selectList) {
            // item은 h_like_selectList의 각 요소인 H_getset 객체입니다.
            String currentMId = item.getM_id();
            String currentHNameEng = item.getH_name_eng();
            
            if (!currentMId.equals(m_id) && !currentHNameEng.equals(h_name_eng)) {
                h_dbsave.h_likesave(m_id, h_name_eng);
            %>
            
        <script>
            alert("찜에 성공 하였습니다.");
            window.history.back(); // 성공 페이지 URL
        </script>
 <%
            } else {
            	%>
                <script>
                alert("이미 찜한 호텔입니다.");
                window.history.back(); // 성공 페이지 URL
            </script>
 <%
            }
            }
     }
 %>
 


</body>
</html>