<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/main/main.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body class="subpage">
	<style>
.login_frm {
	width: 300px;
	font-size: 9pt !important;
}

.find {
	color: gray;
}

#loginBtn {
	color: black !important;
	width: 77.99px !important;
	height: 38px !important;
	box-shadow: inset 0 0 0 0px;
}
</style>

	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<header class="align-center">
		<h3>로그인</h3>
		<p>Welcome to my project!</p>
		</header>

		<center>


			<form role="form" action="/login" method="post" autocomplete="off">
				<table class="login_frm">
					<tr>
						<td>ID :</td>
						<td><input type="text" name="userId" required></td>
					</tr>
					<tr>
						<td>PW :</td>
						<td><input type="password" name="userPw" required></td>
					</tr>
					<tr>


					</tr>

				</table>

				<center>

					<button type="submit" id="loginBtn" class="btn btn-light">login</button>
					<a href="/signupFrm" id="" class="btn btn-light">sign up</a>
				</center>
			</form>


			<a class="find" href="/findIdFrm">아이디 찾기</a>&nbsp;&nbsp; <a
				class="find" href="/findPwFrm">비밀번호 찾기</a>

		</center>
	</div>
	</section>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>