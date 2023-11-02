<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
<%@ page import="getset.H_getset"%>
<%@ page import="java.util.*"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Timestamp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 리스트</title>
<style>
    /* 호텔 목록 스타일 */
    .hotel-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .hotel-card {
        width: calc(25% - 10px); /* 4개의 호텔이 가로로 나열되도록 설정, 10px은 간격 */
        margin-bottom: 20px;
        border: 1px solid #ccc;
        background-color: yellow;
    }

    .hotel-card img {
        width: 100%;
        height: auto;
    }

    .hotel-info {
        padding: 10px;
    }
</style>
</head>
<body>
    <jsp:useBean id="id" class="adventour.g_list_print">
        <%
            String t_id = request.getParameter("t_id");
            ArrayList<t_getset> a1 = id.t4(t_id);
        %>
        <%
            for (t_getset g : a1) {
        %>
        <div>
            <h3>호텔을 찾고 계시나요?</h3>
            <%
                String h_country = g.getCountry_eng();
                ArrayList<H_getset> hc = id.h3(h_country);

                // 호텔 목록을 섞어서 무작위 순서로 만듭니다
                Collections.shuffle(hc);

                // 처음 4개의 호텔을 선택합니다
                List<H_getset> randomHotels = hc.subList(0, 4);
                
                // 호텔 목록을 나열합니다
            %>
            <div class="hotel-list">
                <%
                    for (H_getset hotel : randomHotels) {
                %>
                <div class="hotel-card">
                    <div class="hotel-img">
                        <img alt="hotel" src="./image/hotel/h_image/<%= hotel.getH_pho() %>">
                    </div>
                    <div class="hotel-info">
                        <%= hotel.getCountry_ko() %>, <%= hotel.getCity_ko() %><br>
                        <%= hotel.getH_name_ko() %><br>
                        가격: <%= hotel.getH_roompri() %>, <%= hotel.getH_grade() %>급<br>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                }
            %>
        </div>
    </jsp:useBean>
</body>
</html>
