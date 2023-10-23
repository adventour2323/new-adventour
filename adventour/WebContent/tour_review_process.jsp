<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="java.sql.*, java.io.*, java.util.UUID" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>리뷰 작성 처리</title>
</head>
<body>
<%
    // 로그인 확인
    if (session.getAttribute("id") == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        window.location.href = document.referrer;
    </script>
<%
    } else {
        // 폼에서 전송된 데이터 가져오기
        String rating = request.getParameter("reviewStar"); // 별점
        String review_content = request.getParameter("review_content"); // 리뷰 내용
        String t_id = request.getParameter("t_id"); // 투어 ID
        String m_id = (String) session.getAttribute("id"); // 회원 ID

     // 필수 입력 값이 있는지 확인
        if (rating == null || review_content == null || t_id == null || m_id == null) {
        %>
            <script>
                alert("모든 필수 정보를 입력하세요.");
                window.location.href = document.referrer;
            </script>
        <%
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // 데이터베이스 연결
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/adventour?useUnicode=true&characterEncoding=UTF-8";
                conn = DriverManager.getConnection(url, "root", "qhdks12!@");

                if (conn == null) {
                    throw new Exception("데이터베이스에 연결할 수 없습니다.");
                }

                // SQL 쿼리 준비
                String insertQuery = "INSERT INTO tour_rating (t_review_id, t_review, t_rating, t_id, m_id, review_date) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);

                // 현재 날짜 및 시간 가져오기
                java.util.Date currentDate = new java.util.Date();
                Timestamp reviewDate = new Timestamp(currentDate.getTime());

                // UUID 생성 및 "t_id_" 추가
                String reviewID = t_id+"_" + UUID.randomUUID().toString();

                // 값 설정
                pstmt.setString(1, reviewID);
                pstmt.setString(2, review_content);
                pstmt.setInt(3, Integer.parseInt(rating));
                pstmt.setString(4, t_id);
                pstmt.setString(5, m_id);
                pstmt.setTimestamp(6, reviewDate);

                // SQL 실행
                int numRowsAffected = pstmt.executeUpdate();

                if (numRowsAffected < 1) {
        %>
                <script>
                    alert("리뷰를 저장할 수 없습니다.");
                    window.location.href = document.referrer;
                </script>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) {
                        pstmt.close();
                    }
                } catch (Exception ignored) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception ignored) {
                }
            }

            // 리퍼러(이전 페이지)로 리디렉션
            String referrer = request.getHeader("referer");
        %>
            <script>
                alert("리뷰가 성공적으로 등록되었습니다.");
                window.location.href = "<%= referrer %>";
            </script>
        <% } }%>
</body>
</html>
