<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main/main.css" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
</head>
<body>
	<style>
.loginImg {
	width: 30px;
	height: 30px;
	margin-top: 5px;
}

.logout {
	color: gray !important;
}

ul {
	list-style: none;
}
</style>


	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Banner -->
	<section id="banner">
	<div class="inner">
		<header>
		<h1>Welcome to my project !</h1>
		</header>

		<div class="flex ">

			<div>
				<span class="icon fa-shopping-cart"></span>
				<h3>shop</h3>
				<p>Let's overcome corona</p>
			</div>

			<div>
				<span class="icon fa-pencil-square-o"></span>
				<h3>notice</h3>
				<p>Communication board</p>
			</div>

			<div>
				<span class="icon fa-envelope"></span>
				<h3>nayoung</h3>
				<p>kimna0088@gmail.com</p>
			</div>

		</div>

		<footer> <a href="#" class="button">Get Started</a> </footer>
	</div>
	</section>


	<!-- Three -->
	<section id="three" class="wrapper align-center">
	<div class="inner">
		<div class="flex flex-2">
			<article>
			<div class="image round">
				<img class="image_round" src="images/talk2.jpg" alt="Pic 01" />
			</div>
			<header>
			<h3>
				Communication<br />board
			</h3>
			</header>
			<p>
				Space to communicate.
			</p>
			<footer> <a href="/boardList?currentPage=1" class="button">Learn
				More</a> </footer> </article>
			<article>
			<div class="image round">
				<img class="image_round" src="images/shop3.jpg" alt="Pic 02" />
			</div>
			<header>
			<h3>
				Let's overcome<br /> corona
			</h3>
			</header>
			<p>
				Wearing a mask is mandatory.
			</p>
			<footer> <a href="/shop/list?gdsCate=마스크" class="button">Learn
				More</a> </footer> </article>
		</div>
	</div>
	</section>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>


</body>
</html>








