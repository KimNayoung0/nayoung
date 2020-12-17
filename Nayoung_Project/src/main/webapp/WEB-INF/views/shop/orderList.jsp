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

ul {
	list-style: none;
}

div#container_box ul li {
	border: 5px solid #eee;
	padding-top: 10px;
	padding-left: 450px;
	margin-bottom: 20px;
}

div#container_box .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}
</style>

	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>
	<%@include file="/WEB-INF/views/include/mypageVar.jsp"%>
	<div class="navi">
		<h1>My Page</h1>

		<div class="page-navi">
			<ul>
				<li><a href="/mypageFrm">마이페이지</a></li>
				<li><a id="a" href="/shop/orderList">주문내역</a></li>
				<li><a href="/messageFrm">문의내역</a></li>
			</ul>
		</div>
	</div>

	<!-- Three -->
	<section id="three" class="wrapper">

	<div class="inner">

		<div id="container_box">

			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호</span><a
									href="/shop/orderView?oCode=${orderList.oCode}">${orderList.oCode}</a>
							</p>
							<p>
								<span>수령인</span>${orderList.oName}</p>
							<p>
								<span>주소</span>(${orderList.oAddr1})${orderList.oAddr2}${orderList.oAddr3}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원
							</p>
							<p>
								<span>상태</span>${orderList.delivery }</p>
						</div>
					</li>
				</c:forEach>
			</ul>

		</div>

	</div>
	</section>



	<%@include file="/WEB-INF/views/include/footer.jsp"%>




</body>
</html>