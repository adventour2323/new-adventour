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

        System.out.println("아이디: " + m_id);
        System.out.println("이름: " + h_name_eng);

        C_dbsave h_dbsave = new C_dbsave();
        List<H_getset> h_like_selectList = h_dbsave.h_like_select(m_id, h_name_eng);
        
        boolean isSuccess = false; // isSuccess 변수를 블록 외부에서 선언

        if (h_like_selectList != null && !h_like_selectList.isEmpty()) {
            for (H_getset item : h_like_selectList) {
                String currentMId = item.getM_id();
                String currentHNameEng = item.getH_name_eng();
                
                System.out.println("아이디1: " + currentMId );
                System.out.println("이름1: " +  currentHNameEng);

                // 추가된 조건
                if (currentMId.equals(m_id) && currentHNameEng.equals(h_name_eng)) {
                    System.out.println("아이디22: " + m_id);
                    System.out.println("이름22: " + h_name_eng);
                    System.out.println("아이디122: " + currentMId );
                    System.out.println("이름122: " +  currentHNameEng);
                    isSuccess = true; 
                    break; // 이미 찾았으므로 더 이상 반복할 필요가 없습니다.
                }
            }
        }

        if (!isSuccess) {
            try {
                h_dbsave.h_likesave(m_id, h_name_eng);
                System.out.println("찜 저장 성공!");
            } catch (Exception e) {
                System.out.println("찜 저장 중 오류 발생: " + e.getMessage());
                e.printStackTrace();
            }
        }
    %>

    <script>
        <% if (isSuccess) { %>
            alert("이미 찜한 호텔입니다.");
        <% } else { %>
            alert("찜에 성공 하였습니다.");
        <% } %>
        window.history.back();
    </script>
</body>
</html>
