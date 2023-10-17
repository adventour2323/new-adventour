<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>


<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
<style>


    body {
        margin: 0;
        padding: 0;
    }

    .login_body {
        border: 1px solid #ccc;
        background-color: #F6F6F6;
        max-width: 400px;
        margin-right: auto;
        margin-left: auto;
        margin-top: 100px; /* 수정된 상단 여백 값 */
        margin-bottom: 0; /* 하단 여백 제거 */
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login_form {
        text-align: center;
    }

    .login_form h3 {
        color: #333;
    }

    .login_form input[type="text"],
    .login_form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .login_form input[type="submit"] {
        background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        width: 200px;
        font-size: 20px;
        border-radius: 3px;
        cursor: pointer;
    }

    .login_form input[type="submit"]:hover {
        background-color: #555;
    }

    .register_button {
        margin-top: 10px;
    }

    a {
        text-decoration: none;
        color: #333;
    }
</style>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
String id = (String) session.getAttribute("id");
if (id != null) {
%>
    <script>
    history.back();
    </script>
<%
}
%>



		<header>
			<% if (session.getAttribute("id") == null) { %>
    		<!-- header.html import -->
    		<jsp:include page="header.html"></jsp:include>
			<% } else { %>
    		<jsp:include page="header_login.jsp"></jsp:include>
			<% } %>
		</header>

<div class="login_body">
    <div class="login_form">
        <h3 style="text-align: center;">로그인</h3>
        <form action="login_merge.jsp" method="post" style="text-align: center;">
            <table align="center" style="padding: 0 20px;"> 
                <tr>
                    <td><label for="id">아이디</label></td>
                </tr>
                <tr>
                    <td><input type="text" name="id" id="id" style="width: 200px;"></td> 
                </tr>
                <tr>
                    <td><label for="pw">비밀번호</label></td>
                </tr>
                <tr>
                    <td><input type="password" name="pw" id="pw" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="로그인">
                        
                        <!-- <br>가이드 회원가입을 하고 싶으면 <a href="./g_member.html" style="cursor: pointer;">이곳을 누르세요</a> -->
                    </td>
                </tr>
                <tr>
                	<td>
                	<button type="button" onclick="location.href='member_pjs.html' " class="register_button">회원 가입</button>
                    <button type="button" onclick="location.href='g_member.html' " class="register_button">가이드 가입</button>
                	</td>
                </tr>
            </table>
        </form>
    </div>
</div>

<footer style="position: absolute; bottom: 0; width: 100%;">
    <jsp:include page="./footer.html"></jsp:include>
</footer>

</body>
</html>