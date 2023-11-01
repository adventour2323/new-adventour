<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.C_search" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="adventour.C_getset" %>
<%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>검색 결과</title>
      <link rel="stylesheet" type="text/css" href="css/c_search.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
  <script src="js/c_list.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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
                
               
                // 검색 결과를 표시
    %>
        <table>
            <tr>
              <th class="c_headnum">글 번호</th>
          <th class="c_list_title">제목</th>
          <th class="c_list_writer">작성자</th>
          <th class="c_list_date">작성일</th>
          <th class="c_country">국가</th>
          <th class="c_city">도시</th>
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
                <%
// obj.getC_date()에서 받은 원래 날짜 문자열
String originalDateStr = obj.getC_date();

// SimpleDateFormat을 사용하여 원하는 형식으로 날짜 포맷
SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");

try {
  Date originalDate = originalFormat.parse(originalDateStr);
  String formattedDateStr = targetFormat.format(originalDate);
%>
<td><a href='community_cont.jsp?c_num=<%= obj.getC_num() %>'><%= formattedDateStr %></a></td>
<%
} catch (Exception e) {
  e.printStackTrace();
  // 오류 처리
}
%>
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
