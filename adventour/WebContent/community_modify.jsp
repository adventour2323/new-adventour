<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="adventour.C_getset" %>
<%@ page import="adventour.C_dbsave" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>게시판 글 수정</title>
    <link rel="stylesheet" type="text/css" href="css/community_modify.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/community_modify.js"></script>
</head>

<body>

<%
if (session.getAttribute("id") == null) {
%>
<!-- header.html import -->
<div id="header"></div>
<%
} else {
%>
<jsp:include page="header_login.jsp" flush="true"></jsp:include>
<%
}
%>

<div class="c_modify_main">
    <h2>게시글 수정</h2>

    <%
    // C_getset 객체 생성
    C_getset obj = new C_getset();

    // 데이터베이스에서 게시글 정보를 가져오는 코드
    try {
        String c_num = request.getParameter("c_num"); // 게시글 번호를 파라미터로 받음
        C_dbsave db = new C_dbsave();
        ArrayList<C_getset> resultList = db.c_contshow(c_num);

        if (resultList.size() > 0) {
            obj = resultList.get(0); // 첫 번째 결과를 obj에 할당
        } else {
            // 오류 처리 또는 메시지 설정
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 오류 처리
    }
    %>

    <form action="c_database_modify.jsp" method="post">
        <input type="hidden" name="c_num" value="<%= obj.getC_num() %>">
        <div class="c_title_div" name="c_title_div">
            제목 : <input type="text" class="c_title" name="c_title" value="<%= obj.getC_title() %>">
        </div><!--c_title_div-->

        <div class="c_city_div" name="c_city_div">
            <div class="c_country" name="c_country">
                나라 : 
                <select name="c_country">
                    <option value="<%= obj.getCountry() %>"><%= obj.getCountry() %></option>
                    <option value="uk">영국</option>
                    <option value="ity">이탈리아</option>
                    <option value="fra">프랑스</option>
                    <option value="spa">스페인</option>
                    <!-- 다른 나라 옵션들 추가 -->
                </select>
            </div>
        
            <div class="c_city" name="c_city">
                도시 : 
                <select name="c_city">
                    <option value="<%= obj.getCity() %>"><%= obj.getCity() %></option>
                    <option value="lond">런던</option>
                    <option value="liv">리버풀</option>
                    <option value="eden">에든버러</option>
                    <option value="roma">로마</option>
                    <option value="vene">베네치아</option>
                    <!-- 다른 도시 옵션들 추가 -->
                </select>
            </div>
        </div>

        <div class="c_con_div" name="c_con_div">
            <textarea class="c_con" name="c_con"><%= obj.getC_cont() %></textarea>
        </div><!--c_con_div-->
        


    <h4 class="c_pho_title" name="c_pho_title"> * 이미지파일 첨부(선택)  </h4>
    
    <div class="c_pho1_div" name="c_pho1_div">
    <label for = "fileName1">이미지1 : </label> <input type="file" name="fileName1" id = "fileName1"> 
    </div><!--c_pho1_div-->
    
    <div class="c_pho_div" name="c_pho2_div">
      이미지2 : <input type="text" class="c_pho" name="c_pho2" placeholder="이미지2을 첨부하세요.">
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho3_div">
      이미지3 : <input type="text" class="c_pho" name="c_pho3" placeholder="이미지3을 첨부하세요.">
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho4_div">
      이미지4 : <input type="text" class="c_pho" name="c_pho4" placeholder="이미지4을 첨부하세요.">
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho5_div">
      이미지5 : <input type="text" class="c_pho" name="c_pho5" placeholder="이미지5을 첨부하세요.">
    </div><!--c_pho1_div-->

        <div class="c_btns">
            <input type="submit" class="c_modifybtn" name="c_modifybtn" value="게시글 수정">
        </div>
    </form>
</div><!--c_modify_main-->

<!-- footer.html import -->
<div id="footer"></div>

</body>

</html>
