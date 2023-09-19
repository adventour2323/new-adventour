<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">


<title>login</title>
</head>
<body>
  	<header id="header">
    	 <jsp:include page="header.html"></jsp:include>
	</header>    
  
	<%
	request.setCharacterEncoding("utf-8");
	%>
	
	<div class="login_form" style="text-align: center; margin-top: 200px; margin-bottom: 500px">
			<h3>로그인</h3>
		<form action="login_merge.jsp" method="post">
			아이디 : <input type="text" name="id" style="margin-bottom: 10px"><br>
			비밀번호 : <input type="password" name="pw" style="margin-bottom: 10px"> <br>
			<input type="submit" value="로그인">
			<button type="button" onclick="location.href='member_pjs.html' ">회원 가입</button>
			<button type="button" style="margin-top: 10px;" onclick="location.href='g_member.html' ">가이드 가입</button>
			<br>가이드 회원가입을 하고 싶으면 <a href="./g_member.html" style="cursor: pointer;">이곳을 누르세요</a>
		</form>
	</div>

         
    <footer id="">
	<jsp:include page="footer.html"></jsp:include>
	</footer>

	
</body>

<script type="text/javascript">
$(document).ready(function () {
$("#header").load("header.html");
$("#footer").load("footer.html");
}
</script>

</html>