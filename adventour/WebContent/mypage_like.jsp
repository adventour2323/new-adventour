<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="adventour.Mypage_db" %>
<%@ page import="getset.H_getset" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>

    <style>
    .pagination {
  width: 900px;
  height: 10px;
 
  margin-bottom: 30px;

  text-align: center;
}
.pages_num{
margin-top: 15px;
}




    </style>
    
</head>
<script>

$(document).ready(function() {

    $('lili_1').on('mouseenter click', function() {
        $(this).css('background-color', '#D9E5FF');
    });

	$('lili_1').on('mouseleave', function() {
		  $(this).css('background-color', '');
		});
	
  
});

</script>
<body>
    <%
        // request attribute에서 폼 데이터 및 파일명을 가져옵니다.
        String m_id = request.getParameter("m_id");
        System.out.println("m_id: " + m_id); // ok

        Mypage_db m_like_db = new Mypage_db();
        ArrayList<getset.H_getset> m_like_db1 = m_like_db.m_h_like(m_id);

        // Pagination parameters
        int itemsPerPage = 5;
        int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
        int startIdx = (currentPage - 1) * itemsPerPage;
        int endIdx = Math.min(startIdx + itemsPerPage, m_like_db1.size());

        // Sublist for the current page
        ArrayList<getset.H_getset> currentPageList = new ArrayList<>(m_like_db1.subList(startIdx, endIdx));
    %>

    <ul>
        <%
            if (!currentPageList.isEmpty()) {
            	 for (int i = 0; i < currentPageList.size(); i++) {
                     H_getset bbb = currentPageList.get(i);
        %>
        <a name="<%=bbb.getH_name_eng() %>" href="information.hotel?uname=hotelinfom&hotelname=<%= bbb.getH_name_eng() %>">
                    <li class="lili_<%=i%>">
                        <p id="li_eng"><%= bbb.getH_name_eng()%></p>
                        <p id="li_ko"><%= bbb.getH_name_ko()%></p>
                        <p id="li_city"><%= bbb.getCountry_ko() %>, <%= bbb.getCity_ko()%></p>  
                        <input type="button" id="h_like_del_btn" class="h_like_del_btn" name="h_like_del_btn" value="삭제하기">    
                    </li>
          </a>
        <%
                }
            } else {
        %>
                <h2> 찜 내역이 없습니다.</h2>
        <%
            }
        %>
    </ul>

    <!-- Pagination links -->
    <div class="pagination">
        <%
            int totalPages = (int) Math.ceil((double) m_like_db1.size() / itemsPerPage);

            for (int i = 1; i <= totalPages; i++) {

            if (i == currentPage) { %>
              <span class="pages_num"><%= i %></span>
            <% } else { %>
              <a href="?page=<%= i %>"><%= i %></a>
            <% }
          }
        %>
     
      </div>
</body>
</html>
