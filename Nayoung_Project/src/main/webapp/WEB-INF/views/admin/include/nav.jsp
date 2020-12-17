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


	<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="/" class="logo"><strong>youngnaaa</strong></a>
		<nav id="nav"> <a href="/shop/list?gdsCate=마스크">shop</a> 
		<a href="/boardList?currentPage=1">notice</a> 
		<c:choose>
			<c:when test="${sessionScope.member.verify ==0}">
				<a href="/mypageFrm">mypage</a>
				<a href="/shop/cartList">cart</a>
				<a href="/logout" class="logout">logout</a>
			</c:when>

			<c:when test="${sessionScope.member.verify ==9}">
				<a href="/admin/adminPage?currentPage=1">adminpage</a>
				<a href="/logout" class="logout">logout</a>
			</c:when>

			<c:when test="${sessionScope.member == null}">
				<a href="/loginFrm">login</a>
			</c:when>
		</c:choose>
		
		
		</nav>

		<div class="btn" id="navPanelToggle">
			<span class="fa fa-bars"></span>
		</div>
		<!-- =버튼 -->

		<div id="menu">
			<!-- menuvar 창 -->
			<a href="/"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0) !important; border: none;">Home</a>
			<a href="/shop/list?gdsCate=마스크"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">shop</a> <a
				href="/boardList?currentPage=1"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">notice</a>
			<div onclick="history.back();" class="close"></div>
			<!-- close 버튼 -->
		</div>


		<script>
			$(".btn").click(function() {
				$("#menu,.page_cover,html").addClass("open");
				window.location.hash = "#open";
			});

			window.onhashchange = function() {
				if (location.hash != "#open") {
					$("#menu,.page_cover,html").removeClass("open");
				}
			};
		</script>

	</div>
	</header>

</body>
</html>