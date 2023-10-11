<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="getset.guide_gs"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>ADVENTOUR - TOUR</title>
<link rel="stylesheet" type="text/css" href="./css/tour_index.css">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="./js/tour_incomplete.js"></script>
<script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
</head>
<body>
 
	<%-- <jsp:useBean id="id" class="adventour.g_list_print"> --%>
		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<div id="header"></div>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>

		<%
		List<guide_gs> a1 = (List<guide_gs>) request.getAttribute("list");
		
			/* ArrayList<g_getset> a1 = id.g1(); */
			/* ArrayList<t_getset> a2 = id.t1(); */
		%>
		<!-- 본문  -->

		<div class="content">

			<div id="guide_of_the_month">
				<div class="gom_ment">
					<h1 class="gom_comment" style="text-align: center; margin-bottom: 20px;">인기 가이드</h1>
				</div>


				<div class="tab_list"  style=" height: 300px; background-color: #f5f5f5">
					<input id="tab1" type="radio" name="tabs" checked>
					<!--디폴트 메뉴-->
					<label class="g_label" for="tab1">영국</label> 
					<input id="tab2" type="radio" name="tabs"> 
						<label class="g_label" for="tab2">프랑스</label> 
					<input id="tab3" type="radio" name="tabs">
						<label class="g_label" for="tab3">스페인</label> 
					<input id="tab4" type="radio" name="tabs"> 
						<label class="g_label" for="tab4">이탈리아</label>
					<div style="float: right; cursor: pointer; margin-top: auto;"
						onclick="location.href='./g_list.jsp'">전체보기</div>

					<section id="guide_uk">
						<!--  -->
						<%
							for (int i = 0; i < a1.size(); i++) {
								guide_gs g = a1.get(i);
									if (g.getG_country().equals("영국") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;">
										<a href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img() %>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<% }} %>
						<!--  -->
					</section>

					<section id="guide_fr">
						<%
							for (int i = 0; i < a1.size(); i++) {
								guide_gs g = a1.get(i);
									if (g.getG_country().equals("프랑스") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<%-- <% out.println("<img src='" + g.getG_img() + "' width='200px' alt='img'>"); %> --%>
													<img alt="img" src=" <%=g.getG_img() %>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>
						<% }} %>
					</section>

					<section id="guide_es">
						<%
							for (int i = 0; i < a1.size(); i++) {
								guide_gs g = a1.get(i);
									if (g.getG_country().equals("스페인") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img() %>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>

						<% }} %>
					</section>

					<section id="guide_ita">
						<% for (int i = 0; i < a1.size(); i++) {
								guide_gs g = a1.get(i);
									if (g.getG_country().equals("이탈리아") == true) {
						%>
						<div class="container" style="margin-right: 50px; float: left;">

							<table style="width: 100px;">
								<thead>
									<tr>
										<th style="cursor: pointer;"><a
											href="g_info.jsp?g_id=<%=g.getG_id()%>">
												<figure>
													<img alt="img" src=" <%=g.getG_img() %>" width="200px" height="200px">
													<figcaption>자세히보기</figcaption>
												</figure>
										</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="padding-top: 20px;"><%=g.getG_name()%></td>
									</tr>
								</tbody>
							</table>

						</div>

						<% }} %>
					</section>

				</div>
			</div>



	<jsp:useBean id="id" class="adventour.g_list_print">
			<!--  -->

    <div class="t_country" >
	
	<div> 
	<h1 style="float: left;"> 국가별 투어</h1>
	<div style="float: right; cursor: pointer;" onclick="location.href='main.tour?tour=tourlist'">전체보기</div> 
	<br><br><hr>
	</div>
	
        <div class="t_flag">
        
          <div class="ukimg" id="country_name">
            <img class="uk_flag" id="flag" src="image/img/uk.png">
            <h2 class="ukname">영국</h2>
          </div>
          
          <div class="fraimg" id="country_name">
            <img class="fr_flag" id="flag" src="image/img/fra.png">
            <h2 class="franame">프랑스</h2>
          </div>

          <div class="spaimg" id="country_name">
            <img class="es_flag" id="flag" src="image/img/spain.png">
            <h2 class="spaname">스페인</h2>
          </div>
          
          <div class="ityimg" id="country_name">
            <img class="ita_flag" id="flag" src="image/img/ity.png">
            <h2 class="ityname">이탈리아</h2>
          </div>

        </div>

    </div><!--h_recity-->
    			
			
			
			<div class="tour_banner" style="margin-top: 30px;">
				<div class="Slidesbackground"
					style="margin-top: 200px; margin-bottom: 50px; text-align: center;">

					<div name="test">
						<!-- 배너 사진 -->

						<% 
						/*  */
						ArrayList<t_getset> a2 = id.t1();
						/*  */
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("f_p_tour") == true) {
						%>

						<div class="slidetext fade">
							<img alt="" src="<%=t.getT_logo()%>">
						</div>
				<% } } %>
				
						<%
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("l_b_tour1") == true) {
						%>

						<div class="slidetext fade">
							<img alt="3" src="<%=t.getT_logo()%>">
						</div>
				<% } } %>

						<%
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("r_v_tour") == true) {
						%>

						<div class="slidetext fade">
							<img alt="" src="<%=t.getT_logo()%>">
						</div>
				<% } } %>

						<%
							for (int i = 0; i < a2.size(); i++) {
									t_getset t = a2.get(i);
									if (t.getT_id().equals("m_g_tour1") == true) {
						%>

						<div class="slidetext fade">
							<img alt="2" src="<%=t.getT_logo()%>">
						</div>
				<% } } %>
					</div>

				</div>
			</div>
			
				<h1 style="text-align: center;">인기 투어</h1>
			
			<div class="recommend_city" >
			
				<%
					for (int i = 0; i < a2.size(); i++) {
							t_getset t = a2.get(i);
							if (t.getT_id().equals("l_ston_tour") == true) {
				%>
				<div class="recommend_city1" >
					<div class="r_c_1_img">
						<img src="<%=t.getT_img1()%>"
							style="width: 237px; height: 154px; cursor: pointer;"
							alt="추천도시 1">
					</div>
					<div  style="text-overflow: ellipsis;">
					<h3 class="rocommend_1_title">
						<%=t.getT_name()%>
					</h3>
					</div>
					<div class="recommend_price" >
					 	₩ <%=t.getT_price()%>
					</div>
				</div>
				<% } } %>

				<%
					for (int i = 0; i < a2.size(); i++) {
							t_getset t = a2.get(i);
							if (t.getT_id().equals("m_g_tour1") == true) {
				%>
				<div class="recommend_city2">
					<div class="r_c_1_img">
						<img src="<%=t.getT_img1()%>"
							style="width: 237px; height: 154px; cursor: pointer;" alt="추천도시 2">
					</div>
					<div  style="text-overflow: ellipsis;">
					<h3 class="rocommend_1_title">
						<%=t.getT_name()%>
					</h3>
					</div>
					<div class="recommend_price">
						₩ <%=t.getT_price()%>
					</div>
				</div>
				<% }} %>

				<%
					for (int i = 0; i < a2.size(); i++) {
							t_getset t = a2.get(i);
							if (t.getT_id().equals("p_l_tour") == true) {
				%>
				<div class="recommend_city3">
					<div class="r_c_1_img">
						<img src="<%=t.getT_img1()%>"
							style="width: 237px; height: 154px; cursor: pointer;"
							alt="추천도시 3">
					</div>
					<div  style="text-overflow: ellipsis;">
					<h3 class="rocommend_1_title">
						<%=t.getT_name()%>
					</h3>
					</div>
					<div class="recommend_price">
						₩ <%=t.getT_price()%>
					</div>
				</div>
				<% }} %>

				<%
					for (int i = 0; i < a2.size(); i++) {
							t_getset t = a2.get(i);
							if (t.getT_id().equals("r_v_tour") == true) {
				%>
				<div class="recommend_city4"  style="text-overflow: ellipsis;">
					<div class="r_c_1_img">
						<img src="<%=t.getT_img1()%>" 
						style="width: 237px; height: 154px; cursor: pointer;" 
						alt="추천도시 4">
					</div>
					<div >
					<h3 class="rocommend_1_title">
						<%=t.getT_name()%>
					</h3>
					</div>
					<div class="recommend_price">
					 	₩ <%=t.getT_price()%>
					</div>
				</div>
				<% }} %>

			</div>

			<div class="recommend_ticket" style="margin-bottom: 50px;">
				<h3 style="text-align: center;">추천상품</h3>
				<div class="recommend_img">
				<img src="./image/tour/usim_.png"
					style="width: 300px; margin-left: 50px;" alt="추천 티켓/입장권 1">
				</div>
				<div class="recommend_img"> 
				<img
					src="./image/tour/pass_museum_paris.jpg"
					style="width: 300px; margin-left: 30px; margin-bottom: 10px" alt="추천 티켓/입장권 2">
				</div>
				<div class="recommend_img">
				<img
					src="./image/tour/colosseum_ticket.png"
					style="width: 300px; margin-left: 30px; margin-bottom: 20px;" alt="추천 티켓/입장권 3">
				</div>
			</div>

	</jsp:useBean>
		</div>  <!--content-->

		<footer>
			<div id="footer"></div>
		</footer>

	
</body>

<script>
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";

		setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
	}
</script>

<script>
	var slideIndextext = 0;
	showSlidestext();

	function showSlidestext() {
		var i;
		var slidetext = document.getElementsByClassName("slidetext");

		for (i = 0; i < slidetext.length; i++) {
			slidetext[i].style.display = "none";
		}
		slideIndextext++;
		if (slideIndextext > slidetext.length) {
			slideIndextext = 1
		}
		slidetext[slideIndextext - 1].style.display = "block";

		setTimeout(showSlidestext, 2000); // 2초마다 이미지가 체인지됩니다
	}
</script>
</html>