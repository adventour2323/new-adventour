<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.C_search" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>검색 결과</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8"); 
    String c_sch = request.getParameter("c_sch"); // 입력된 검색어 가져오기

    if (c_sch == null || c_sch.isEmpty()) {
        // 검색어가 비어 있으면 아무것도 반환하지 않음
    } else {
        C_search c_sch1 = new C_search();
        ArrayList<adventour.C_getset> searchResults = c_sch1.c_search(c_sch); // 검색 수행
        
        // 검색 결과를 표시할 HTML 코드를 생성
        %>
        <table>
            <tr>
                <th>글 번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>국가</th>
                <th>도시</th>
            </tr>
            <%
            for (adventour.C_getset obj : searchResults) {
                String countryName = obj.getCountry();
                String cityName = obj.getCity();
                
                // 국가 및 도시 이름 변환
                if ("uk".equals(countryName)) {
                    countryName = "영국";
                } else if ("ity".equals(countryName)) {
                    countryName = "이탈리아";
                } else if ("fra".equals(countryName)) {
                    countryName = "프랑스";
                } else if ("spa".equals(countryName)) {
                    countryName = "스페인";
                }
                
                if ("lond".equals(cityName)) {
                    cityName = "런던";
                } else if ("liv".equals(cityName)) {
                    cityName = "리버풀";
                } else if ("eden".equals(cityName)) {
                    cityName = "에든버러";
                } else if ("roma".equals(cityName)) {
                    cityName = "로마";
                } else if ("vene".equals(cityName)) {
                    cityName = "베네치아";
                } else if ("mila".equals(cityName)) {
                    cityName = "밀라노";
                } else if ("paris".equals(cityName)) {
                    cityName = "파리";
                } else if ("mars".equals(cityName)) {
                    cityName = "마르세유";
                } else if ("mona".equals(cityName)) {
                    cityName = "모나코";
                } else if ("mard".equals(cityName)) {
                    cityName = "마드리드";
                } else if ("barc".equals(cityName)) {
                    cityName = "바르셀로나";
                } else if ("sev".equals(cityName)) {
                    cityName = "세비야";
                }
            %>
            <tr>
                <td><%= obj.getC_num() %></td>
                <td class="c_list_title1"><%= obj.getC_title() %></td>
                <td><%= obj.getM_id() %></td>
                <td><%= obj.getC_date() %></td>
                <td><%= countryName %></td>
                <td><%= cityName %></td>
            </tr>
            <%
            }
            %>
        </table>
        <%
    }
    %>
</body>
</html>
