<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/main/main.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body class="subpage">
	<style>
input {
	width: 300px !important;
	border: 1px solid #c4e5d3 !important;
	border-radius: 5px !important;
}

#findPwBtn {
	color: gray !important;
	height: 38px !important;
	box-shadow: inset 0 0 0 0px;
}

div{
padding-bottom: 150px !important;
}
</style>

	<%@include file="/WEB-INF/views/include/menuVar.jsp" %>


	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<header class="align-center">
		<h3>비밀번호 찾기</h3>
		<p>이메일 인증</p>
		</header>

		<center>
			<form action="/findPw" method="post" autocomplete="off">
				이름 <input type="text" name="userName" id="userName" required
					placeholder="이름 입력"><br> 연락처 <input type="text"
					required name="userPhon" id="userPhon" placeholder="연락처 입력"><br>
				아이디 <input type="text" name="userId" id="userId" required
					placeholder="아이디 입력"><br> <br>
				<button type="submit" id="findPwBtn" class="btn btn-light">확인</button>
			</form>

		</center>
	</div>
	</section>
	<%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>