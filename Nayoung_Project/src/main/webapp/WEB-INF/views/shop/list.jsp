<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰</title>
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
<body class="subpage">

	<style>
#goodsList {
	display: inline-block;
	margin: 10px;
}

.shopList {
	padding-left: 7em;
}

#gdsName {
	color: #6cc091;
	font-size: 15px !important;
	font-weight: 600;
}

#gdsPrice {
	color: #6cc091;
	font-size: 14px !important;
	font-weight: 400;
}

#thumbImg{
width: 300px;
height: 300px;
}
</style>



	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Three -->
	<section id="three" class="wrapper"> <header
		class="align-center">
	<a href="/shop/list?gdsCate=마스크"><h3>Shop</h3></a>
	<p>Welcome to my project!</p>
	</header> <%@ include file="/WEB-INF/views/include/shopMenu.jsp"%>
	<div class="inner">


		<br> <br> <br> <br> <br> <br>
		<ul class="shopList">
			<c:forEach items="${gList }" var="gList">
				<li id="goodsList">
					<div class="goodsThumb">
						<a href="/shop/view?gdsCode=${gList.gdsCode }"><img
							id="thumbImg" src="${gList.gdsThumbImg }"></a>
					</div>
					<div>
						<center>
							<a id="gdsName" href="/shop/view?gdsCode=${gList.gdsCode }">${gList.gdsName }<br>
								<div id="gdsPrice">
									<fmt:formatNumber pattern="###,###,###"
										value="${gList.gdsPrice}" />
									원
								</div>
							</a>
						</center>
					</div>
				</li>
			</c:forEach>
		</ul>



	</div>
	</section>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>






</body>
</html>