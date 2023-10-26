<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<jsp:useBean id="id" class="adventour.g_list_print">
			<%
                String t_id = request.getParameter("t_id");
                
                ArrayList<t_getset> a1 = id.t4(t_id);
            %>
            <% for (t_getset g : a1) { %>
<div class="t_review_div">
        <table class="review-table">
            <tr id="review_top">
                <th>번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>날짜</th>
                <th>평점</th>
            </tr>
            <%
					ArrayList<t_r_getset> rv = id.t6(t_id); 
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 원하는 포맷 설정
					int count = rv.size(); // 댓글의 총 개수를 사용해서 초기 번호를 설정      
                               
                int itemsPerPage = 10; // 한 페이지당 아이템 개수
                int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // 페이지 번호를 받음

                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(startIndex + itemsPerPage, count);

          

                for (int i = startIndex; i < endIndex; i++) {
                    t_r_getset tr = rv.get(i);
                    String reviewDateString = tr.getReview_date();
                    Timestamp reviewTimestamp = Timestamp.valueOf(reviewDateString);
                    Date reviewDate = new Date(reviewTimestamp.getTime());
            %>
            <tr>
                <td><%= count %></td>
                <td><%= tr.getM_id() %></td>
                <td><%= tr.getT_review() %></td>
                <td><%= sdf1.format(reviewDate) %></td>
                <td> 
                    <div class="star-rating">
                        <%
                            int ratingStr = tr.getT_rating();
                            try {
                                int rating = ratingStr;
                                for (int j = 0; j < rating; j++) {
                        %>
                            <i class="fas fa-star" style="color: rgba(250, 208, 0, 0.99);"></i>
                        <%
                            }
                        } catch (NumberFormatException e) {
                            // 숫자로 파싱할 수 없는 경우에 대한 예외 처리
                        }
                        %>
                    </div>
                </td>
            </tr>
            <%
                count--;
            } 
            %>
        </table>	
        	
    </div><!-- t_review_div -->
    <%} %>
    </jsp:useBean>

</body>
</html>